<?php
namespace Admin\Model;
use Think\Model;

class ItemDataModel extends Model{
	protected $tableName = 'item_data';
	public function batchUpdate($datas = array()) {
		trace($datas, "datas");
		$result = true;
		//开启事务
		$this->startTrans();
		foreach ($datas as $data) {
			$map['group'] = $data['group'];
			$map['name'] = $data['name'];
			$value = array('value' => $data['value']);
			$state = $this->where($map)->save($value);
			if(!$state) {
				$result = false;
			}
		}
		if($result) {
			//批量更新成功，提交事务
			$this->commit();
		}else {
			//批量更新失败，事务回滚
			$this->rollback();
		}
	    return $result;
	}

	public function addItem($data = array()) {
		$map['group'] = $data['group'];
		$map['name'] = $data['name'];
		if($itemdata_db->where($map)->field('group', 'name')->find()) {
			$this->error('项目已经存在');
		}
		$state = $this->where($map)->save($value);
		$this->add($data);
		$state == 1 ? $result = true : $result = false;
		return $result;
	}
}