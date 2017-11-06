<?php
namespace App\Advance\Controllers;

use App\Advance\Models\Advance,
    App\Advance\Models\History,
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

        if ($advance) {
            $data['advance'] = $advance->toArray();
            $data['items'] = $advance->items->filter(function($elem){ return $elem->toArray(); });
            $data['history'] = $advance->getHistory(array('order' => 'adv_history_id ASC'))->filter(function($elem){
                return $elem->toArray();
            }); 

            $data['summary'] = $advance->getSummary();    
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
        
        if ($advance) {
            $advance->submit();
        }

        return array('success' => TRUE);
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

    public function faReceiveByIdAction($id) {
        $advance = Advance::get($id)->data;
        $user = $this->auth->user();
        $post = $this->request->getJson();

        if ($advance) {
            $status = Status::val('fa-received');
            // create history
            $history = new History();

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
        $advance = Advance::get($id)->data;
        $user = $this->auth->user();
        $post = $this->request->getJson();

        if ($advance) {
            
            // delete tasks
            \App\Tasks\Models\Task::find(array(
                't_type = :type: AND t_link = :link:',
                'bind' => array(
                    'type' => 'advance-finance',
                    'link' => $advance->id_adv
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

    public function faReturnedByIdAction($id) {
        $advance = Advance::get($id)->data;

        return array(
            'success' => TRUE
        );
    }
}