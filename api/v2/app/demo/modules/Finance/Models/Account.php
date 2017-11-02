<?php
namespace App\Finance\Models;

class Account extends \Micro\Model {

    public function getSource() {
        return 'accounts';
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);
        $data['acc_label'] = $this->acc_code.' - '.$this->acc_name;
        return $data;
    }

    public static function forExpense($expsense) {
        $code = NULL;

        if ($expsense->expensePurpose) {
            $code = $expsense->expensePurpose->coa;

            if (empty($code)) {
                foreach($expsense->items as $item) {
                    if ($item->masterItem && $item->masterItem->coa) {
                        $code = $item->masterItem->coa;
                        break;
                    }
                }
            }

        }

        if ( ! empty($code)) {
            return self::findFirst(array(
                'acc_code = :code:',
                'bind' => array(
                    'code' => $code
                )
            ));
        }

        return FALSE;
    }
}