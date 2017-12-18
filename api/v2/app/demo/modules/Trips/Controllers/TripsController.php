<?php
namespace App\Trips\Controllers;

use App\Trips\Models\Trip,
    App\Trips\Models\History,
    App\Trips\Models\Item,
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

        $params = $this->request->getParams();
        $action = isset($params['action']) ? $params['action'] : NULL;

        if ($trip) {
            $trip->reject($post, $action);
        }

        return array(
            'success' => TRUE
        );
    }

    public function approveByIdAction($id) {
        $trip = Trip::get($id)->data;
        $post = $this->request->getJson();

        $params = $this->request->getParams();
        $action = isset($params['action']) ? $params['action'] : NULL;

        if ($trip) {
            $trip->approve($post, $action);
        }

        return array(
            'success' => TRUE
        );
    }

    public function returnedByIdAction($id) {
        $trip = Trip::get($id)->data;
        $post = $this->request->getJson();

        $params = $this->request->getParams();
        $action = isset($params['action']) ? $params['action'] : NULL;

        if ($trip) {
            $trip->returned($post, $action);
        }

        return array(
            'success' => TRUE
        );
    }

    public function acceptTicketByIdAction($id) {
        $trip = Trip::get($id)->data;

        if ($trip) {
            $trip->acceptTicket();
        }

        return array(
            'success' => TRUE
        );
    }

    public function rejectTicketByIdAction($id) {
        $trip = Trip::get($id)->data;
        
        if ($trip) {
            $trip->rejectTicket();
        }

        return array(
            'success' => TRUE
        );
    }

    public function acceptRescheduleByIdAction($id) {
        $trip = Trip::get($id)->data;

        if ($trip) {
            $trip->acceptReschedule();
        }

        return array(
            'success' => TRUE
        );
    }

    public function rejectRescheduleByIdAction($id) {
        $trip = Trip::get($id)->data;
        
        if ($trip) {
            $trip->rejectReschedule();
        }

        return array(
            'success' => TRUE
        );
    }
}