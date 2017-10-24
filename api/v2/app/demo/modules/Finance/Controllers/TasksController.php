<?php
namespace App\Finance\Controllers;

use App\Finance\Models\Task;

class TasksController extends  \Micro\Controller {

    public function findAction() {
        $user = $this->auth->user();
        $params = $this->request->getParams();
        $display = (isset($params['display']) && ! empty($params['display'])) ? $params['display'] : 'approval-request';

        return Task::get()
            ->join('App\Expense\Models\Expense', 'a.id_exp = App\Finance\Models\Task.id_exp', 'a', 'left')
            ->where('su_id = :user:', array('user' => $user['su_id']))
            ->andWhere('App\Finance\Models\Task.catagory = :catagory:', array('catagory' => $display))
            ->paginate();
    }

}