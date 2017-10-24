<?php
namespace App\Statuses\Models;

class Status extends \Micro\Model {

    public function getSource() {
        return 'master_status';
    }

    public static function val($code) {
        static $stats;

        if (is_null($stats)) {
            $stats = array();
            foreach(self::find() as $row) {
                $stats[$row->status_code] = $row->status_id;
            }
        }

        return isset($stats[$code]) ? $stats[$code] : NULL;
    }

}