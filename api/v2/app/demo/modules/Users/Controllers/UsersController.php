<?php
namespace App\Users\Controllers;

use App\Users\Models\User,
    App\Roles\Models\Role;

class UsersController extends \Micro\Controller {

    public function findAction() {
        
        return User::get()->sortable()->filterable()->paginate();
    }

    public function findByIdAction($id) {
        return User::get($id); 
    }
    
    public function createAction() {
        $post = $this->request->getJson();
        $post['su_superior'] = $post['su_superior'] == '' ? NULL : $post['su_superior'];

        $user = new User();

        if (isset($post['su_passwd']) && ! empty($post['su_passwd'])) {
            $post['su_passwd'] = $this->security->createHash($post['su_passwd']);
        }

        if ($user->save($post)) {
            if (isset($post['su_kanban'])) {
                $user->saveKanban($post['su_kanban']);
            }

            if (isset($post['su_roles'])) {
                $user->saveRoles($post['su_roles']);
            }

            return User::get($user->su_id);
        }

        return User::none();
    }

    public function updateAction($id) {
        $query = User::get($id);

        if ($query->data) {
            $post = $this->request->getJson();
            $post['su_superior'] = $post['su_superior'] == '' ? NULL : $post['su_superior'];

            if (isset($post['su_passwd']) && ! empty($post['su_passwd'])) {
                $post['su_passwd'] = $this->security->createHash($post['su_passwd']);
            }
            
            if ($query->data->save($post)) {
                if (isset($post['su_kanban'])) {
                    $query->data->saveKanban($post['su_kanban']);
                }

                if (isset($post['su_roles'])) {
                    $query->data->saveRoles($post['su_roles']);
                }
            }
        }

        return $query;
    }

    public function deleteAction($id) {
        $query = User::get($id);

        if ($query->data) {
            return array(
                'success' => $query->data->delete()
            );
        }
        
        return array('success' => FALSE);
    }

    public function uploadAction($id) {
        $query = User::get($id);

        if ($query->data) {
            if ($this->request->hasFiles()) {
                foreach($this->request->getFiles() as $file) {
                    $type = $file->getExtension();
                    
                    $name = str_replace(array('@', '.'), '_', $query->data->su_email).'.'.$type;
                    $path = APPPATH.'public/resources/avatars/'.$name;

                    if (@$file->moveTo($path)) {
                        $query->data->save(array(
                            'su_avatar' => $name
                        ));
                    }
                }
            }
        }

        return $query;
    }
}