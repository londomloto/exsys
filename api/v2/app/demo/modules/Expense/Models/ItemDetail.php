<?php
namespace App\Expense\Models;

class ItemDetail extends \Micro\Model {
    
    public function getSource() {
        return 'expense_detail';
    }
    
}