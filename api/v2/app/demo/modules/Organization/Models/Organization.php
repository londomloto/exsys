<?php
namespace App\Organization\Models;

class Organization extends \Micro\Model {

    public function initialize() {
        $this->hasOne(
            'org_type_id',
            'App\Organization\Models\OrganizationType',
            'org_type_id',
            array(
                'alias' => 'OrganizationType'
            )
        );
    }

    public function getSource() {
        return 'master_organization';
    }

    public function toArray($columns = NULL) {
        $data = parent::toArray($columns);
        $data['org_type_name'] = '';
        if ($this->organizationType) {
            $data['org_type_name'] = $this->organizationType->org_type_name;
        }
        return $data;
    }
}