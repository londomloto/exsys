<?php
namespace App\Advance\Controllers;

use App\Advance\Models\Advance,
    App\Advance\Models\History,
    App\Advance\Models\Task,
    App\System\Models\Autonumber,
    App\Users\Models\User;

class AdvanceController extends \Micro\Controller {

    public function findAction() {
        return Advance::get()
            ->join('App\Statuses\Models\Status', 'a.status_id = status', 'a', 'left')
            ->sortable()
            ->filterable()
            ->paginate();
    }

    public function findByIdAction($id) {
        return Advance::get($id);
    }

    public function viewByIdAction($id) {
        $data = array();
        $advance = Advance::get($id)->data;

        $data['advance'] = $advance->toArray();

        $data['items'] = $advance->items->filter(function($elem){
            return $elem->toArray();
        });

        $data['history'] = $advance->getHistory(array('order' => 'adv_history_id ASC'))->filter(function($elem){
            return $elem->toArray();
        });

        return array(
            'success' => TRUE,
            'data' => $data
        );
    }

    public function createAction() {
        $post = $this->request->getJson();
        $user = $this->auth->user();

        $post['adv_no'] = Autonumber::generate('ADVANCE');
        $post['status'] = 1;
        $post['id_user'] = $user['su_id'];
        $post['amounts'] = 0;

        $data = new Advance();

        if ($data->save($post)) {
            return Advance::get($data->id_adv);
        } else {
            print_r($data->getMessages());
        }

        return Advance::none();
    }

    public function updateAction($id) {
        $post = $this->request->getJson();
        $query = Advance::get($id);

        if ($query->data) {
            $query->data->save($post);
            $query->data->updateAmounts();
        }

        return $query;
    }

    public function deleteAction($id) {
        $query = Advance::get($id);

        if ($query->data) {
            $query->data->delete();
        }

        return array('success' => TRUE);
    }

    public function uploadByIdAction($id) {
        $query = Advance::get($id);

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
        $advance = Advance::get($id)->data;
        $user = $this->auth->user();

        if ($advance) {
            // create history
            $history = new History();
            $history->id_adv = $advance->id_adv;
            $history->status_id = 2;
            $history->user_act = $user['su_id'];
            $history->date = date('Y-m-d H:i:s');

            if ($history->save()) {
                $advance->status = $history->status_id;
                $advance->save();

                $user = User::get($user['su_id'])->data;

                // entry task
                $superiors = $user->getSuperiors(10000000);

                foreach($superiors as $super) {
                    $task = new Task();

                    $task->id_adv = $advance->id_adv;
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
        $advance = Advance::get($id)->data;
        $user = $this->auth->user();
        $post = $this->request->getJson();

        if ($advance) {
            // delete tasks
            Task::find(array(
                'id_adv = :advance:',
                'bind' => array(
                    'advance' => $advance->id_adv
                )
            ))->delete();

            // tambah history
            $history = new History();
            $history->id_adv = $advance->id_adv;
            $history->status_id = 7;
            $history->user_act = $user['su_id'];
            $history->date = date('Y-m-d H:i:s');
            $history->notes = $post['notes'];

            $history->save();

            // update status
            $advance->status = 7;
            $advance->save();
        }

        return array(
            'success' => TRUE
        );
    }

    public function approveByIdAction($id) {
        $advance = Advance::get($id)->data;
        $user = $this->auth->user();
        $post = $this->request->getJson();

        if ($advance) {
            // delete lower tasks 
            if ($user['su_grade_type'] == 'verificator') {
                Task::find(array(
                    'id_adv = :advance: AND su_id = :user:',
                    'bind' => array(
                        'advance' => $advance->id_adv,
                        'user' => $user['su_id']
                    )
                ))->delete();    
            } else if ($user['su_grade_type'] == 'approver') {
                $tasks = Task::get()
                    ->where('id_adv = :advance: AND a.grade_limit <= :limit:', array(
                        'advance' => $advance->id_adv,
                        'limit' => (int) $user['su_grade_limit']
                    ))
                    ->join('App\Grades\Models\Grade', 'a.grade_id = App\Advance\Models\Task.grade_id', 'a')
                    ->execute();

                foreach($tasks as $task) {
                    $task->delete();
                }
            }

            // tambah history
            $history = new History();
            $history->id_adv = $advance->id_adv;

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
            $advance->status = $status;
            $advance->save();
        }

        return array(
            'success' => TRUE
        );
    }

    public function requestByIdAction($id) {
        $advance = Advance::get($id)->data;
        $user = $this->auth->user();
        $post = $this->request->getJson();

        if ($advance) {
            // delete tasks
            Task::find(array(
                'id_adv = :advance:',
                'bind' => array(
                    'advance' => $advance->id_adv
                )
            ))->delete();

            // tambah history
            $history = new History();
            $history->id_adv = $advance->id_adv;
            $history->status_id = 10;
            $history->user_act = $user['su_id'];
            $history->date = date('Y-m-d H:i:s');
            $history->notes = $post['notes'];

            $history->save();

            // update status
            $advance->status = 10;
            $advance->save();
        }

        return array(
            'success' => TRUE
        );
    }
}