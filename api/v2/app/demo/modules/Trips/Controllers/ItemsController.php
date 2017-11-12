<?php
namespace App\Trips\Controllers;

use App\Trips\Models\Item,
    App\Trips\Models\ItemHistory,
    App\Trips\Models\Trip,
    App\Users\Models\User,
    App\Tasks\Models\Task,
    App\Statuses\Models\Status;

class ItemsController extends \Micro\Controller {

    public function findAction() {
        $params = $this->request->getParams();
        $query = Item::get();
        
        if (isset($params['trip'])) {
            $query->where('id_trip = :trip:', array('trip' => $params['trip']));
        }

        return $query->paginate();
    }

    public function findByIdAction($id) {
        return Item::get($id);
    }

    public function createAction() {
        $post = $this->request->getJson();
        $data = new Item();
        if ($data->save($post)) {
            return Item::get($data->trip_item_id);
        }
        return Item::none();
    }

    public function updateAction($id) {
        $post = $this->request->getJson();

        // fixup time
        if (isset($post['transport_departure_time'])) {
            $time = $post['transport_departure_time'];
            $time = str_replace('.', ':', $time);
            $post['transport_departure_time'] = $time;
        }

        $query = Item::get($id);

        if ($query->data) {
            $query->data->save($post);
        }

        return $query;
    }

    public function deleteAction($id) {
        $query = Item::get($id);

        if ($query->data) {
            $query->data->delete();
        }

        return array('success' => TRUE);
    }

    public function uploadByIdAction($id) {
        $query = Item::get($id);

        if ($query->data) {
            if ($this->request->hasFiles()) {
                foreach($this->request->getFiles() as $file) {
                    $type = $file->getExtension();
                    $name = 'ticket_'.$query->data->trip_item_id.'.'.$type;
                    $path = APPPATH.'public/resources/attachments/'.$name;

                    if (@$file->moveTo($path)) {
                        $query->data->save(array(
                            'attachment' => $name
                        ));
                    }
                }
            }
        }

        return $query;
    }

    public function downloadByIdAction($id) {
        $item = Item::get($id)->data;
        if ($item && $item->hasAttachment()) {
            $this->file->download($item->getAttachment());
        } else {
            throw new \Phalcon\Exception("Attachment doesn't exists!");
        }
    }

    public function rescheduleByIdAction($id) {
        $query = Item::get($id);
        $post = $this->request->getJson();

        if ($query->data) {
            // save to history
            $data = $query->data->toArray();
            $data['status'] = Item::STATUS_RESCHEDULING;
            $data['history_date'] = date('Y-m-d H:i:s');
            $hist = new ItemHistory();
            $hist->save($data);

            $item = $query->data;
            $item->status = Item::STATUS_RESCHEDULING;
            $item->save($post);

            // create ticketing tasks
            if ($item->trip) {

                // update trip ticket status
                $item->trip->status = Status::val('rescheduling');
                $item->trip->ticket_status = Trip::STATUS_TICKET_RESCHEDULING;
                $item->trip->save();

                // add trip history
                \App\Trips\Models\History::log('trip', $item->trip, 'Request for ticket rescheduling');

                $subscribers = User::findInRoles(array('ticketing'));

                foreach($subscribers as $sub) {
                    $task = Task::findFirst(array(
                        't_type = :type: AND t_link = :link: AND t_user = :user:',
                        'bind' => array(
                            'type' => 'trip-ticket-reschedule',
                            'link' => $item->trip->id_trip,
                            'user' => $sub->su_id
                        )
                    ));

                    if ( ! $task) {
                        Task::log('trip-ticket-reschedule', $sub->su_id, $item->trip);
                    }

                }
            }
            
        }

        return $query;
    }

    public function historyByIdAction($id) {
        return ItemHistory::get()
            ->where('trip_item_id = :id:', array('id' => $id))
            ->orderBy('history_date DESC')
            ->paginate();
    }

}