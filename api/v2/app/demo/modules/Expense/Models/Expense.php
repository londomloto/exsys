<?php
namespace App\Expense\Models;

use App\Expense\Models\History,
    App\Expense\Models\Item,
    App\Users\Models\User,
    App\Statuses\Models\Status,
    App\Currencies\Models\Currency,
    App\Finance\Models\Account,
    App\Tasks\Models\Task,
    Phalcon\Mvc\Model\Relation;

class Expense extends \Micro\Model {
    
    public function initialize() {
        $this->hasOne(
            'status',
            'App\Statuses\Models\Status',
            'status_id',
            array(
                'alias' => 'LastStatus'
            )
        );

        $this->hasOne(
            'type',
            'App\Types\Models\Type',
            'type_id',
            array(
                'alias' => 'ExpenseType'
            )
        );

        $this->hasOne(
            'id_user',
            'App\Users\Models\User',
            'su_id',
            array(
                'alias' => 'User'
            )
        );

        $this->hasOne(
            'received_by',
            'App\Users\Models\User',
            'su_id',
            array(
                'alias' => 'Receiver'
            )
        );

        $this->hasOne(
            'purpose',
            'App\Types\Models\Type',
            'type_id',
            array(
                'alias' => 'ExpensePurpose'
            )
        );

        $this->hasMany(
            'id_exp',
            'App\Expense\Models\Item',
            'id_exp',
            array(
                'alias' => 'Items',
                'foreignKey' => array(
                    'action' => Relation::ACTION_CASCADE
                )
            )
        );

        $this->hasMany(
            'id_exp',
            'App\Expense\Models\History',
            'id_exp',
            array(
                'alias' => 'History',
                'foreignKey' => array(
                    'action' => Relation::ACTION_CASCADE
                )
            )
        );

        $this->hasOne(
            'adv_ref',
            'App\Advance\Models\Advance',
            'id_adv',
            array(
                'alias' => 'Advance'
            )
        );

        $this->hasMany(
            'id_exp',
            'App\Expense\Models\Exchange',
            'id_exp',
            array(
                'alias' => 'Exchanges',
                'foreignKey' => array(
                    'action' => Relation::ACTION_CASCADE
                )
            )
        );

        $this->hasMany(
            'id_exp',
            'App\Expense\Models\Crop',
            'id_exp',
            array(
                'alias' => 'Crops',
                'foreignKey' => array(
                    'action' => Relation::ACTION_CASCADE
                )
            )
        );
    }

    public function getSource() {
        return 'expense_table';
    }

    public function beforeSave() {
        if (isset($this->type)) {
            $this->type = $this->type == '' ? NULL : $this->type;    
        }
        
        if (isset($this->purpose)) {
            $this->purpose = $this->purpose == '' ? NULL : $this->purpose;
        }
    }

    public function hasAttachment() {
        $attachment = $this->getAttachment();
        if ( ! empty($attachment)) {
            return file_exists($attachment);
        }
    }

    public function getAttachment() {
        if ( ! empty($this->attachment)) {
            return APPPATH.'public/resources/attachments/'.$this->attachment;
        }
        return '';
    }

    public function isEditable() {
        $statuses = array(
            Status::val('draft'),
            Status::val('change-request')
        );
        return in_array($this->status, $statuses);
    }

    public function isRemovable() {
        $statuses = array(
            Status::val('draft')
        );
        return in_array($this->status, $statuses);
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);
        

        $data['is_editable'] = $this->isEditable();
        $data['is_removable'] = $this->isRemovable();
        $data['status_name'] = '';
        $data['type_name'] = '';
        $data['purpose_name'] = '';
        $data['date_short'] = date('d/m/Y', strtotime($this->date));

        $time_start = strtotime($this->date_start);
        $time_end = strtotime($this->date_end);

        $data['date_start_short'] = date('d/m/Y', $time_start);
        $data['date_end_short'] = date('d/m/Y', $time_end);
        $data['period'] = date('F Y', $time_start);
        $data['has_items'] = $this->items->count() > 0 ? TRUE : FALSE;
        $data['has_attachment'] = $this->hasAttachment();
        $data['amounts_formatted'] = number_format($data['amounts'], 2, ',', '.');
        $data['is_travelling'] = TRUE;
        $data['is_promo'] = FALSE;
        
