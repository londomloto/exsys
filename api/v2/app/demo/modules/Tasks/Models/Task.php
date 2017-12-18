<?php
namespace App\Tasks\Models;

use App\Advance\Models\Advance,
    App\Expense\Models\Expense,
    App\Trips\Models\Trip;

class Task extends \Micro\Model {

    const TYPE_ADVANCE = 'advance';
    const TYPE_ADVANCE_RECEIVE = 'advance-receive';
    const TYPE_ADVANCE_REFUND = 'advance-refund';
    const TYPE_ADVANCE_FINANCE = 'advance-finance';

    const TYPE_TRIP = 'trip';
    const TYPE_TRIP_RESCHEDULE = 'trip-reschedule';
    const TYPE_TICKET_REQUEST = 'ticket-request';
    const TYPE_TICKET_RESCHEDULE = 'ticket-reschedule';

    const TYPE_EXPENSE = 'expense'; // non-opex
    const TYPE_EXPENSE_RECEIVE = 'expense-receive';
    const TYPE_EXPENSE_FINANCE = 'expense-finance';
    const TYPE_EXPENSE_HR = 'expense-hr';
    const TYPE_OPEX = 'opex';

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
            case self::TYPE_ADVANCE:
            case self::TYPE_ADVANCE_RECEIVE:
            case self::TYPE_ADVANCE_FINANCE:
            case self::TYPE_ADVANCE_REFUND:

                $advance = $this->getAdvance();

                if ($advance) {
                    $advance = $advance->toArray();

                    $data['t_link'] = $advance['id_adv'];
                    $data['t_text'] = $advance['subject_adv'];

                    switch($type) {
                        case self::TYPE_ADVANCE:
                        case self::TYPE_ADVANCE_FINANCE:
                            $data['t_verb'] = 'Advance approval request';    
                            break;
                        case self::TYPE_ADVANCE_RECEIVE:
                            $data['t_verb'] = 'Advance document receipment request';
                            break;
                        case self::TYPE_ADVANCE_REFUND:
                            $data['t_verb'] = 'Advance return approval request';
                    }
                    
                    $data['t_sender'] = $advance['user_fullname'];
                    $data['t_amounts'] = $advance['amounts'];
                    $data['t_amounts_formatted'] = $advance['amounts_formatted'];
                }

                break;

            case self::TYPE_EXPENSE:
            case self::TYPE_EXPENSE_FINANCE:
            case self::TYPE_EXPENSE_RECEIVE:
            case self::TYPE_EXPENSE_HR:
            case self::TYPE_OPEX:

                $expense = $this->getExpense();

                if ($expense) {
                    $expense = $expense->toArray();

                    $data['t_link'] = $expense['id_exp'];
                    $data['t_text'] = $expense['subject_exp'];
                    
                    switch($type) {
                        case self::TYPE_EXPENSE:
                        case self::TYPE_EXPENSE_FINANCE:
                        case self::TYPE_EXPENSE_HR:
                            $data['t_verb'] = 'Expense approval request';
                            break;
                        case self::TYPE_EXPENSE_RECEIVE:
                            $data['t_verb'] = 'Expense document receiptment request';
                            break;
                        case self::TYPE_OPEX:
                            $data['t_verb'] = 'Operational expense (opex) approval request';
                            break;
                    }

                    $data['t_sender'] = $expense['user_fullname'];
                    $data['t_amounts'] = $expense['amounts'];
                    $data['t_amounts_formatted'] = $expense['amounts_formatted'];   
                }

                break;

            case self::TYPE_TRIP:
            case self::TYPE_TRIP_RESCHEDULE:
            case self::TYPE_TICKET_REQUEST:
            case self::TYPE_TICKET_RESCHEDULE:

                $trip = $this->getTrip();

