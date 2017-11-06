<?php
namespace App\Expense\Models;

use App\Items\Models\ItemForm;

class Item extends \Micro\Model {

    public function initialize() {
        
        $this->hasOne(
            'currency_id',
            'App\Currencies\Models\Currency',
            'currency_id',
            array(
                'alias' => 'Currency'
            )
        );

        $this->hasOne(
            'currency_offset_id',
            'App\Currencies\Models\Currency',
            'currency_id',
            array(
                'alias' => 'CurrencyOffset'
            )
        );

        $this->hasOne(
            'item_id',
            'App\Items\Models\Item',
            'item_id',
            array(
                'alias' => 'MasterItem'
            )
        );

        $this->hasManyToMany(
            'item_id',
            'App\Items\Models\Item',
            'item_id',
            'item_id',
            'App\Items\Models\ItemForm',
            'item_id',
            array(
                'alias' => 'Forms'
            )
        );

        $this->hasMany(
            'exp_item_id',
            'App\Expense\Models\ItemDetail',
            'exp_item_id',
            array(
                'alias' => 'Values',
                'foreignKey' => array(
                    'action' => \Phalcon\Mvc\Model\Relation::ACTION_CASCADE
                )
            )
        );

        $this->belongsTo(
            'id_exp',
            'App\Expense\Models\Expense',
            'id_exp',
            array(
                'alias' => 'Expense'
            )
        );
    }

    public function getSource() {
        return 'expense_item';
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);

        $data['amounts_formatted'] = number_format($this->amounts, 2, ',', '.');
        $data['currency_name'] = '';
        $data['currency_code'] = '';
        $data['item_name'] = $this->description;
        $data['item_parent_id'] = NULL;
        $data['item_parent_name'] = NULL;
        $data['payment_type_name'] = $this->payment_type == 1 ? 'Cash' : 'Credit Card';
        $data['item_date_short'] = date('d/m/Y', strtotime($this->item_date));

        if ($this->masterItem) {
            $data['item_name'] = $this->masterItem->item_name;
            if ($this->masterItem->parent) {
                $data['item_parent_id'] = $this->masterItem->parent->item_id;
                $data['item_parent_name'] = $this->masterItem->parent->item_name;
            }
        }

        if ($this->currency) {
            $data['currency_code'] = $this->currency->currency_code;
            $data['currency_name'] = $this->currency->currency_name;
        }

        $data['currency_rate_displayed'] = number_format($data['currency_offset_rate'], 6, ',', '.');

        $forms = ItemForm::get()
            ->columns(array(
                'App\Items\Models\ItemForm.item_form_id',
                'App\Items\Models\ItemForm.item_form_editor',
                'App\Items\Models\ItemForm.item_form_type',
                'App\Items\Models\ItemForm.item_form_label',
                'App\Items\Models\ItemForm.index',
                'App\Items\Models\ItemForm.item_id',
                'App\Items\Models\ItemForm.option',
                'App\Items\Models\ItemForm.mandatory',
                'a.item_form_value'
            ))
            ->join(
                'App\Expense\Models\ItemDetail', 
                'a.item_form_id = App\Items\Models\ItemForm.item_form_id AND a.exp_item_id = '.$this->exp_item_id, 
                'a', 
                'left'
            )
            ->join(
                'App\Expense\Models\Item',
                'b.exp_item_id = a.exp_item_id AND b.id_exp = ' . $this->id_exp,
                'b',
                'left'
            )
            ->where('App\Items\Models\ItemForm.item_id = :item_id:', array('item_id' => $this->item_id))
            ->orderBy('App\Items\Models\ItemForm.index ASC')
            ->execute();

        $data['item_forms'] = $forms->toArray();

        foreach($data['item_forms'] as &$form) {
            $value = $form['item_form_value'];

            switch($form['item_form_type']) {
                case 'date':
                    $form['item_form_display'] = $value ?  date('d/m/Y', strtotime($value)) : '-';
                    break;
                default:
                    $form['item_form_display'] = $value ? $value : '-';
                    break;
            }

            if ($form['item_form_editor'] == 'dropdown') {
                $options = ! empty($form['option']) ? json_decode($form['option']) : array();
                $display = '-';

                foreach($options as $elem) {
                    if ($elem->value == $value) {
                        $display = $elem->text;
                        break;
                    }
                }
                
                $form['item_form_display'] = $display;
            }
        }

        return $data;
    }

}