        if ($this->lastStatus) {
            $data['status_code'] = $this->lastStatus->status_code;
            $data['status_name'] = $this->lastStatus->status_name;
            $data['status_color'] = empty($this->lastStatus->status_color) ? 'var(--paper-grey-400)' : $this->lastStatus->status_color;
        }

        if ($this->expenseType) {
            $data['type_name'] = $this->expenseType->type_name;
            $data['is_travelling'] = $this->expenseType->isTravelling();
            $data['is_promo'] = $this->expenseType->isPromo();
        }

        if ($this->expensePurpose) {
            $data['purpose_name'] = $this->expensePurpose->type_name;
        } else {
            $data['purpose_name'] = $this->other_purpose;
        }

        if ($this->user) {
            $data['user_fullname'] = $this->user->su_fullname;
        }

        $data['has_advance'] = FALSE;

        if ($this->advance) {
            $data['has_advance'] = TRUE;
            $data['adv_no'] = $this->advance->adv_no;
        }

        $data['received_date_short'] = date('d/m/Y', strtotime($this->received_date));

        if ($this->receiver) {
            $data['received_by_name'] = $this->receiver->su_fullname;
        }

        return $data;
    }


    public function getGroupedItems() {
        $items = $this->items->filter(function($e){
            $item = $e->toArray();
            return $item;
        });

        usort($items, function($a, $b){
            $va = empty($a['item_parent_id']) ? $a['exp_item_id'] : $a['item_parent_id'];
            $vb = empty($b['item_parent_id']) ? $b['exp_item_id'] : $b['item_parent_id'];

            if ($va == $vb) return 0;
            return $va < $vb ? -1 : 1;
        });

        $groups = array();

        foreach($items as $idx => $item) {
            $group = $item['item_parent_id'];
            
            $item['item_seq'] = ($idx + 1);

            if ( ! isset($groups[$group])) {
                $groups[$group] = array();
                $groups[$group]['group_id'] = $item['item_parent_id'];
                $groups[$group]['group_name'] = $item['item_parent_name'];
                $groups[$group]['group_items'] = array($item);
            } else {
                $groups[$group]['group_items'][] = $item;
            }
        }

        $groups = array_values($groups);

        return $groups;
    }

    public function getGroupedCrops() {
        $crops = $this->crops->filter(function($elem){
            return $elem->toArray();
        });

        usort($crops, function($a, $b){
            $va = empty($a['seed_parent_id']) ? $a['exp_crop_id'] : $a['seed_parent_id'];
            $vb = empty($b['seed_parent_id']) ? $b['exp_crop_id'] : $b['seed_parent_id'];

            if ($va == $vb) return 0;
            return $va < $vb ? -1 : 1;
        });

        $groups = array();

        foreach($crops as $idx => $crop) {
            $group = $crop['seed_parent_id'];
            
            $crop['crop_seq'] = ($idx + 1);

            if ( ! isset($groups[$group])) {
                $groups[$group] = array();
                $groups[$group]['group_id'] = $crop['seed_parent_id'];
                $groups[$group]['group_name'] = $crop['seed_parent_name'];
                $groups[$group]['group_items'] = array($crop);
            } else {
                $groups[$group]['group_items'][] = $crop;
            }
        }

        $groups = array_values($groups);
        return $groups;
    }

    public function updateAmounts() {
        // compute amounts from items
        $amounts = 0;

        foreach($this->items as $elem) {
            $line = ($elem->currency_rate * $elem->amounts);
            $amounts += $line;
        }

        $this->amounts = $amounts;
        $this->save();
    }

    public function submit() {
        $auth = \Micro\App::getDefault()->auth->user();

        $status = Status::val('submitted');
        $this->status = $status;

        if ($this->save()) {
            // create history
            History::log($this->category, $this);

            $user = User::get($auth['su_id'])->data;
            $superiors = $user->getSuperiors($this->amounts);

            foreach($superiors as $super) {
                Task::log($this->category, $super['user_id'], $this);
            }

            if($this->advance) {
                $this->advance->is_open = 0;
                $this->advance->save();
            }
        }

    }

    public function hrSubmit() {

    }

    public function faSubmit($action) {
        $type = NULL;

        // broadcast tasks to fa subscriber
        switch($action) {
            case 'receive-request';

                // create history
                $history = new History();
                
                $history->id_exp = $this->id_exp;
                $history->date = date('Y-m-d H:i:s');
                $history->user_act = 0;
                $history->notes = 'Send to finance by system';
                $history->status_id = Status::val('fa-pending');
                
                $history->save();

                $type = Task::TYPE_EXPENSE_RECEIVE;
                $subscribers = User::findInRoles(array('fa-receiver'));
                break;
            case 'approval-request':
                $type = Task::TYPE_EXPENSE_FINANCE;
                $subscribers = User::findInRoles(array('fa-approver'));
                break;
        }
        
        foreach($subscribers as $sub) {
            Task::log($type, $sub->su_id, $this);
        }
    }

    public function reject($post = array()) {
        // update status
        $status = Status::val('reject');
        $this->status = $status;

        if ($this->save()) {
            // dispose tasks
            Task::dispose($this->category, $this);

            // create history
            History::log($this->category, $this, $post['notes']);
        }

    }

    public function approve($post = array()) {
        $user = \Micro\App::getDefault()->auth->user();

        // update status
        $status = NULL;
        $notes = isset($post['notes']) ? $post['notes'] : '-';

        if ($user['su_grade_type'] == 'verificator') {
            $status = Status::val('verified');
        } else {
            if ($user['su_grade_limit'] >= 15000000) {
                $status = Status::val('final-approved');
            } else {
                $status = Status::val('approved');
            }
        }

        // update status
        $this->status = $status;

        if ($this->save()) {

            // delete tasks
            if ($user['su_grade_type'] == 'verificator') {
                $tasks = Task::find(array(
                    't_type = :type: AND t_link = :link: AND t_user = :user:',
                    'bind' => array(
                        'type' => $this->category,
                        'link' => $this->id_exp,
                        'user' => $user['su_id']
                    )
                ));

                foreach($tasks as $task) {
                    $task->t_done = 1;
                    $task->t_drop = 1;
                    $task->save();
                }

            } else if ($user['su_grade_type'] == 'approver') {
                
                $tasks = Task::get()
                    ->where('t_type = :type: AND t_link = :link: AND grade.grade_limit <= :amounts:', array(
                        'type' => $this->category,
                        'link' => $this->id_exp,
                        'amounts' => (int) $user['su_grade_limit']
                    ))
                    ->join('App\Users\Models\User', 'user.su_id = App\Tasks\Models\Task.t_user', 'user')
                    ->join('App\Grades\Models\Grade', 'grade.grade_id = user.su_grade_id', 'grade')
                    ->execute();

                foreach($tasks as $task) {
                    if ($task->t_user == $user['su_id']) {
                        $task->t_done = 1;
                    }
                    $task->t_drop = 1;
                    $task->save();
                }
            }

            // create history
            History::log($this->category, $this, $notes);

            if ($status == Status::val('final-approved')) {
                
                $cost = Item::findFirst(array(
                    'cnb = 1 AND id_exp = :expense:',
                    'bind' => array(
                        'expense' => $this->id_exp
                    )
                ));

                if ($cost) {
                    // hrd task
                    $subscribers = User::findInRoles(array('human-resource'));
                    foreach($subscribers as $sub) {
                        Task::log(Task::TYPE_EXPENSE_HR, $sub->su_id, $this);
                    }
                } else {
                    $this->faSubmit('receive-request');    
                }
            }
        }
    }

    public function returned($post = array()) {
        // update status
        $status = Status::val('change-request');
        $this->status = $status;

        if ($this->save()) {
            // dispose tasks
            Task::dispose($this->category, $this);

            // create history
            History::log($this->category, $this, $post['notes']);
        }

    }

    public function getCurrencies() {
        $result = array();
        $offset1 = Currency::offset();

        if ($this->exchanges->count() > 0) {

            $exchanges = $this->exchanges->filter(function($row){ return $row; });
            
            usort($exchanges, function($a, $b){
                $va = $a->to_currency_id;
                $vb = $b->to_currency_id;
                if ($va == $vb) return 0;
                return $va < $vb ? -1 : 1;
            });

            foreach($exchanges as $row) {
                // from
                // $code = $row->from->currency_code;

                // if ( ! isset($result[$code])) {
                //     $curr = $row->from->toArray();
                //     $curr['currency_rate_exchanged'] = 1;
                //     $curr['currency_offset_id'] = $row->from->currency_id;
                //     $curr['currency_offset_rate'] = $row->from->currency_rate;
                //     $curr['currency_offset_code'] = $row->from->currency_code;

                //     $result[$code] = $curr;
                // }
                
                // to
                $code = $row->to->currency_code;

                if ( ! isset($result[$code])) {
                    $curr = $row->to->toArray();
                    $offset2 = self::__defineExchangeOffset($exchanges, $row->to_currency_id);

                    $curr['currency_rate'] = 0;
                    $curr['currency_rate_exchanged'] = $row->rates;
                    $curr['currency_offset_id'] = NULL;
                    $curr['currency_offset_code'] = NULL;
                    $curr['currency_offset_rate'] = $row->rates;
                    
                    if ( ! is_null($offset2)) {
                        $curr['currency_offset_id'] = $offset2->from->currency_id;
                        $curr['currency_offset_code'] = $offset2->from->currency_code;    
                    }

                    if ($row->rates > 0 && ! is_null($offset2)) {
                        $curr['currency_rate'] = round(($offset2->from->currency_rate / $row->rates), 6);
                    }

                    $curr['currency_rate_formatted'] = number_format($curr['currency_rate'], 6, ',', '.');
                    $result[$code] = $curr;
                }
            }
        }

        // add from master currencies
        $currencies = \App\Currencies\Models\Currency::find('currency_acceptable = 1');

        foreach($currencies as $row) {
            $code = $row->currency_code;

            if ( ! isset($result[$code])) {
                $curr = $row->toArray();
                $curr['currency_rate_exchanged'] = $row->currency_rate;
                $curr['currency_offset_id'] = $offset1->currency_id;
                $curr['currency_offset_code'] = $offset1->currency_code;
                $curr['currency_offset_rate'] = $row->currency_rate;
                $result[$code] = $curr;
            }
        }

        $result = array_values($result);

        return $result;
    }

    public function getSummary() {
        $summary = array(
            'expense' => array(),
            'remains' => array()
        );

        $items = $this->items->filter(function($row){ return $row; });
        
        usort($items, function($a, $b){
            $va = $a->currency_id;
            $vb = $b->currency_id;

            if ($va == $vb) return 0;
            return $va < $vb ? -1 : 1;
        });

        $expense = array();
        $replica = array();

        foreach($items as $row) {
            $item = $row->toArray();
            $code = $item['currency_code'];

            if ( ! isset($expense[$code])) {

                $expense[$code] = array(
                    'currency_id' => $item['currency_id'],
                    'currency_name' => $item['currency_name'],
                    'currency_code' => $item['currency_code'],
                    'currency_rate' => $item['currency_rate'],
                    'currency_rate_exchanged' => $item['currency_rate_exchanged'],
                    'currency_offset_id' => $item['currency_offset_id'],
                    'currency_offset_code' => $row->currencyOffset ? $row->currencyOffset->currency_code : '',
                    'expense_value' => 0,
                    'expense_label' => 'Expense in '.$code.' ('.$item['currency_name'].')'
                );

                //$replica[$expense[$code]['currency_offset_code']] = $expense[$code];
                //$replica[$expense[$code]['currency_offset_code']]['expense_value'] = 0;
            }

            $expense[$code]['expense_value'] += ($row->amounts);
            $expense[$code]['expense_value_formatted'] = number_format($expense[$code]['expense_value'], 2, ',', '.');
            
            //$replica[$expense[$code]['currency_offset_code']]['expense_value'] += ($row->amounts);
        }

        $summary['expense'] = array_values($expense);
        
        $inverse = array();

        foreach($summary['expense'] as $row) {
            $code = $row['currency_offset_code'];
            
            if ( ! isset($inverse[$code])) {
                $inverse[$code] = array(
                    'expense_value' => 0
                );
            }
            
            $inverse[$code]['expense_value'] += 0;

            if ($row['currency_rate_exchanged'] > 0) {
                $inverse[$code]['expense_value'] += round(($row['expense_value'] / $row['currency_rate_exchanged']), 2);    
            }
            
        }

        $remains = array();
        $expense = array();

        if ($this->advance) {

            foreach($this->advance->getSummary() as $sum) {
                $code = $sum['currency_code'];

                $remains[$code] = array(
                    'currency_id' => $sum['currency_id'],
                    'currency_name' => $sum['currency_name'],
                    'currency_code' => $sum['currency_code'],
                    'currency_rate' => $sum['currency_rate'],
                    'remains_value' => $sum['summary_value'],
                    'remains_label' => 'Advance remains in '.$code.' ('.$sum['currency_name'].')'
                );

                // update expense
                $expense[$code] = array(
                    'currency_id' => $sum['currency_id'],
                    'currency_name' => $sum['currency_name'],
                    'currency_code' => $sum['currency_code'],
                    'currency_rate' => $sum['currency_rate'],
                    'expense_value' => 0,
                    'expense_label' => 'Expense total in '.$code.' ('.$sum['currency_name'].')'
                );

                if (isset($inverse[$code])) {
                    $line = $inverse[$code];

                    $expense[$code]['expense_value'] = $line['expense_value'];
                    $remains[$code]['remains_value'] = ($remains[$code]['remains_value'] - $line['expense_value']);
                }

                $expense[$code]['expense_value_formatted'] = number_format($expense[$code]['expense_value'], 2, ',', '.');

                if ($remains[$code]['remains_value'] < 0) {
                    $remains[$code]['remains_value_formatted'] = '('.number_format(abs($remains[$code]['remains_value']), 2, ',', '.').')';
                } else {
                    $remains[$code]['remains_value_formatted'] = number_format($remains[$code]['remains_value'], 2, ',', '.');
                }
                
            }
        }

        $summary['expense'] = array_merge($summary['expense'], array_values($expense));
        $summary['remains'] = array_values($remains);

        return $summary;
    }

    public function getJournals() {
        $journals = array();

        // line #1
        $line = array(
            'description' => 'Accrual Expense',
            'account' => 'N/A',
            'debits' => 0,
            'debits_formatted' => number_format($this->amounts, 2, ',', '.'),
            'credits' => 0,
            'credits_formatted' => '',
            'padding' => '0px'
        );

        // line #2
        $journals[] = $line;
        // $account = Account::forExpense($this);

        $account = 'N/A';

        if ($this->expenseType) {
            if ($this->expenseType->type_code == 'others') {
                $account = 'N/A - Temporary Expense';
            } else if ($this->expensePurpose) {
                $account = 'N/A - Expense';
            }
        }

        $line = array(
            'description' => $this->subject_exp.' ('.$this->exp_no.')',
            'account' => $account,
            'debits' => 0,
            'debits_formatted' => '',
            'credits' => $this->amounts,
            'credits_formatted' => number_format($this->amounts, 2, ',', '.'),
            'padding' => '24px'
        );

        $journals[] = $line;
        

        return $journals;
    }

    private static function __defineExchangeOffset($exchanges, $to) {
        $rows = array_filter($exchanges, function($elem) use ($to){
            return $elem->to_currency_id == $to;
        });

        $rows = array_values($rows);

        usort($rows, function($a, $b){
            $va = $a->to_amounts;
            $vb = $b->to_amounts;
            if ($va == $vb) return 0;
            return $va < $vb ? 1 : -1;
        });

        return isset($rows[0]) ? $rows[0] : NULL;
    }
}