                if ($trip) {
                    $trip = $trip->toArray();

                    $data['t_link'] = $trip['id_trip'];
                    $data['t_text'] = $trip['subject_trip'];

                    switch($type) {
                        case self::TYPE_TRIP:
                            $data['t_verb'] = 'Trip approval request';
                            break;
                        case self::TYPE_TRIP_RESCHEDULE:
                            $data['t_verb'] = 'Trip rescheduling approval request';
                            break;
                        case self::TYPE_TICKET_REQUEST:
                            $data['t_verb'] = 'Request for ticket issuance';
                            break;
                        case self::TYPE_TICKET_RESCHEDULE:
                            $data['t_verb'] = 'Request for ticket rescheduling';
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
        
        $data['t_color'] = '#fff';

        if ($this->t_drop == 1) {
            $data['t_accent'] = 'var(--paper-red-300)';
            $data['t_icon'] = 'drafts';
        } else {
            if ($this->t_read == 1) {
                $data['t_accent'] = 'var(--paper-blue-grey-300)';
                $data['t_icon'] = 'drafts';
            } else {
                $data['t_accent'] = 'var(--paper-cyan-500)';
                $data['t_icon'] = 'mail';
            }    
        }

        return $data;
    }

    public static function log($type, $user, $data, $show = TRUE) {
        $task = new Task();

        $task->t_type = $type;
        $task->t_user = $user;
        $task->t_date = date('Y-m-d H:i:s');
        $task->t_done = 0;
        $task->t_read = 0;
        $task->t_show = $show ? 1 : 0;
        $task->t_drop = 0;
        
        switch($type) {
            case self::TYPE_ADVANCE:
            case self::TYPE_ADVANCE_RECEIVE:
            case self::TYPE_ADVANCE_FINANCE:
            case self::TYPE_ADVANCE_REFUND:
                $task->t_link = $data->id_adv;
                $task->t_code = $data->adv_no;
                break;
            case self::TYPE_TRIP:
            case self::TYPE_TRIP_RESCHEDULE:
            case self::TYPE_TICKET_REQUEST:
            case self::TYPE_TICKET_RESCHEDULE:
                $task->t_link = $data->id_trip;
                $task->t_code = $data->trip_no;
                break;
            case self::TYPE_EXPENSE:
            case self::TYPE_EXPENSE_RECEIVE:
            case self::TYPE_EXPENSE_FINANCE:
            case self::TYPE_EXPENSE_HR:
                $task->t_link = $data->id_exp;
                $task->t_code = $data->exp_no;
                break;
        }

        $task->save();
    }

    public static function dispose($type, $link, $done = TRUE) {
        $tasks = FALSE;

        switch($type) {
            case self::TYPE_ADVANCE:
            case self::TYPE_ADVANCE_FINANCE;
                $tasks = self::find(array(
                    't_type = :type: AND t_link = :link:',
                    'bind' =>array(
                        'type' => $type,
                        'link' => $link->id_adv
                    )
                ));
                break;
            case self::TYPE_EXPENSE:
            case self::TYPE_EXPENSE_RECEIVE:
            case self::TYPE_EXPENSE_FINANCE:
            case self::TYPE_EXPENSE_HR:
                $tasks = self::find(array(
                    't_type = :type: AND t_link = :link:',
                    'bind' =>array(
                        'type' => $type,
                        'link' => $link->id_exp
                    )
                ));
                break;
            case self::TYPE_TRIP:
            case self::TYPE_TRIP_RESCHEDULE:
            case self::TYPE_TICKET_REQUEST:
            case self::TYPE_TICKET_RESCHEDULE:
                $tasks = self::find(array(
                    't_type = :type: AND t_link = :link:',
                    'bind' =>array(
                        'type' => $type,
                        'link' => $link->id_trip
                    )
                ));
                break;
        }

        if ($tasks) {
            foreach($tasks as $task) {
                $task->t_done = $done ? 1 : 0;
                $task->t_drop = 1;
                $task->save();
            }
        }

    }

}