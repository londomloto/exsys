<?php
namespace App\Trips\Controllers;

use App\Trips\Models\Item;

class ItemsController extends \Micro\Controller {

    public function findAction() {
        $params = $this->request->getParams();
        $query = Item::get();
        
        if (isset($params['trip'])) {
            $query->where('id_trip = :trip:', array('trip' => $params['trip']));
        }

        return $query->paginate();
    }

    public function findByIdAction($id) {
        return Item::get($id);
    }

    public function createAction() {
        $post = $this->request->getJson();
        $data = new Item();
        if ($data->save($post)) {
            return Item::get($data->trip_item_id);
        }
        return Item::none();
    }

    public function updateAction($id) {
        $post = $this->request->getJson();

        // fixup time
        if (isset($post['transport_departure_time'])) {
            $time = $post['transport_departure_time'];
            $time = str_replace('.', ':', $time);
            $post['transport_departure_time'] = $time;
        }

        $query = Item::get($id);

        if ($query->data) {
            $query->data->save($post);
        }

        return $query;
    }

    public function deleteAction($id) {
        $query = Item::get($id);

        if ($query->data) {
            $query->data->delete();
        }

        return array('success' => TRUE);
    }

    public function uploadByIdAction($id) {
        $query = Item::get($id);

        if ($query->data) {
            if ($this->request->hasFiles()) {
                foreach($this->request->getFiles() as $file) {
                    $type = $file->getExtension();
                    $name = 'ticket_'.$query->data->trip_item_id.'.'.$type;
                    $path = APPPATH.'public/resources/attachments/'.$name;

                    if (@$file->moveTo($path)) {
                        $query->data->save(array(
                            'attachment' => $name
                        ));
                    }
                }
            }
        }

        return $query;
    }

    public function downloadByIdAction($id) {
        $item = Item::get($id)->data;
        if ($item && $item->hasAttachment()) {
            $this->file->download($item->getAttachment());
        } else {
            throw new \Phalcon\Exception("Attachment doesn't exists!");
        }
    }

}