<?php
namespace App\Expense\Controllers;

use App\Expense\Models\Task;

class TasksController extends \Micro\Controller {

    public function findAction() {
        $user = $this->auth->user();
        $params = $this->request->getParams();
        $catagory = (isset($params['catagory']) && ! empty($params['catagory'])) ? $params['catagory'] : 'expense';

        return Task::get()
            ->join('App\Expense\Models\Expense', 'a.id_exp = App\Expense\Models\Task.id_exp', 'a', 'left')
            ->where('su_id = :user:', array('user' => $user['su_id']))
            ->andWhere('a.catagory = :catagory:', array('catagory' => $catagory))
            ->paginate();
    }

}