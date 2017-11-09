<?php
namespace App\Costs\Models;

use App\Currencies\Models\Currency,
    App\Users\Models\User,
    App\Grades\Models\Grade;

class Cost extends \Micro\Model {

    public function initialize() {
        $this->hasOne(
            'item_id',
            'App\Items\Models\Item',
            'item_id',
            array(
                'alias' => 'MasterItem'
            )
        );

        $this->hasOne(
            'grade_id',
            'App\Grades\Models\Grade',
            'grade_id',
            array(
                'alias' => 'MasterGrade'
            )
        );

        $this->hasOne(
            'position_id',
            'App\Positions\Models\Position',
            'pos_id',
            array(
                'alias' => 'MasterPosition'
            )
        );
    }

    public function getSource() {
        return 'master_cnb';
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);

        if ($this->masterItem) {
            $data['item_name'] = $this->masterItem->item_name;
        }

        if ($this->masterGrade) {
            $grade = $this->masterGrade->toArray();
            $data['grade_label'] = $grade['grade_label'];
        }

        if ($this->masterPosition) {
            $data['position_name'] = $this->masterPosition->pos_name;
        }

        $data['amounts_formatted'] = number_format($this->amounts, 2, ',', '.');

        return $data;
    }

    public static function validateGrade($itemId, $userId, $currencyId, $amounts) {
        $user = User::get($userId)->data;
        $curr = Currency::get($currencyId)->data;
        $coff = Currency::offset();

        $found = Cost::findFirst(array(
            'item_id = :item: AND grade_id = :grade:',
            'bind' => array(
                'item' => $itemId,
                'grade' => $user->su_grade_id
            )
        ));

        $result = new \stdClass();
        $result->action = NULL;
        $result->message = NULL;

        if ($found) {
            if ($curr->currency_id != $coff->currency_id) {
                $amounts = $amounts * $curr->currency_rate;
            }
            if ($amounts > $found->amounts) {
                if ($found->allow_over) {
                    $result->action = 'ACCEPT';
                } else {
                    $result->action = 'REJECT';
                    $result->message = 'Cost limit for item `'.$found->masterItem->item_name.'` has been reached (max: '.number_format($found->amounts, 2, ',', '.') .')';
                }
            }
        }

        return $result;
    }

}