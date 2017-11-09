<?php
namespace App\Tasks\Models;

use App\Advance\Models\Advance,
    App\Expense\Models\Expense,
    App\Trips\Models\Trip;

class Task extends \Micro\Model {

    public function getSource() {
        return 'tasks';
    }

    public function getAdvance() {
        return Advance::findFirst(array(
            'adv_no = :code:',
            'bind' => array(
                'code' => $this->t_code
            )
        ));
    }

    public function getExpense() {
        return Expense::findFirst(array(
            'exp_no = :code:',
            'bind' => array(
                'code' => $this->t_code
            )
        ));   
    }

    public function getTrip() {
        return Trip::findFirst(array(
            'trip_no = :code:',
            'bind' => array(
                'code' => $this->t_code
            )
        ));  
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);
        $type = $data['t_type'];

        $data['t_date_formatted'] = date('d/m/Y', strtotime($this->t_date));

        switch($type) {
            case 'advance':
            case 'advance-receive':
            case 'advance-finance':
            case 'advance-refund':
                $advance = $this->getAdvance();

                if ($advance) {
                    $advance = $advance->toArray();

                    $data['t_link'] = $advance['id_adv'];
                    $data['t_text'] = $advance['subject_adv'];

                    switch($type) {
                        case 'advance':
                        case 'advance-finance':
                            $data['t_verb'] = 'Advance approval request';    
                            break;
                        case 'advance-receive':
                            $data['t_verb'] = 'Advance document receipment request';
                            break;
                        case 'advance-refund':
                            $data['t_verb'] = 'Advance return approval request';
                    }
                    
                    $data['t_sender'] = $advance['user_fullname'];
                    $data['t_amounts'] = $advance['amounts'];
                    $data['t_amounts_formatted'] = $advance['amounts_formatted'];
                }

                break;

            case 'expense':
            case 'expense-receive':
            case 'expense-finance':
            case 'expense-hr':
            case 'opex':

                $expense = $this->getExpense();

                if ($expense) {
                    $expense = $expense->toArray();

                    $data['t_link'] = $expense['id_exp'];
                    $data['t_text'] = $expense['subject_exp'];
                    
                    switch($type) {
                        case 'expense':
                        case 'expense-finance':
                        case 'expense-hr':
                            $data['t_verb'] = 'Expense approval request';
                            break;
                        case 'expense-receive':
                            $data['t_verb'] = 'Expense document receiptment request';
                            break;
                        case 'opex':
                            $data['t_verb'] = 'Operational expense (opex) approval request';
                            break;
                    }

                    $data['t_sender'] = $expense['user_fullname'];
                    $data['t_amounts'] = $expense['amounts'];
                    $data['t_amounts_formatted'] = $expense['amounts_formatted'];   
                }

                break;

            case 'trip':
            case 'trip-ticket':

                $trip = $this->getTrip();

                if ($trip) {
                    $trip = $trip->toArray();

                    $data['t_link'] = $trip['id_trip'];
                    $data['t_text'] = $trip['subject_trip'];

                    switch($type) {
                        case 'trip':
                            $data['t_verb'] = 'Trip approval request';
                            break;
                        case 'trip-ticket':
                            $data['t_verb'] = 'Ticket issuing request';
                            break;
                    }
                    

                    $data['t_sender'] = $trip['user_fullname'];
                    $data['t_amounts'] = $trip['amounts'];
                    $data['t_amounts_formatted'] = $trip['amounts_formatted'];   
                }

                break;
        }

        // styling
        $colors = array(
            'var(--paper-red-500)',
            'var(--paper-pink-500)',
            'var(--paper-purple-500)',
            'var(--paper-indigo-500)',
            'var(--paper-blue-500)',
            'var(--paper-cyan-500)',
            'var(--paper-teal-300)',
            'var(--paper-green-500)',
            'var(--paper-amber-500)',
            'var(--paper-orange-500)',
            'var(--paper-blue-grey-500)'
        );


        if ($this->t_read == 1) {
            $data['t_accent'] = 'var(--paper-grey-400)';
            $data['t_icon'] = 'drafts';
        } else {
            $data['t_accent'] = $colors[array_rand($colors)];
            $data['t_icon'] = 'mail';
        }

        

        return $data;
    }

    public static function log($type, $user, $data) {
        $task = new Task();

        $task->t_type = $type;
        $task->t_user = is_numeric($user) ? $user : $user->su_id;
        $task->t_date = date('Y-m-d H:i:s');
        $task->t_read = 0;
        
        switch($type) {
            case 'advance':
                $task->t_link = $data->id_adv;
                $task->t_code = $data->adv_no;
                break;
        }

        $task->save();
    }

    public static function dispose($type, $user, $data) {

        switch($type) {
            case 'expense-hr':

                self::find(array(
                    't_type = :type: AND t_link = :link:',
                    'bind' =>array(
                        'type' => 'expense-hr',
                        'link' => $data->id_exp
                    )
                ))->delete();

                break;
        }

    }

}