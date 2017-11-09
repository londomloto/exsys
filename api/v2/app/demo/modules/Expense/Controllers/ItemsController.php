<?php
namespace App\Expense\Controllers;

use App\Expense\Models\Item,
    App\Expense\Models\Expense,
    App\Expense\Models\ItemDetail,
    App\Currencies\Models\Currency,
    App\Costs\Models\Cost;

class ItemsController extends \Micro\Controller {

    public function findAction() {
        $params = $this->request->getParams();
        $display = isset($params['display']) ? $params['display'] : FALSE;

        $query = Item::get();

        if (isset($params['expense'])) {
            $query->where('id_exp = :expense:', array('expense' => $params['expense']));
        }

        $result = $query->paginate();

        switch($display) {
            case 'group':
                
                $items = $result->data->filter(function($elem){ return $elem->toArray(); });
                
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

                $result->data = array_values($groups);

                return $result;

            default:
                return $result;
        }
    }

    public function findByIdAction($id) {
        return Item::get($id);
    }

    public function createAction() {
        $params = $this->request->getParams();
        $post = $this->request->getJson();
        
        unset($post['cnb']);

        // fixup $post
        if (empty($post['item_id'])) {
            $post['item_id'] = NULL;
        } else {
            if (isset($params['cnb'])) {
                $user = $this->auth->user();
                $cost = Cost::validateGrade($post['item_id'], $user['su_id'], $post['currency_id'], $post['amounts']);
                $post['cnb'] = $cost ? 1 : 0;
            }
        }

        if ( ! isset($post['currency_offset_id'])) {
            $post['currency_offset_id'] = $post['currency_id'];
        }

        $data = new Item();

        $expense = Expense::get($post['id_exp'])->data;
        
        if ($expense && $expense->category == 'opex') {
            $offset = Currency::offset();
            $target = Currency::get($post['currency_id'])->data;

            if ($offset && $target) {
                $post['currency_offset_id'] = $offset->currency_id;
                $post['currency_offset_rate'] = $target->currency_rate;
                $post['currency_rate_exchanged'] = $target->currency_rate;
            }
        }

        if ($data->save($post)) {

            if ($data->expense) {
                $data->expense->updateAmounts();
            }

            if (isset($post['dynamic'])) {
                foreach($post['dynamic'] as $k => $v) {
                    $detail = new ItemDetail();

                    $detail->exp_id = $post['id_exp'];
                    $detail->exp_item_id = $data->exp_item_id;
                    $detail->item_form_id = (int) substr($k, 6);
                    $detail->item_form_value = $v;

                    $detail->save();
                }
            }

            return Item::get($data->exp_item_id);
        }
        return Item::none();
    }

    public function updateAction($id) {
        $params = $this->request->getParams();
        $post = $this->request->getJson();
        
        unset($post['cnb']);
        
        // fixup $post
        if (empty($post['item_id'])) {
            $post['item_id'] = NULL;
        } else {
            if (isset($params['cnb'])) {
                $user = $this->auth->user();    
                $cost = Cost::validateGrade($post['item_id'], $user['su_id'], $post['currency_id'], $post['amounts']);
                $post['cnb'] = $cost ? 1 : 0;
            }
        }

        $query = Item::get($id);

        if ($query->data) {

            $expense = $query->data->expense;

            if ($expense && $expense->category == 'opex') {
                $offset = Currency::offset();
                $target = Currency::get($post['currency_id'])->data;

                if ($offset && $target) {
                    $post['currency_offset_id'] = $offset->currency_id;
                    $post['currency_offset_rate'] = $target->currency_rate;
                    $post['currency_rate_exchanged'] = $target->currency_rate;
                }
            }

            if ($query->data->save($post)) {

                if ($query->data->expense) {
                    $query->data->expense->updateAmounts();
                }

                if (isset($post['dynamic'])) {
                    foreach($post['dynamic'] as $k => $v) {
                        $form = (int) substr($k, 6);
                        $detail = ItemDetail::findFirst(array(
                            'exp_item_id = :item: AND item_form_id = :form:',
                            'bind' => array(
                                'item' => $id,
                                'form' => $form
                            )
                        ));

                        if ($detail) {
                            $detail->item_form_value = $v;
                        } else {
                            $detail = new ItemDetail();

                            $detail->exp_id = $post['id_exp'];
                            $detail->exp_item_id = $query->data->exp_item_id;
                            $detail->item_form_id = $form;
                            $detail->item_form_value = $v;
                        }

                        $detail->save();
                    }
                }
            }
        }

        return $query;
    }

    public function deleteAction($id) {
        $query = Item::get($id);

        if ($query->data) {
            $expense = $query->data->expense;
            if ($query->data->delete()) {
                if ($expense) {
                    $expense->updateAmounts();
                }
            }
        }

        return array('success' => TRUE);
    }

}