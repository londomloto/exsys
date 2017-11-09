<?php
namespace App\Trips\Controllers;

use App\Trips\Models\Trip,
    App\Trips\Models\History,
    App\System\Models\Autonumber,
    App\Users\Models\User,
    App\Statuses\Models\Status;

class TripsController extends \Micro\Controller {

    public function findAction() {
        $user = $this->auth->user();

        return Trip::get()
            ->join('App\Statuses\Models\Status', 'a.status_id = status', 'a', 'left')
            ->sortable()
            ->filterable()
            ->andWhere('id_user = :user:', array('user' => $user['su_id']))
            ->paginate();
    }

    public function findByIdAction($id) {
        return Trip::get($id);
    }

    public function viewByIdAction($id) {
        $data = array();
        $trip = Trip::get($id)->data;

        $data['trip'] = $trip->toArray();
        $data['items'] = $trip->items->filter(function($elem){
            return $elem->toArray();
        });

        $data['history'] = $trip->getHistory(array('order' => 'trip_history_id ASC'))->filter(function($elem){
            return $elem->toArray();
        });

        return array(
            'success' => TRUE,
            'data' => $data
        );
    }

    public function createAction() {
        $user = $this->auth->user();
        $post = $this->request->getJson();
        
        $post['trip_no'] = Autonumber::generate('TRIP');
        $post['status'] = 1;
        $post['id_user'] = $user['su_id'];
        $post['date'] = date('Y-m-d H:i:s');

        $data = new Trip();

        if ($data->save($post)) {
            if ($data->advance) {
                $data->amounts = $data->advance->amounts;
                $data->save();
            }
            return Trip::get($data->id_trip);
        }

        return Trip::none();
    }

    public function updateAction($id) {
        $post = $this->request->getJson();
        unset($post['date']);
        
        $query = Trip::get($id);

        if ($query->data) {
            if ($query->data->advance) {
                $query->data->amounts = $query->data->advance->amounts;
                $query->data->save();
            }
            $query->data->save($post);
        }

        return $query;
    }

    public function deleteAction($id) {
        $query = Trip::get($id);

        if ($query->data) {
            $query->data->delete();
        }

        return array('success' => TRUE);
    }

    public function uploadByIdAction($id) {
        $query = Trip::get($id);

        if ($query->data) {
            if ($this->request->hasFiles()) {
                foreach($this->request->getFiles() as $file) {
                    $type = $file->getExtension();
                    
                    $name = 'trip_'. $query->data->id_trip.'.'.$type;
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
        $data = Trip::get($id)->data;
        if ($data->hasAttachment()) {
            $this->file->download($data->getAttachment());
        } else {
            throw new \Phalcon\Exception("Attachment doesn't exists", 404);
        }
    }

    public function submitByIdAction($id) {
        $trip = Trip::get($id)->data;

        if ($trip) {
            $trip->submit();
        }
        
        return array('success' => TRUE);
    }

    public function rejectByIdAction($id) {
        $trip = Trip::get($id)->data;
        $post = $this->request->getJson();

        if ($trip) {
            $trip->reject($post);
        }

        return array(
            'success' => TRUE
        );
    }

    public function approveByIdAction($id) {
        $trip = Trip::get($id)->data;
        $post = $this->request->getJson();

        if ($trip) {
            $trip->approve($post);
        }

        return array(
            'success' => TRUE
        );
    }

    public function returnedByIdAction($id) {
        $trip = Trip::get($id)->data;
        $post = $this->request->getJson();

        if ($trip) {
            $trip->returned($post);
        }

        return array(
            'success' => TRUE
        );
    }

    public function finishTicketByIdAction($id) {
        $trip = Trip::get($id)->data;
        $user = $this->auth->user();

        if ($trip) {
            // delete tasks
            \App\Tasks\Models\Task::find(array(
                't_type = :type: AND t_link = :link:',
                'bind' => array(
                    'type' => 'trip-ticket',
                    'link' => $trip->id_trip
                )
            ))->delete();

            // update trip status;
            $status = Status::val('ticket-issued');

            $trip->ticket_status = 1;
            $trip->status = $status;
            $trip->save();

            // log history
            $history = new History();
            $history->id_trip = $trip->id_trip;
            $history->status_id = $status;
            $history->user_act = $user['su_id'];
            $history->date = date('Y-m-d H:i:s');
            $history->save();
        }

        return array(
            'success' => TRUE
        );
    }   

    public function rejectTicketByIdAction($id) {
        $trip = Trip::get($id)->data;
        $user = $this->auth->user();

        if ($trip) {
            // delete tasks
            \App\Tasks\Models\Task::find(array(
                't_type = :type: AND t_link = :link:',
                'bind' => array(
                    'type' => 'trip-ticket',
                    'link' => $trip->id_trip
                )
            ))->delete();

            $status = Status::val('no-ticket');

            $trip->ticket_status = 2;
            $trip->status = $status;
            $trip->save();
            
            // log history
            $history = new History();
            $history->id_trip = $trip->id_trip;
            $history->status_id = $status;
            $history->user_act = $user['su_id'];
            $history->date = date('Y-m-d H:i:s');
            $history->save();
        }

        return array(
            'success' => TRUE
        );
    }
}