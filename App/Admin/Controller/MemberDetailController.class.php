<?php
namespace Admin\Controller;
use Admin\Controller\CommonController;

/**
 * 会员相关模块
 * @author peterfei
 */
class MemberDetailController extends CommonController {
	/**
	 * 会员管理
	 */
	public function detailList($page=1, $rows=10, $search = array(), $order = 'desc'){
    		//搜索
    		$member_detail_db = D('MemberDetail');
			// $where = array();
			// foreach ($search as $k=>$v){
			// 	if(!$v) continue;
			// 	switch ($k){
			// 		// case 'username':
			// 		default:
			// 			$where[] = "`{$k}` = '{$v}'";
			// 			break;
					
			// 	}
			// }
			// $where = implode(' and ', $where);
			// trace("111");
			$where = "mid = ".I('get.mid');
			// trace($member_detail_db->relation('Member')->find(1),"RELATION");
			$limit=($page - 1) * $rows . "," . $rows;
			$field = array('FROM_UNIXTIME(createtime, "%Y-%m-%d %H:%i:%s") as createtime','mid','cumulative','pay','re_pay');
			$total = $member_detail_db->relation('Member')->field($field)->where($where)->count();
			$order = "id ".$order;
			$list = $total ? $member_detail_db->relation('Member')->field($field)->where($where)->order($order)->limit($limit)->select() : array();
			trace($list);
    		$data = array('total'=>$total, 'rows'=>$list);
    		// $data = $member_detail_db->select();
    		trace($data);
    		$this->ajaxReturn($data);
		
	}
	
	

	/**
	 * phone校验
	 */
	public function public_phoneCheck($phone='')
	{
		// if(I('post.default') == $name) $this->error('菜单名称相同');
		
        $Member = D('Member');
        $exists = $Member->checkPhone(I('post.phone'));
        if ($exists) {
            $this->success('该手机已存在');
        }else{
            $this->error('手机不存在');
        }
	}
}