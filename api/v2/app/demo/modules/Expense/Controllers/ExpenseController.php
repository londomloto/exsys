<?php
namespace App\Expense\Controllers;

use App\Expense\Models\Expense,
    App\Expense\Models\History,
    App\System\Models\Autonumber,
    App\Users\Models\User,
    App\Tasks\Models\Task,
    App\Items\Models\Item as mItem,
    App\Statuses\Models\Status;

class ExpenseController extends \Micro\Controller {

    public function findAction() {
        $category = $this->request->getQuery('category');
        $category = empty($category) ? 'expense' : $category;
        $user = $this->auth->user();

        return Expense::get()
            ->join('App\Statuses\Models\Status', 'a.status_id = status', 'a', 'left')
            ->sortable()
            ->filterable()
            ->andWhere('category = :category: AND id_user = :user:', array(
                'category' => $category,
                'user' => $user['su_id']
            ))
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
        $data['crops'] = $expense->getGroupedCrops();
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
                    $type = $file->getExtension();
                    $name = 'expense_'.$query->data->id_exp.'.'.$type;
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

            /*begin send to AX*/
            $user = \Micro\App::getDefault()->auth->user();
            $items = $expense->getGroupedItems();

            $value='';
            $totalItem = '';
            foreach ($items as $key => $val) {
                $totalItem = count($val['group_items']);
                $x=0;
                foreach ($val['group_items'] as $key => $expitem) {
                    $coa = (isset($expitem['coa']))?$expitem['coa'].';':'';
                    $value .= $coa.$expitem['currency_code'].';'.$expitem['amounts_formatted'];
                    $x++;
                    if($totalItem > $x) $value .='#';
                }
            }

            $params = json_encode(array(
                "SessionId" => date_timestamp_get(date_create()),
                "CompanyId" => "1",
                "AdvId" => $expense->exp_no,
                "Date" => $expense->date,
                "Nik" => $user['su_nip'],
                "Description" => $expense->subject_exp,
                "TotalLine" => count($totalItem),
                "Value" => $value,
            ));

            if($_SERVER['SERVER_NAME']=='researchs.one'){
                $url = 'http://'.$_SERVER['SERVER_NAME'].'/ax/submitadv.php';
            }else{
                $url = 'http://192.168.100.24:82/api/expense/submitaccr/';
            }

            $expense->sendAdvanceToAx($id,$url,$params);
            /*end send to AX*/
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
            $expense->received_by = $user['su_id'];
            $expense->received_date = date('Y-m-d H:i:s');
            $expense->status = $status;

            if ($expense->save()) {
                // delete task
                Task::dispose(Task::TYPE_EXPENSE_RECEIVE, $expense);

                // create history
                History::log($expense->category, $expense, $post['notes']);

                // submit to fa
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

            if ($expense->advance) {
                $summary = $expense->getSummary();
                
                // nanti status dapet dari AX... (demo only)
                $outstanding = array_filter($summary['remains'], function($elem){
                    return $elem['remains_value'] > 0;
                });

                if (count($outstanding)) {
                    $expense->advance->status = Status::val('outstanding');
                } else {
                    $expense->advance->status = Status::val('closed');
                }

                $expense->advance->save();
                
                /*begin send to AX*/
                $user = \Micro\App::getDefault()->auth->user();
                $items = $expense->getGroupedItems();

                $value='';
                $totalItem = '';
                foreach ($items as $key => $val) {
                    $totalItem = count($val['group_items']);
                    $x=0;
                    foreach ($val['group_items'] as $key => $expitem) {
                        $coa = (isset($expitem['coa']))?$expitem['coa'].';':'';
                        $value .= $coa.$expitem['currency_code'].';'.$expitem['amounts_formatted'];
                        $x++;
                        if($totalItem > $x) $value .='#';
                    }
                }

                $params = json_encode(array(
                    "SessionId" => date_timestamp_get(date_create()),
                    "CompanyId" => "1",
                    "ExpId" => $expense->exp_no,
                    "AdvId" => isset($expense->adv_no)?$expense->adv_no:'',
                    "Date" => $expense->date,
                    "Nik" => $user['su_nip'],
                    "Description" => $expense->subject_exp,
                    "TotalLine" => count($totalItem),
                    "Value" => $value,
                ));
                
                if($_SERVER['SERVER_NAME']=='researchs.one'){
                    $url = 'http://'.$_SERVER['SERVER_NAME'].'/ax/submitadv.php';
                }else{
                    $url = 'http://192.168.100.24:82/api/expense/submitsettl/';
                }

                $expense->sendAdvanceToAx($id,$url,$params);
                /*end send to AX*/
            }

        }

        return array(
            'success' => TRUE
        );
    }

    public function hrApproveByIdAction($id) {
        $data = Expense::get($id)->data;
        $user = $this->auth->user();
        $post = $this->request->getJson();

        if ($data) {
            // dispose tasks
            Task::dispose(Task::TYPE_EXPENSE_HR, $data);

            $status = Status::val('hr-approved');
            $notes = isset($post['notes']) ? $post['notes'] : '-';
            
            // update status
            $data->status = $status;
            $done = $data->save();

            // log history
            History::log('expense', $data, $notes);

            if ($done) {
                $data->faSubmit('receive-request');
            }
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

    public function hrRejectByIdAction($id) {
        $data = Expense::get($id)->data;
        $user = $this->auth->user();
        $post = $this->request->getJson();

        if ($data) {
            // dispose tasks
            Task::dispose(Task::TYPE_EXPENSE_HR, $data);

            // update status
            $status = Status::val('reject');
            $data->status = $status;
            $data->save();

            // log history
            History::log('expense', $data, $post['notes']);
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

    public function hrReturnedByIdAction($id) {
        $data = Expense::get($id)->data;
        $user = $this->auth->user();
        $post = $this->request->getJson();

        if ($data) {
            // dispose tasks
            Task::dispose(Task::TYPE_EXPENSE_HR, $data);

            // update status
            $status = Status::val('change-request');
            $data->status = $status;
            $data->save();

            // log history
            History::log('expense', $data, $post['notes']);
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

        $opex = Expense::findFirst(array(
            "DATE_FORMAT(date, '%m%Y') = :code: AND category = 'opex' AND id_user = :user:",
            'bind' => array(
                'code' => $code,
                'user' => $user['su_id']
            )
        ));

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

    public function axSubmitAction()
    {
        $post = $this->request->getPost();
        $query = Expense::findFirst(array(
            "exp_no = :exp_no:",
            'bind' => array(
                'exp_no' => $post['exp_no']
            )
        ));
        $params['status']=$post['code'];
        if ($query) {
            if($query->save($params)){
                return json_encode(array('success'=>TRUE));
            }else{
                return json_encode(array('success'=>FALSE));
            }
        }
    }
    
}