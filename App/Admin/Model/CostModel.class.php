<?php
namespace Admin\Model;
use Think\Model;
use Think\Model\RelationModel;

class CostModel extends RelationModel{
	protected $tableName = 'cost';
	protected $pk        = 'id';
	protected $_link = array(
			'Employee' => array(
					'mapping_type' => self::BELONGS_TO,
					'class_name'   =>'Employee',
					'foreign_key'  => 'eid',
					'as_fields' => 'name',
				),
		);
	//清除栏目相关缓存
	public function clearCatche(){
		S('cost_costlist', null);
	}
}