<?php
namespace App\Tasks\Controllers;

use App\Tasks\Models\Task;

class TasksController extends \Micro\Controller {

    public function findAction() {
        $user = $this->auth->user();
        
        return Task::get()
            ->filterable()
            ->andWhere('t_user = :user:', array('user' => $user['su_id'])) 
            ->sortable()
            ->paginate();
    }

    public function updateAction($id) {
        $query = Task::get($id);
        $post = $this->request->getJson();

        if ($query->data) {
            $query->data->save($post);
        }

        return $query;
    }

}