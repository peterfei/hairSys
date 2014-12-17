<?php
namespace Admin\Model;
use Think\Model;

class MemberModel extends Model{
	protected $tableName = 'member';
	protected $pk        = 'id';
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
	
	
	
	//清除栏目相关缓存
	public function clearCatche(){
		S('member_memberlist', null);
		S('category_public_categoryselect', null);
		S('content_public_right', null);
	}
}