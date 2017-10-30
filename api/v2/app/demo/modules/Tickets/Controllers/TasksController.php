<?php
namespace App\Tickets\Controllers;

use App\Tickets\Models\Task;

class TasksController extends \Micro\Controller {

    public function findAction() {
        $user = $this->auth->user();
        return Task::get()
            ->where('su_id = :user:', array('user' => $user['su_id']))
            ->paginate();
    }

}