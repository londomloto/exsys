<?php
namespace App\Trips\Controllers;

use App\Trips\Models\Trip,
    App\Trips\Models\History,
    App\Trips\Models\Task,
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
                    // $type = $file->getExtension();
                    $name = $query->data->attachment;
                    $path = APPPATH.'public/resources/attachments/'.$name;

                    if (@$file->moveTo($path)) {
                        // $query->data->save(array(
                        //     'attachment' => $name
                        // ));
                    }
                }
            }
        }

        return $query;
    }

    public function submitByIdAction($id) {
        $trip = Trip::get($id)->data;
        $user = $this->auth->user();
        $done = FALSE;

        if ($trip) {
            // create history
            $history = new History();
            $history->id_trip = $trip->id_trip;
            $history->status_id = 2;
            $history->user_act = $user['su_id'];
            $history->date = date('Y-m-d H:i:s');

            if ($history->save()) {
                $trip->status = $history->status_id;
                $trip->save();

                $user = User::get($user['su_id'])->data;

                // entry task
                $superiors = $user->getSuperiors($trip->getAmounts());

                foreach($superiors as $super) {
                    $task = new Task();

                    $task->id_trip = $trip->id_trip;
                    $task->su_id = $super['user_id'];
                    $task->grade_id = $super['grade_id'];
                    $task->is_allowed = 1;
                    
                    $task->save();
                }

                // submit advance if any
                if ($trip->advance) {
                    $trip->advance->submit();
                }

                $done = TRUE;
            }
        }

        return array('success' => $done);
    }

    public function rejectByIdAction($id) {
        $trip = Trip::get($id)->data;
        $user = $this->auth->user();
        $post = $this->request->getJson();

        if ($trip) {
            // delete tasks
            Task::find(array(
                'id_trip = :trip:',
                'bind' => array(
                    'trip' => $trip->id_trip
                )
            ))->delete();

            $status = Status::val('reject');

            // tambah history
            $history = new History();
            $history->id_trip = $trip->id_trip;
            $history->status_id = $status;
            $history->user_act = $user['su_id'];
            $history->date = date('Y-m-d H:i:s');
            $history->notes = $post['notes'];

            $history->save();

            // update status
            $trip->status = $status;
            $trip->save();

            // sync advance
            if ($trip->advance) {
                $trip->advance->reject($post);
            }
        }

        return array(
            'success' => TRUE
        );
    }

    public function approveByIdAction($id) {
        $trip = Trip::get($id)->data;
        $user = $this->auth->user();
        $post = $this->request->getJson();

        if ($trip) {
            // delete lower tasks 
            if ($user['su_grade_type'] == 'verificator') {
                Task::find(array(
                    'id_trip = :trip: AND su_id = :user:',
                    'bind' => array(
                        'trip' => $trip->id_trip,
                        'user' => $user['su_id']
                    )
                ))->delete();
            } else if ($user['su_grade_type'] == 'approver') {
                $tasks = Task::get()
                    ->where('id_trip = :trip: AND a.grade_limit <= :limit:', array(
                        'trip' => $trip->id_trip,
                        'limit' => (int) $user['su_grade_limit']
                    ))
                    ->join('App\Grades\Models\Grade', 'a.grade_id = App\Trips\Models\Task.grade_id', 'a')
                    ->execute();

                foreach($tasks as $task) {
                    $task->delete();
                }
            }

            // tambah history
            $history = new History();
            $history->id_trip = $trip->id_trip;

            $status = NULL;

            if ($user['su_grade_type'] == 'verificator') {
                $status = Status::val('verified');
            } else {
                if ($user['su_grade_limit'] >= 15000000) {
                    $status = Status::val('final-approved');
                } else {
                    $status = Status::val('approved');
                }
            }

            $history->status_id = $status;
            $history->user_act = $user['su_id'];
            $history->date = date('Y-m-d H:i:s');
            $history->notes = $post['notes'];

            $history->save();

            // update status
            $trip->status = $status;
            $trip->save();

            // sync advance
            if ($trip->advance) {
                $trip->advance->approve($post);
            }

            if ($trip->status == Status::val('final-approved')) {
                $trip->requestTicket();
            }

        }

        return array(
            'success' => TRUE
        );
    }

    public function requestByIdAction($id) {
        $trip = Trip::get($id)->data;
        $user = $this->auth->user();
        $post = $this->request->getJson();

        if ($trip) {
            // delete tasks
            Task::find(array(
                'id_exp = :trip:',
                'bind' => array(
                    'trip' => $trip->id_trip
                )
            ))->delete();

            $status = Status::val('change-request');

            // tambah history
            $history = new History();
            $history->id_trip = $trip->id_trip;
            $history->status_id = $status;
            $history->user_act = $user['su_id'];
            $history->date = date('Y-m-d H:i:s');
            $history->notes = $post['notes'];

            $history->save();

            // update status
            $trip->status = $status;
            $trip->save();

            if ($trip->advance) {
                $trip->advance->returned($post);
            }
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
            \App\Tickets\Models\Task::find(array(
                'id_trip = :trip: AND su_id = :user:',
                'bind' => array(
                    'trip' => $trip->id_trip,
                    'user' => $user['su_id']
                )
            ))->delete();

            $trip->ticket_status = 1;
            $trip->save();
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
            \App\Tickets\Models\Task::find(array(
                'id_trip = :trip: AND su_id = :user:',
                'bind' => array(
                    'trip' => $trip->id_trip,
                    'user' => $user['su_id']
                )
            ))->delete();

            $trip->ticket_status = 2;
            $trip->save();
        }

        return array(
            'success' => TRUE
        );
    }
}