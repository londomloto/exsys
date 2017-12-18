<?php
namespace App\Trips\Controllers;

use App\Trips\Models\ItemHistory;

class ItemsHistoryController extends \Micro\Controller {

    public function downloadByIdAction($id) {
        $item = ItemHistory::findFirst(array(
            'trip_item_id = :id:',
            'bind' => array('id' => $id)
        ));
        
        if ($item && $item->hasAttachment()) {
            $this->file->download($item->getAttachment());
        } else {
            throw new \Phalcon\Exception("Attachment doesn't exists!");
        }
    }

}