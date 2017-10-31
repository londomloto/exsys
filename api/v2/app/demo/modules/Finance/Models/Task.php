<?php
namespace App\Finance\Models;

class Task extends \Micro\Model {

    public function getSource() {
        return 'fa_task';
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);

        $data['subject'] = '';
        $data['ref_no'] = '';
        
        $document = $this->getDocument();

        if ($document) {
            $data = array_merge($data, $document->toArray());

            switch($data['module']) {
                case 'advance':
                    $data['ref_no'] = $data['adv_no'];
                    $data['subject'] = $data['subject_adv'];
                    break;

                case 'expense':
                    $data['ref_no'] = $data['exp_no'];
                    $data['subject'] = $data['subject_exp'];
                    break;
            }
        }

        if (isset($data['amounts'])) {
            $data['amounts_formatted'] = number_format($data['amounts'], 2, ',', '.');
        }
        
        return $data;
    }

    public function getDocument() {
        $document = NULL;

        switch($this->module) {
            case 'expense':
                $document = \App\Expense\Models\Expense::findFirst($this->id_ref);
                break;

            case 'advance':
                $document = \App\Advance\Models\Advance::findFirst($this->id_ref);
                break;
        }

        return $document;
    }

}