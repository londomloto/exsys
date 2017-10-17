<?php

namespace App\Project\Controllers;

use 
	App\Project\Models\Project,
	App\Project\Models\RefProject,
	App\Waspang\Models\Waspang;

class ProjectController extends \Micro\Controller {

	private $_projectName = [];

	function findAction() {
		return Project::get()->sortable()->paginate();
	}

	function findByIdAction($id) {

		return Project::get($id)->sortable()->paginate();
	}

	function uploadAction() {

		$post = $_POST;

		$this->dx->setup(array(
			'profile' => 'project',
			'source' => 'userfile',
			'dbtype' => 'postgre',
			'listeners' => array(
				'beforeinsertrow' => function($a, $b, $c) {
					if($b) {
						foreach($b as $key => $value) {
							$value->tp_status_flag = 'ON GOING';
							$value->tp_start_date = date('Y-m-d H:i:s', $post['start_date']);
							$value->tp_end_date = date('Y-m-d H:i:s', $post['end_date']);

							$this->_projectName[] = $value->tp_project_name;
						}
					}
				},
				'afterinsertrow' => function($a, $b) {

					if($b) {
						$insertWaspang = [];

						foreach($b as $idx => $colNames) {
							foreach($colNames as $colName => $colVal) {
								$insertWaspang[$idx][str_replace('tp_', 'tw_', $colName)] = $colVal;
							}
						}

						if($insertWaspang) {
							for($i = 0, $j = count($insertWaspang); $i < $j; $i++) {
								$insertWaspang[$i]['tw_date'] = date('Y-m-d H:i:s');

								$waspangModel = new Waspang;
								$waspangModel->save($insertWaspang[$i]);
							}
						}
					}
				}
			)
		));
		
		$this->dx->save();

		if($this->dx->success()) {

			$db = $this->db;
			$arrProjectName = array_unique($this->_projectName);

			for($i = 0, $j = count($arrProjectName); $i < $j; $i++) {

				if($arrProjectName[$i]) {

					$queryCount = "SELECT COUNT(DISTINCT tp_parent_id) as parent_cnt FROM trx_project WHERE UPPER(tp_project_name) = '".strtoupper($arrProjectName[$i])."'";

					$getParentCount = $db->fetchOne($queryCount);

					if($getParentCount) {
						$insertRefProject = array(
							'rp_project_name' => $arrProjectName[$i],
							'rp_create_date' => date('Y-m-d H:i:s'),
							'rp_swu_id' => null,
							'rp_parent_count' => $getParentCount['parent_cnt'],
							'rp_real_count' => 0,
							'rp_part_group' => null
						);
						
						$refProjectModel = new RefProject;
						$refProjectModel->save($insertRefProject);
					}
				}
			}
		}

		return array(
			'success' => $this->dx->success(),
			'error' => $this->dx->error(),
			'info' => $this->dx->info()
		);
	}

	function showPointAction() {
		return Project::fetchAll();
	}
}