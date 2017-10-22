<?php
namespace App\Expense\Controllers;

use App\Expense\Models\Expense,
    App\Expense\Models\History,
    App\Expense\Models\Task,
    App\System\Models\Autonumber,
    App\Users\Models\User;

class ExpenseController extends \Micro\Controller {

    public function findAction() {
        $catagory = $this->request->getQuery('catagory');
        $catagory = empty($catagory) ? 'expense' : $catagory;

        return Expense::get()
            ->where('catagory = :catagory:', array('catagory' => $catagory))
            ->join('App\Statuses\Models\Status', 'a.status_id = status', 'a', 'left')
            ->sortable()
            ->filterable()
            ->paginate();
    }

    public function findByIdAction($id) {
        return Expense::get($id);
    }

    public function viewByIdAction($id) {
        $data = array();
        $expense = Expense::get($id)->data;

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
        $post = $this->request->getJson();
        $user = $this->auth->user();

        $post['exp_no'] = Autonumber::generate('EXPENSE');
        $post['status'] = 1;
        $post['id_user'] = $user['su_id'];
        $post['date'] = date('Y-m-d H:i:s');

        $data = new Expense();

        if ($data->save($post)) {
            return Expense::get($data->id_exp);
        }

        return Expense::none();
    }

    public function updateAction($id) {
        $post = $this->request->getJson();
        unset($post['date']);

        $query = Expense::get($id);

        if ($query->data) {
            if ($query->data->save($post)) {
                $query->data->updateAmounts();
            }
        }

        return $query;
    }

    public function deleteAction($id) {
        $query = Expense::get($id);

        if ($query->data) {
            $query->data->delete();
        }

        return array('success' => TRUE);
    }

    public function uploadByIdAction($id) {
        $query = Expense::get($id);

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
        $expense = Expense::get($id)->data;
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
                $superiors = $user->getSuperiors($expense->amounts);

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
        $expense = Expense::get($id)->data;
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
        $expense = Expense::get($id)->data;
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
                    ->join('App\Grades\Models\Grade', 'a.grade_id = App\Expense\Models\Task.grade_id', 'a')
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
        $expense = Expense::get($id)->data;
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

    public function cronAction() {
        $user = $this->auth->user();
        $date = date('Y-m-d h:i:s');
        $time = strtotime($date);
        $code = date('m/Y');

        $opex = Expense::findFirst("DATE_FORMAT(date, '%m/%Y') = '".$code."' AND catagory = 'opex'");

        if ($opex) {
            return array(
                'success' => TRUE,
                'data' => $opex->toArray()
            );
        }

        $opex = new Expense();
        $opex->exp_no = Autonumber::generate('OPEX');
        $opex->subject_exp = 'Opex '.$code;
        $opex->catagory = 'opex';
        $opex->date = $date;
        $opex->id_user = $user['su_id'];
        $opex->date_start = date('Y-m-01', $time);
        $opex->date_end = date('Y-m-t', $time);
        $opex->other_purpose = NULL;
        $opex->status = 1;

        if ($opex->save()) {
            return Expense::get($opex->id_exp);
        } else {
            print_r($opex->getMessages());
        }

        return Expense::none();
    }
}