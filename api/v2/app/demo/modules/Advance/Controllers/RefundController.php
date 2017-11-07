<?php
namespace App\Advance\Controllers;

use App\Advance\Models\Refund;

class RefundController extends \Micro\Controller {

    public function findAction() {
        return Refund::get()->filterable()->sortable()->paginate();
    }

    public function createAction() {
        $post = $this->request->getJson();
        $data = new Refund();

        if ($data->save($post)) {
            return Refund::get($data->refund_id);
        }

        return Refund::none();
    }

    public function updateAction($id) {
        $post = $this->request->getJson();
        $query = Refund::get($id);

        if ($query->data) {
            $query->data->save($post);
        }

        return $query;
    }

    public function deleteAction($id) {
        $query = Refund::get($id);

        if ($query->data) {
            $query->data->delete();
        }
        
        return array('success' => TRUE);
    }

    public function uploadByIdAction($id) {
        $query = Refund::get($id);

        if ($query->data) {
            if ($this->request->hasFiles()) {
                foreach($this->request->getFiles() as $file) {
                    $type = $file->getExtension();
                    $name = 'advance_refund_'.$query->data->refund_id.'.'.$type;
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
        
    }
}