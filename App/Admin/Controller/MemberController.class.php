<?php
namespace Admin\Controller;
use Admin\Controller\CommonController;

/**
 * 会员相关模块
 * @author peterfei
 */
class MemberController extends CommonController {
	/**
	 * 会员管理
	 */
	public function memberList(){
		if(IS_POST){
			if(S('member_memberlist')){
    			$data = S('member_memberlist');
    		}else{
    			$member_db = D('Member');
    			$data = $member_db->getTree();
    			S('member_memberlist', $data);
    		}
   //  		$limit=($page - 1) * $rows . "," . $rows;
			// $total = $log_db->where($where)->count();
			// $order = $sort.' '.$order;
			// $list = $total ? $log_db->where($where)->order($order)->limit($limit)->select() : array();
    		// $data = array('total'=>20, 'rows'=>$data);
    		// trace($data);
    		$this->ajaxReturn($data);
		}else{
			// trace(111);
			$menu_db = D('Menu');
			$currentpos = $menu_db->currentPos(I('get.menuid'));  //栏目位置
			$treegrid = array(
		        'options'       => array(
    				'title'     => $currentpos,
    				'url'       => U('Member/memberList', array('grid'=>'treegrid')),
    				'idField'   => 'cid',
    				'treeField' => 'name',
    				'toolbar'   => 'member_memberlist_treegrid_toolbar',
    			),
		        'fields' => array(
		        	'卡号'  => array('field'=>'cid','width'=>20,'align'=>'center'),
		        	'会员名称' => array('field'=>'name','width'=>15),
		        	'会员性别' => array('field'=>'sex','width'=>10),
		        	'会员电话'    => array('field'=>'phone','width'=>20),
    				'状态'    => array('field'=>'status','width'=>10),
		        	'管理操作' => array('field'=>'operateid','width'=>50,'align'=>'center','formatter'=>'memberListOperateFormatter'),
    			)
		    );
		    $this->assign('treegrid', $treegrid);
			$this->display('member_list');
		}
	}
	
	/**
	 * 添加会员
	 */
	public function memberAdd(){
		if(IS_POST){
			$member_db = D('Member');
			$data = I('post.info');
			trace($data);
    		// $data['ismenu'] = $data['ismenu'] ? '1' : '0';
    		$id = $member_db->add($data);
    		if($id){
    			$member_db->clearCatche();
    			$this->success('添加成功');
    		}else {
    			$this->error('添加失败');
    		}
		}else{
			// dict();
			$this->assign('typelist', C('CONTENT_CATEGORY_TYPE'));
			$this->display('member_add');
		}
	}
	
	/**
	 * 编辑栏目
	 */
	public function categoryEdit($id){
		$category_db = D('Category');
		if(IS_POST){
			$data = I('post.info');
    		$data['ismenu'] = $data['ismenu'] ? '1' : '0';
    		$res = $category_db->where(array('catid'=>$id))->save($data);
    		if($res){
    			$category_db->clearCatche();
    			$this->success('操作成功');
    		}else {
    			$this->error('操作失败');
    		}
		}else{
			$info = $category_db->where(array('catid'=>$id))->find();
			$this->assign('info', $info);
			$this->assign('typelist', C('CONTENT_CATEGORY_TYPE'));
			$this->display('category_edit');
		}
	}
	
	/**
	 * 删除栏目
	 */
	public function categoryDelete($id = 0){
		if($id && IS_POST){
			$category_db = D('Category');
    		$result = $category_db->where(array('catid'=>$id))->delete();
    		if($result){
    			$category_db->clearCatche();
    			$this->success('删除成功');
    		}else {
    			$this->error('删除失败');
    		}
    	}else{
			$this->error('删除失败');
    	}
	}
	
	/**
	 * 栏目排序
	 */
	public function categoryOrder(){
		if(IS_POST) {
			$category_db = D('Category');
			foreach(I('post.order') as $id => $listorder) {
				$category_db->where(array('catid'=>$id))->save(array('listorder'=>$listorder));
			}
			$category_db->clearCatche();
			$this->success('操作成功');
		} else {
			$this->error('操作失败');
		}
	}
	
}