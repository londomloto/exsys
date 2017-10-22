<?php
namespace App\Trips\Controllers;

use App\Trips\Models\Trip,
    App\Trips\Models\History,
    App\Trips\Models\Task,
    App\System\Models\Autonumber,
    App\Users\Models\User;

class TripsController extends \Micro\Controller {

    public function findAction() {
        return Trip::get()
            ->join('App\Statuses\Models\Status', 'a.status_id = status', 'a', 'left')
            ->sortable()
            ->filterable()
            ->paginate();
    }

    public function findByIdAction($id) {
        return Trip::get($id);
    }

    public function viewByIdAction($id) {
        $data = array();
        $expense = Trip::get($id)->data;

        $data['expense'] = $expense->toArray();
        $data['items'] = $expense->getGroupedItems();

        $data['history'] = $expense->getHistory(array('order' => 'exp_history_id ASC'))->filter(function($elem){
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

        $data = new Trip();

        if ($data->save($post)) {
            return Trip::get($data->id_trip);
        }

        return Trip::none();
    }

    public function updateAction($id) {
        $post = $this->request->getJson();
        $query = Trip::get($id);

        if ($query->data) {
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
        $expense = Trip::get($id)->data;
        $user = $this->auth->user();

        if ($expense) {
            // create history
            $history = new History();
            $history->id_exp = $expense->id_exp;
            $history->status_id = 2;
            $history->user_act = $user['su_id'];
            $history->date = date('Y-m-d H:i:s');

            if ($history->save()) {
                $expense->status = $history->status_id;
                $expense->save();

                $user = User::get($user['su_id'])->data;

                // entry task
                $superiors = $user->getSuperiors(10000000);

                foreach($superiors as $super) {
                    $task = new Task();

                    $task->id_exp = $expense->id_exp;
                    $task->su_id = $super['user_id'];
                    $task->grade_id = $super['grade_id'];
                    $task->is_allowed = 1;
                    
                    $task->save();
                }
            }
        }

        return array('success' => TRUE);
    }

    public function rejectByIdAction($id) {
        $expense = Trip::get($id)->data;
        $user = $this->auth->user();
        $post = $this->request->getJson();

        if ($expense) {
            // delete tasks
            Task::find(array(
                'id_exp = :expense:',
                'bind' => array(
                    'expense' => $expense->id_exp
                )
            ))->delete();

            // tambah history
            $history = new History();
            $history->id_exp = $expense->id_exp;
            $history->status_id = 7;
            $history->user_act = $user['su_id'];
            $history->date = date('Y-m-d H:i:s');
            $history->notes = $post['notes'];

            $history->save();

            // update status
            $expense->status = 7;
            $expense->save();
        }

        return array(
            'success' => TRUE
        );
    }

    public function approveByIdAction($id) {
        $expense = Trip::get($id)->data;
        $user = $this->auth->user();
        $post = $this->request->getJson();

        if ($expense) {
            // delete lower tasks 
            if ($user['su_grade_type'] == 'verificator') {
                Task::find(array(
                    'id_exp = :expense: AND su_id = :user:',
                    'bind' => array(
                        'expense' => $expense->id_exp,
                        'user' => $user['su_id']
                    )
                ))->delete();    
            } else if ($user['su_grade_type'] == 'approver') {
                $tasks = Task::get()
                    ->where('id_exp = :expense: AND a.grade_limit <= :limit:', array(
                        'expense' => $expense->id_exp,
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
            $history->id_exp = $expense->id_exp;

            $status = NULL;

            if ($user['su_grade_type'] == 'verificator') {
                $status = 9;
            } else {
                if ($user['su_grade_limit'] >= 15000000) {
                    $status = 4;
                } else {
                    $status = 3;
                }
            }

            $history->status_id = $status;
            $history->user_act = $user['su_id'];
            $history->date = date('Y-m-d H:i:s');
            $history->notes = $post['notes'];

            $history->save();

            // update status
            $expense->status = $status;
            $expense->save();
        }

        return array(
            'success' => TRUE
        );
    }

    public function requestByIdAction($id) {
        $expense = Trip::get($id)->data;
        $user = $this->auth->user();
        $post = $this->request->getJson();

        if ($expense) {
            // delete tasks
            Task::find(array(
                'id_exp = :expense:',
                'bind' => array(
                    'expense' => $expense->id_exp
                )
            ))->delete();

            // tambah history
            $history = new History();
            $history->id_exp = $expense->id_exp;
            $history->status_id = 10;
            $history->user_act = $user['su_id'];
            $history->date = date('Y-m-d H:i:s');
            $history->notes = $post['notes'];

            $history->save();

            // update status
            $expense->status = 10;
            $expense->save();
        }

        return array(
            'success' => TRUE
        );
    }
}