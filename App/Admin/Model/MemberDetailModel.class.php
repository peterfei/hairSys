<?php
namespace Admin\Model;
use Think\Model;
use Think\Model\RelationModel;

class MemberDetailModel extends RelationModel{
	protected $tableName = 'member_detail';
	protected $pk        = 'id';
	protected $fields = array('FROM_UNIXTIME(createtime, "%Y-%m-%d %H:%i:%s") as createtime');
	protected $_link = array(
			'Member' => array(
					'mapping_type' => self::BELONGS_TO,
					'class_name'   =>'Member',
					'foreign_key'  => 'mid',
					'as_fields' => 'phone,name,cid,blance',
				),
		);
	//获取会员列表
	public function getTree(){
		$field = array('mid','`id` as `operateid`','pay');
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
		S('member_member_detail_list', null);
		
	}
}