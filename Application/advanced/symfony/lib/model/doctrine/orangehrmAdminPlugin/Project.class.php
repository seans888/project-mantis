<?php

/**
 * Project class file
 */

/**
 * Project
 * 
 * This class has been auto-generated by the Doctrine ORM Framework
 * 
 * @package    orangehrm
 * @subpackage model\admin
 */
class Project extends PluginProject {
	
	const ACTIVE_PROJECT = 0;
	const DELETED_PROJECT = 1;
	const NO_OF_RECORDS_PER_PAGE = 50;
	
	public function getCustomerName() {
		return $this->getCustomer()->getName();
	}
	
	public function getProjectAdminNames() {
		
		$names = array();
		$admins = $this->getProjectAdmin();
		
		foreach ($admins as $admin){
			$names[] = $admin->getEmployee()->getFullName();
		}
		return implode(',', $names);
	}
	
}
