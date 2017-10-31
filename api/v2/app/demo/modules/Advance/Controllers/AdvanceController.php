<?php
namespace App\Advance\Controllers;

use App\Advance\Models\Advance,
    App\Advance\Models\History,
    App\Advance\Models\Task,
    App\System\Models\Autonumber,
    App\Users\Models\User,
    App\Statuses\Models\Status;

class AdvanceController extends \Micro\Controller {

    public function findAction() {
        $params = $this->request->getParams();
        $display = isset($params['display']) ? $params['display'] : FALSE;
        $user = $this->auth->user();

        switch($display) {
            case 'trip':
                break;
            default:
                return Advance::get()
                    ->join('App\Statuses\Models\Status', 'a.status_id = status', 'a', 'left')
                    ->sortable()
                    ->filterable()
                    ->andWhere('type <> :type:', array('type' => 1))
                    ->andWhere('id_user = :user:', array('user' => $user['su_id'])) 
                    ->paginate();
        }
    }

    public function findByIdAction($id) {
        return Advance::get($id);
    }

    public function viewByIdAction($id) {
        $data = array();
        $advance = Advance::get($id)->data;

        $data['advance'] = $advance->toArray();
        $data['items'] = $advance->items->filter(function($elem){ return $elem->toArray(); });
        $data['history'] = $advance->getHistory(array('order' => 'adv_history_id ASC'))->filter(function($elem){
            return $elem->toArray();
        }); 

        $data['summary'] = $advance->getSummary();

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
        $post['date'] = date('Y-m-d H:i:s');

        $data = new Advance();

        if ($data->save($post)) {
            return Advance::get($data->id_adv);
        }/* else {
            print_r($data->getMessages());
        }*/

        return Advance::none();
    }

    public function updateAction($id) {
        $post = $this->request->getJson();
        unset($post['date']);
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
        $success = FALSE;

        if ($advance) {
            $success = $advance->submit();
        }

        return array('success' => $success);
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

            $status = Status::val('reject');

            // tambah history
            $history = new History();
            $history->id_adv = $advance->id_adv;
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
            $advance->status = $status;
            $advance->save();

            if ($status == Status::val('final-approved')) {
                $advance->faSubmit('receive-request');
            }
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

            $status = Status::val('change-request');

            // tambah history
            $history = new History();
            $history->id_adv = $advance->id_adv;
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

    public function faReceiveByIdAction($id) {
        $advance = Advance::get($id)->data;
        $user = $this->auth->user();

        if ($advance) {
            // delete tasks
            \App\Finance\Models\Task::find(array(
                'id_ref = :advance: AND module = :module: AND action = :action:',
                'bind' => array(
                    'module' => 'advance',
                    'action' => 'receive-request',
                    'advance' => $advance->id_adv
                )
            ))->delete();
            
            $advance->received_by = $user['su_id'];
            $advance->received_date = date('Y-m-d H:i:s');
            
            if ($advance->save()) {
                $advance->faSubmit('approval-request');
            }
        }

        return array(
            'success' => TRUE
        );
    }

    public function faApproveByIdAction($id) {
        $advance = Advance::get($id)->data;
        $user = $this->auth->user();
        $post = $this->request->getJson();

        if ($advance) {
            // delete tasks
            \App\Finance\Models\Task::find(array(
                'id_ref = :advance: AND module = :module: AND action = :action:',
                'bind' => array(
                    'module' => 'advance',
                    'action' => 'approval-request',
                    'advance' => $advance->id_adv
                )
            ))->delete();

            // tambah history
            $history = new History();
            $history->id_adv = $advance->id_adv;

            $status = Status::val('fa-approved');
            $notes = isset($post['notes']) ? $post['notes'] : '-';

            $history->status_id = $status;
            $history->user_act = $user['su_id'];
            $history->date = date('Y-m-d H:i:s');
            $history->notes = $notes;
            $history->save();

            // update status
            $advance->status = $status;
            $advance->save();

        }

        return array(
            'success' => TRUE
        );
    }
}