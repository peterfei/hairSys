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
	public function memberList($page=1, $rows=10, $search = array(), $order = 'desc'){
		if(IS_POST){
			// if(S('member_memberlist')){
   //  			$data = S('member_memberlist');
   //  		}else{
   //  			$member_db = D('Member');
   //  			$data = $member_db->getTree();
   //  			S('member_memberlist', $data);
   //  		}
   //  		$this->ajaxReturn($data);
    		//搜索
    		$member_db = D('Member');
			$where = array();
			foreach ($search as $k=>$v){
				if(!$v) continue;
				switch ($k){
					// case 'username':
					default:
						$where[] = "`{$k}` like '%{$v}%'";
						break;
					
				}
			}
			$where = implode(' and ', $where);
			trace($where);
			$limit=($page - 1) * $rows . "," . $rows;
			$total = $member_db->where($where)->count();
			$order = "id ".$order;
			$field= array('cid as operateid','cid','name','sex','phone','status');
			$list = $total ? $member_db->field($field)->where($where)->order($order)->limit($limit)->select() : array();
    		$data = array('total'=>$total, 'rows'=>$list);
    		$this->ajaxReturn($data);
		}else{
			// trace(111);
			$menu_db = D('Menu');
			$currentpos = $menu_db->currentPos(I('get.menuid'));  //栏目位置
			$datagrid = array(
		        'options'       => array(
    				'title'     => $currentpos,
    				'url'       => U('Member/memberList', array('grid'=>'treegrid')),
    				'idField'   => 'cid',
    				'treeField' => 'name',
    				'toolbar'   => '#member_memberlist_datagrid_toolbar',
    			),
		        'fields' => array(
		        	'卡号'  => array('field'=>'cid','width'=>20,'align'=>'center','formatter'=>'memberViewFormatter'),
		        	'会员名称' => array('field'=>'name','width'=>15),
		        	'会员性别' => array('field'=>'sex','width'=>10,'formatter'=>'memberSexFormatter'),
		        	'会员电话'    => array('field'=>'phone','width'=>20),
    				'状态'    => array('field'=>'status','width'=>10,'formatter'=>'memberStatusFormatter'),
		        	'管理操作' => array('field'=>'operateid','width'=>50,'align'=>'center','formatter'=>'memberListOperateFormatter'),
    			)
		    );
		    $this->assign('datagrid', $datagrid);
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
			// dump(dict_attr('MEMER'));
			// dict();
			
			$this->assign('typelist', dict_attr('MEMER'));
			$this->display('member_add');
		}
	}
	
	/**
	 * 加入会员消费
	 * 单次消费 
	 * Member(blance-pay)
	 */
	public function memberAddDetail()
	{
		if (IS_POST) {
			# code...
			$data = I('post.detail');
			// trace($data);
			// trace('1122');
			$member_db = D('Member');
			$member_detail_db = D('MemberDetail');
			$update = $member_db ->where("id=".$data['mid'])->setDec('blance',$data['pay']);
			// trace($member_db ->where("id=".$data['mid']));
    		// $data['ismenu'] = $data['ismenu'] ? '1' : '0';
    		// 累计额度
    		// $cumulativeAttr = $member_db ->where("id=".$data['mid'])->getField('blance');
    		$data['cumulative'] = $member_db ->where("id=".$data['mid'])->getField('blance'); 
    		//添加时间
			$data['createtime'] = time();
			//操作人ID
			$data['operate_id'] = session('userid');
    		// trace($cumulativeAttr);
    		$id = $member_detail_db->add($data);
    		if($id){
    			
    			
    			
    			
    			// $member_detail_db->clearCatche();
    			$this->success('计费成功');
    		}else {
    			$this->error('计费失败');
    		}
		}else{
		
		// if(S('member_member_detail_list')){
  //   			$data = S('member_member_detail_list');
  //   		}else{
  //   			$member_detail_db = D('MemberDetail');
  //   			$data = $member_detail_db->getTree();
  //   			S('member_member_detail_list', $data);
  //   		}
  //   		$this->ajaxReturn($data);
		$member_db = D('Member');
		$idAttr=$member_db->where(array('cid'=>I('get.cid')))->field(array('id','blance'))->find();
		trace($idAttr,"ID");
		$this->assign('id',$idAttr['id']);
		$this->assign('cumulative',$idAttr['blance']);
		$this->display('member_add_detail');
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
	
	/**
	 * cid校验
	 */
	public function public_cidCheck($cid='')
	{
		// if(I('post.default') == $name) $this->error('菜单名称相同');
		
        $Member = D('Member');
        $exists = $Member->checkCid(I('post.cid'));
        if ($exists) {
            $this->success('卡号存在');
        }else{
            $this->error('卡号不存在');
        }
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