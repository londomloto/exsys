<?php
namespace App\Advance\Controllers;

use App\Advance\Models\Advance,
    App\Advance\Models\History,
    App\System\Models\Autonumber,
    App\Users\Models\User,
    App\Statuses\Models\Status,
    App\Tasks\Models\Task;

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
                    ->alias('a')
                    ->join('App\Statuses\Models\Status', 'b.status_id = a.status', 'b', 'left')
                    ->join('App\Types\Models\Type', 'c.type_id = a.type', 'c', 'left')
                    ->sortable()
                    ->filterable()
                    ->andWhere('a.id_user = :user: AND c.type_code <> :type:', array(
                        'user' => $user['su_id'],
                        'type' => 'travelling'
                    ))
                    // ->andWhere(
                    //     "id_user = :user: AND (b.type_code <> :type: OR (b.type_code = 'travelling' AND a.status_code NOT IN ('draft')))", 
                    //     array(
                    //         'user' => $user['su_id'],
                    //         'type' => 'travelling'
                    //     )
                    // )
                    ->paginate();
        }
    }

    public function findByIdAction($id) {
        return Advance::get($id);
    }

    public function viewByIdAction($id) {
        $data = array();
        $advance = Advance::get($id)->data;

        if ($advance) {
            $data['advance'] = $advance->toArray();
            $data['items'] = $advance->items->filter(function($elem){ return $elem->toArray(); });
            
            $data['history'] = $advance->getHistory(array(
                'category = :category:',
                'bind' => array('category' => 'advance'),
                'order' => 'adv_history_id ASC'
            ))->filter(function($elem){
                return $elem->toArray();
            }); 

            $data['summary'] = $advance->getSummary();    
        }

        return array(
            'success' => TRUE,
            'data' => $data
        );
    }

    public function findRefundAction() {
        $user = $this->auth->user();
        $statuses = array(
            Status::val('outstanding'),
            Status::val('closed')
        );

        $result = Advance::get()
            ->filterable()
            ->andWhere('id_user = :user:', array('user' => $user['su_id']))
            ->inWhere('status', $statuses)
            ->sortable()
            ->orderBy('date DESC') 
            ->paginate();

        return $result;
    }

    public function viewRefundByIdAction($id) {
        $data = array(
            'advance' => NULL,
            'advance_summary' => NULL,
            'expense' => NULL,
            'expense_summary' => NULL,
            'refund_history' => array()
        );

        $advance = Advance::get($id)->data;

        if ($advance) {
            $data['advance'] = $advance->toArray();
            $data['advance_summary'] = $advance->getSummary();

            if ($advance->expense) {
                $data['expense'] = $advance->expense->toArray();
                $data['expense_summary'] = $advance->expense->getSummary();
            }

            $data['refund_history'] = $advance->getHistory(array(
                'category = :category:',
                'bind' => array('category' => 'advance-refund'),
                'order' => 'adv_history_id ASC'
            ))->filter(function($elem){
                return $elem->toArray();
            }); 
        }

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
                    $type = $file->getExtension();
                    $name = 'advance_'.$query->data->id_adv.'.'.$type;
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
        $advance = Advance::get($id)->data;
        if ($advance && $advance->hasAttachment()) {
            $this->file->download($advance->getAttachment());
        } else {
            throw new \Phalcon\Exception("Attachemnt doesn't exists", 404);
            
        }
    }

    public function submitByIdAction($id) {
        $advance = Advance::get($id)->data;
        
        if ($advance) {
            $advance->submit();
        }

        return array('success' => TRUE);
    }

    public function refundSubmitByIdAction($id) {
        $advance = Advance::get($id)->data;
        $user = $this->auth->user();

        if ($advance) {
            $status = Status::val('submitted');

            // create history
            $history = new History();
            $history->category = 'advance-refund';
            $history->id_adv = $advance->id_adv;
            $history->status_id = $status;
            $history->user_act = $user['su_id'];
            $history->date = date('Y-m-d H:i:s');
            $history->save();

            $subscribers = User::findInRoles(array('fa-approver'));

            foreach($subscribers as $sub) {
                $task = new \App\Tasks\Models\Task();
                
                $task->t_type = 'advance-refund';
                $task->t_link = $advance->id_adv;
                $task->t_code = $advance->adv_no;
                $task->t_user = $sub->su_id;
                $task->t_date = date('Y-m-d H:i:s');
                $task->t_read = 0;

                $task->save();
            }

            $advance->refund_status = $status;
            $advance->save();
        }

        return array(
            'success' => TRUE
        );
    }

    public function rejectByIdAction($id) {
        $advance = Advance::get($id)->data;
        $post = $this->request->getJson();

        if ($advance) {
            $advance->reject($post);
        }

        return array(
            'success' => TRUE
        );
    }

    public function approveByIdAction($id) {
        $advance = Advance::get($id)->data;
        $post = $this->request->getJson();

        if ($advance) {
            $advance->approve($post);

        }

        return array(
            'success' => TRUE
        );
    }

    public function refundApproveByIdAction($id) {
        $advance = Advance::get($id)->data;
        $user = $this->auth->user();
        $post = $this->request->getJson();

        if ($advance) {
            
            // delete refund tasks
            \App\Tasks\Models\Task::find(array(
                't_type = :type: AND t_link = :link:',
                'bind' => array(
                    'type' => 'advance-refund',
                    'link' => $advance->id_adv
                )
            ))->delete();

            // tambah refund history
            $history = new History();
            $history->category = 'advance-refund';
            $history->id_adv = $advance->id_adv;

            $status = Status::val('fa-approved');
            $notes = isset($post['notes']) ? $post['notes'] : '-';

            $history->status_id = $status;
            $history->user_act = $user['su_id'];
            $history->date = date('Y-m-d H:i:s');
            $history->notes = $notes;
            $history->save();

            // update status
            $advanceStatus = Status::val('closed');
            $advance->status = $advanceStatus;
            $advance->refund_status = $status;
            $advance->save();
            
            // tambah advance history
            $history = new History();
            $history->category = 'advance';
            $history->status_id = $advanceStatus;
            $history->id_adv = $advance->id_adv;
            $history->user_act = $user['su_id'];
            $history->date = date('Y-m-d H:i:s');
            $history->notes = $notes;
            $history->save();

        }

        return array(
            'success' => TRUE
        );
    }

    public function returnedByIdAction($id) {
        $advance = Advance::get($id)->data;
        $post = $this->request->getJson();

        if ($advance) {
            $advance->returned($post);
        }

        return array(
            'success' => TRUE
        );
    }

    public function refundReturnedByIdAction($id) {
        $advance = Advance::get($id)->data;
        $user = $this->auth->user();
        $post = $this->request->getJson();

        if ($advance) {
            
            // delete refund tasks
            \App\Tasks\Models\Task::find(array(
                't_type = :type: AND t_link = :link:',
                'bind' => array(
                    'type' => 'advance-refund',
                    'link' => $advance->id_adv
                )
            ))->delete();

            // tambah refund history
            $history = new History();
            $history->category = 'advance-refund';
            $history->id_adv = $advance->id_adv;

            $status = Status::val('change-request');
            $notes = isset($post['notes']) ? $post['notes'] : '-';

            $history->status_id = $status;
            $history->user_act = $user['su_id'];
            $history->date = date('Y-m-d H:i:s');
            $history->notes = $notes;
            $history->save();

            $advance->refund_status = $status;
            $advance->save();
        }

        return array(
            'success' => TRUE
        );
    }

    public function faReceiveByIdAction($id) {
        $advance = Advance::get($id)->data;
        $user = $this->auth->user();
        $post = $this->request->getJson();

        if ($advance) {
            $status = Status::val('fa-received');

            // create history
            $history = new History();
            $history->category = 'advance';
            $history->id_adv = $advance->id_adv;
            $history->status_id = $status;
            $history->user_act = $user['su_id'];
            $history->date = date('Y-m-d H:i:s');
            $history->notes = $post['notes'];

            $history->save();
            
            // delete tasks
            \App\Tasks\Models\Task::find(array(
                't_type = :type: AND t_link = :link:',
                'bind' => array(
                    'type' => 'advance-receive',
                    'link' => $advance->id_adv
                )
            ))->delete();
            
            $advance->received_by = $user['su_id'];
            $advance->received_date = date('Y-m-d H:i:s');
            $advance->status = $status;
            
            if ($advance->save()) {
                $advance->faSubmit('approval-request');
            }
        }

        return array(
            'success' => TRUE
        );
    }

    public function faApproveByIdAction($id) {
        $user = \Micro\App::getDefault()->auth->user();
        $advance = Advance::get($id)->data;
        $post = $this->request->getJson();

        if ($advance) {
            // delete tasks
            Task::dispose(Task::TYPE_ADVANCE_FINANCE, $advance, TRUE);

            $status = Status::val('fa-approved');
            $notes = isset($post['notes']) ? $post['notes'] : '-';

            // update status
            $advance->status = $status;
            $advance->is_open = 1;
            if($advance->save()){
                $user = \Micro\App::getDefault()->auth->user();
                $items = $advance->items->filter(function($elem){ return $elem->toArray(); });
                $summary = $advance->getSummary();
                $params = json_encode(array(
                    "SessionId" => date_timestamp_get(date_create()),
                    "CompanyId" => "1",
                    "AdvId" => $advance->adv_no,
                    "Date" => $advance->date,
                    "Nik" => $user['su_nip'],
                    "Description" => $advance->subject_adv,
                    "TotalLine" => count($items),
                    "Value" => $summary[0]['currency_code'].';'.$summary[0]['summary_value'],
                ));

                if($_SERVER['SERVER_NAME']=='researchs.one'){
                    $url = 'http://'.$_SERVER['SERVER_NAME'].'/ax/submitadv.php';
                }else{
                    $url = 'http://192.168.100.24:82/api/advance/submit/';
                }

                $advance->sendAdvanceToAx($id,$url,$params);
            }

            // tambah history
            History::log('advance', $advance, $notes);
        }

        return array(
            'success' => TRUE
        );
    }

    public function faRejectByIdAction($id) {
        $advance = Advance::get($id)->data;
        $post = $this->request->getJson();

        if ($advance) {
            $notes = isset($post['notes']) ? $post['notes'] : '-';
            $status = Status::val('reject');

            // delete tasks
            Task::dispose(Task::TYPE_ADVANCE_FINANCE, $advance, TRUE);

            // update advance
            $advance->status = $status;
            $advance->is_open = 0;
            $advance->save();

            // create history
            History::log('advance', $advance, $notes);
        }

        return array(
            'success' => TRUE
        );
    }

    public function faReturnedByIdAction($id) {
        $advance = Advance::get($id)->data;
        $post = $this->request->getJson();
        
        if ($advance) {
            $notes = isset($post['notes']) ? $post['notes'] : '-';
            $status = Status::val('change-request');

            // delete tasks
            Task::dispose(Task::TYPE_ADVANCE_FINANCE, $advance, TRUE);
            
            // update advance
            $advance->status = $status;
            $advance->is_open = 0;
            $advance->save();
            
            // create history
            History::log('advance', $advance, $notes);

            $user = \Micro\App::getDefault()->auth->user();
            $items = $advance->items->filter(function($elem){ return $elem->toArray(); });
            $summary = $advance->getSummary();
            $params = json_encode(array(
                "SessionId" => date_timestamp_get(date_create()),
                "CompanyId" => "1",
                "AdvId" => $advance->adv_no,
                "Date" => $advance->date,
                "Nik" => $user['su_nip'],
                "Description" => $advance->subject_adv,
                "TotalLine" => count($items),
                "Value" => $summary[0]['currency_code'].';'.$summary[0]['summary_value'],
            ));

            if($_SERVER['SERVER_NAME']=='researchs.one'){
                $url = 'http://'.$_SERVER['SERVER_NAME'].'/ax/submitadv.php';
            }else{
                $url = 'http://192.168.100.24:82/api/advanceret/submit';
            }

            $advance->sendAdvanceToAx($id,$url,$params);
        }
        
        return array(
            'success' => TRUE
        );
    }

    public function axSubmitAction()
    {
        $post = $this->request->getPost();
        $query = Advance::findFirst(array(
            "adv_no = :adv_no:",
            'bind' => array(
                'adv_no' => $post['adv_no']
            )
        ));
        $params['status']=$post['code'];
        if ($query) {
            if($query->save($params)){
                return json_encode(array('success'=>TRUE,'data'=>$query));
            }else{
                return json_encode(array('success'=>FALSE));
            }
        }
    }

    public function axReturnSubmitAction()
    {
        $post = $this->request->getPost();
        $query = Advance::findFirst(array(
            "adv_no = :adv_no:",
            'bind' => array(
                'adv_no' => $post['adv_no']
            )
        ));
        $params['status']=$post['code'];
        if ($query) {
            if($query->save($params)){
                // return json_encode(array('success'=>TRUE,'data'=>$query));
                return json_encode(array('success'=>TRUE));
            }else{
                return json_encode(array('success'=>FALSE));
            }
        }
    }
}