<?php
namespace App\Expense\Controllers;

use App\Expense\Models\Expense,
    App\Expense\Models\History,
    App\System\Models\Autonumber,
    App\Users\Models\User,
    App\Statuses\Models\Status;

class ExpenseController extends \Micro\Controller {

    public function findAction() {
        $category = $this->request->getQuery('category');
        $category = empty($category) ? 'expense' : $category;

        return Expense::get()
            ->join('App\Statuses\Models\Status', 'a.status_id = status', 'a', 'left')
            ->sortable()
            ->filterable()
            ->andWhere('category = :category:', array('category' => $category))
            ->paginate();
    }

    public function testAction($id) {
        $expense = Expense::get($id)->data;
        if ($expense) {
            $expense->faSubmit('receive-request');
        }
    }

    public function findByIdAction($id) {
        return Expense::get($id);
    }

    public function viewByIdAction($id) {
        $data = array();
        $expense = Expense::get($id)->data;

        $data['expense'] = $expense->toArray();
        $data['items'] = $expense->getGroupedItems();
        $data['summary'] = $expense->getSummary();
        $data['crops'] = $expense->crops->filter(function($elem){ return $elem->toArray(); });
        $data['exchanges'] = $expense->exchanges->filter(function($elem){ return $elem->toArray(); });
        $data['history'] = $expense->getHistory(array('order' => 'exp_history_id ASC'))->filter(function($elem){
            return $elem->toArray();
        });

        return array(
            'success' => TRUE,
            'data' => $data
        );
    }

    public function summaryByIdAction($id) {
        $expense = Expense::get($id)->data;

        $summary = array(
            'expense' => array(),
            'remains' => array()
        );

        if ($expense) {
            $summary = $expense->getSummary();
        }

        return array(
            'success' => TRUE,
            'data' => $summary
        );
    }

    public function journalsByIdAction($id) {
        $expense = Expense::get($id)->data;
        
        $result = array(
            'success' => TRUE,
            'data' => array()
        );

        if ($expense) {
            $result['data'] = $expense->getJournals();
        }
        
        return $result;
    }

    public function createAction() {
        $post = $this->request->getJson();
        $user = $this->auth->user();

        $post['exp_no'] = Autonumber::generate('EXPENSE');
        $post['status'] = Status::val('draft');
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
        
        if ($expense) {
            $expense->submit();
        }

        return array('success' => TRUE);
    }

    public function rejectByIdAction($id) {
        $expense = Expense::get($id)->data;
        $post = $this->request->getJson();

        if ($expense) {
            $expense->reject($post);
        }

        return array(
            'success' => TRUE
        );
    }

    public function approveByIdAction($id) {
        $expense = Expense::get($id)->data;
        $post = $this->request->getJson();

        if ($expense) {
            $expense->approve($post);
        }

        return array(
            'success' => TRUE
        );
    }

    public function returnedByIdAction($id) {
        $expense = Expense::get($id)->data;
        $post = $this->request->getJson();

        if ($expense) {
            $expense->returned($post);
        }
        
        return array(
            'success' => TRUE
        );
    }

    public function faReceiveByIdAction($id) {
        $expense = Expense::get($id)->data;
        $user = $this->auth->user();
        $post = $this->request->getJson();

        if ($expense) {
            $status = Status::val('fa-received');

            // create history
            $history = new History();

            $history->id_exp = $expense->id_exp;
            $history->status_id = $status;
            $history->user_act = $user['su_id'];
            $history->date = date('Y-m-d H:i:s');
            $history->notes = $post['notes'];

            $history->save();

            // delete tasks
            \App\Tasks\Models\Task::find(array(
                't_type = :type: AND t_link = :link:',
                'bind' => array(
                    'type' => 'expense-receive',
                    'link' => $expense->id_exp
                )
            ))->delete();

            $expense->received_by = $user['su_id'];
            $expense->received_date = date('Y-m-d H:i:s');
            $expense->status = $status;

            if ($expense->save()) {
                $expense->faSubmit('approval-request');
            }
        }

        return array(
            'success' => TRUE
        );
    }

    public function faApproveByIdAction($id) {
        $expense = Expense::get($id)->data;
        $user = $this->auth->user();
        $post = $this->request->getJson();

        if ($expense) {
            // delete tasks
            \App\Tasks\Models\Task::find(array(
                't_type = :type: AND t_link = :link:',
                'bind' =>array(
                    'type' => 'expense-finance',
                    'link' => $expense->id_exp
                )
            ))->delete();


            // tambah history
            $history = new History();
            $history->id_exp = $expense->id_exp;

            $status = Status::val('fa-approved');
            $notes = isset($post['notes']) ? $post['notes'] : '-';

            $history->status_id = $status;
            $history->user_act = $user['su_id'];
            $history->date = date('Y-m-d H:i:s');
            $history->notes = $notes;
            $history->save();

            // update status
            $expense->status = $status;
            $expense->save();

        }

        return array(
            'success' => TRUE
        );
    }

    public function faRejectByIdAction($id) {
        $expense = Expense::get($id)->data;
        $user = $this->auth->user();
        $post = $this->request->getJson();

        if ($expense) {
            // delete tasks
            \App\Tasks\Models\Task::find(array(
                't_type = :type: AND t_link = :link:',
                'bind' =>array(
                    'type' => 'expense-finance',
                    'link' => $expense->id_exp
                )
            ))->delete();

            $status = Status::val('reject');

            // tambah history
            $history = new History();
            $history->id_exp = $expense->id_exp;
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

    public function faReturnedByIdAction($id) {
        $expense = Expense::get($id)->data;
        $user = $this->auth->user();
        $post = $this->request->getJson();

        if ($expense) {
            // delete tasks
            \App\Tasks\Models\Task::find(array(
                't_type = :type: AND t_link = :link:',
                'bind' =>array(
                    'type' => 'expense-finance',
                    'link' => $expense->id_exp
                )
            ))->delete();

            $status = Status::val('change-request');

            // tambah history
            $history = new History();
            $history->id_exp = $expense->id_exp;
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

    public function cronAction() {
        $user = $this->auth->user();
        $post = $this->request->getJson();
        $date = (isset($post['date']) && ! empty($post['date'])) ? $post['date'].' '.date('H:i:s') : date('Y-m-d H:i:s');

        $time = strtotime($date);
        $code = date('m/Y', $time);

        $opex = Expense::findFirst("
            DATE_FORMAT(date, '%m/%Y') = '".$code."' 
            AND category = 'opex' 
        ");

        if ($opex) {
            return array(
                'success' => TRUE,
                'data' => $opex->toArray()
            );
        }

        $opex = new Expense();
        $opex->exp_no = Autonumber::generate('OPEX');
        $opex->subject_exp = 'Opex '.$code;
        $opex->category = 'opex';
        $opex->date = $date;
        $opex->id_user = $user['su_id'];
        $opex->date_start = date('Y-m-01', $time);
        $opex->date_end = date('Y-m-t', $time);
        $opex->other_purpose = NULL;
        $opex->status = Status::val('draft');

        if ($opex->save()) {
            return Expense::get($opex->id_exp);
        } else {
            print_r($opex->getMessages());
        }

        return Expense::none();
    }

    public function currenciesByIdAction($id) {
        $expense = Expense::get($id)->data;
        $currencies = array();

        if ($expense) {
            $currencies = $expense->getCurrencies();
        }

        return array(
            'success' => TRUE,
            'data' => $currencies
        );
    }

    
}