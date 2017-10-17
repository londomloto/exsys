<?php
namespace App\Menus\Controllers;

use App\Menus\Models\Menu;

class MenusController extends \Micro\Controller {

    public function findAction() {
        $params = $this->request->getQuery();
        $display = isset($params['display']) ? $params['display'] : 'grid';
        
        if ($display == 'tree') {
            return Menu::tree($params);
        } else {
            return Menu::grid($params);
        }
    }

    public function findByIdAction($id) {
        return Menu::get($id);
    }

    public function createAction() {
        $post = $this->request->getJson();
        $menu = new Menu();

        if ($menu->save($post)) {
            return Menu::get($menu->smn_id);
        }

        return Menu::none();
    }

    public function updateAction($id) {
        $post = $this->request->getJson();
        $menu = Menu::get($id);

        if ($menu->data) {
            $menu->data->save($post);
        }

        return $menu;
    }

    public function deleteAction($id) {
        $menu = Menu::get($id);
        $done = FALSE;

        if ($menu->data) {
            $done = $menu->data->delete();
        }

        return array(
            'success' => $done
        );
    }
}