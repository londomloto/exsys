<?php
namespace App\Tasks\Controllers;

use App\Tasks\Models\Task;

class TasksController extends \Micro\Controller {

    public function findAction() {
        $params = $this->request->getParams();
        $display = isset($params['display']) ? $params['display'] : FALSE;
        $user = $this->auth->user();
        
        switch($display) {
            case 'task':
                return Task::get()
                    ->filterable()
                    ->where('t_show = 1 AND t_user = :user:', array('user' => $user['su_id']))
                    ->sortable()
                    ->paginate();
            default:
                 return Task::get()
                    ->filterable()
                    ->where('t_drop = 0 AND t_show = 1 AND t_user = :user:', array('user' => $user['su_id']))
                    ->sortable()
                    ->paginate();
        }
    }

    public function findByIdAction($id) {
        return Task::get($id);
    }

    public function updateAction($id) {
        $query = Task::get($id);
        $post = $this->request->getJson();

        if ($query->data) {
            $query->data->save($post);
        }

        return $query;
    }

    public function summaryAction() {
        $user = $this->auth->user();
        
        // count unread
        $unread = Task::get()
            ->where('t_drop = 0 AND t_show = 1 AND t_read = 0 AND t_user = :user:', array('user' => $user['su_id']))
            ->execute();

        $data = array(
            'unread' => $unread->count()
        );

        return array(
            'success' => TRUE,
            'data' => $data
        );
    }
}