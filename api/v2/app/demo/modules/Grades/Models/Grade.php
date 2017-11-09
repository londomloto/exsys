<?php
namespace App\Grades\Models;

class Grade extends \Micro\Model {

    public function getSource() {
        return 'master_grade';
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray();
        $data['grade_limit_formatted'] = number_format($this->grade_limit, 0, ',', '.');
        $data['grade_type'] = $this->approver == 1 ? 'approver' : ($this->verificator == 1 ? 'verificator' : 'creator');
        $data['grade_label'] = $this->grade_code.' ('.$this->grade_desc.')';
        
        return $data;
    }
}