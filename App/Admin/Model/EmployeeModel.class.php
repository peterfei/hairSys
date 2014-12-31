<?php
namespace Admin\Model;
use Think\Model;
use Think\Model\RelationModel;

class EmployeeModel extends RelationModel{
	protected $tableName = 'employee';
	protected $pk        = 'id';
	protected $_link = array(
			"Cost" => self::HAS_MANY,
			// 'MemberDetail' => array(
			// 		'mapping_type' => self::HAS_MANY,
			// 		// 'class_name'   =>'MemberDetail',
			// 		// 'foreign_key'  => 'mid',
			// 	);
		);
	//获取会员列表
	public function getTree(){
		$field = array('cid','name','sex','created','level','status','phone','`id` as `operateid`','blance');
		$order = '`id` DESC';
		$data = $this->field($field)->order($order)->select();
		trace($data);
		// dump($data);exit;
		// E($data);
		
		return $data;
	}
	
	/**
	 * 检查卡号是否存在
	 */
	public function checkCid($cid){
		$cid =  trim($cid);
		if ($this->where(array('cid'=>$cid))->field('id')->find()){
			return true;
		}
		return false;
	}
	
	/**
	 * 检查手机是否存在
	 */
	public function checkPhone($phone){
		$phone =  trim($phone);
		if ($this->where(array('phone'=>$phone))->field('id')->find()){
			return true;
		}
		return false;
	}
	//清除栏目相关缓存
	public function clearCatche(){
		S('employee_employeelist', null);
	}
}