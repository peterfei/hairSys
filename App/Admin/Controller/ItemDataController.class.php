<?php
namespace Admin\Controller;
use Admin\Controller\CommonController;

/**
 * 用户参数设置
 * @author Daniel
 */
class ItemDataController extends CommonController {
	public function showItem(){
		if(IS_POST){
			$itemdata_db = D('ItemData');
			if(I('get.dosubmit')){
				$datas = $_POST['data'];
				trace($datas, 'Update data');
				$state = $itemdata_db->batchUpdate($datas);
				$state ? $this->success('操作成功') : $this->error('操作失败');
			}else{
				$data = $itemdata_db->select();
				trace($data, "User data");
				$this -> ajaxReturn($data);
			}
		}else {
			$menu_db = D('Menu');
			$currentpos = $menu_db->currentPos(I('get.menuid'));  //栏目位置
			$propertygrid = array(
				'options'     => array(
	    			'title'   => $currentpos,
	    			'url'     => U('ItemData/showItem', array('grid'=>'propertygrid')),
	    			'showHeader'  => false,
	    			'toolbar' => 'itemdata_item_propertygrid_toolbar'
	    		)
			);
			$this->assign('propertygrid', $propertygrid);
			$this->display();
		}
	}

	/**
	 * 添加项目
	 */
	public function addItem(){
		if(IS_POST){
			$itemdata_db = D('ItemData');
			$data = I('post.info');

    		$map['group'] = $data['group'];
			$map['name'] = $data['name'];
			if($itemdata_db->where($map)->field('group', 'name')->find()) {
				$this->error('项目已经存在');
			}
			$state = $itemdata_db->add($data);
			if($state){
    			$this->success('添加成功');
    		}else {
    			$this->error('添加失败');
    		}
		}else{
			$itemdata_db = D('ItemData');
			$groups = $itemdata_db->distinct(true)->field('group')->select();
			trace($groups, 'groups');
			$this->assign('groups', array('data' => $groups));
			$this->display();
		}
	}
	
	/**
	 * 恢复出厂设置
	 */
	public function setDefault(){
		if(IS_POST){
			$setting_db = D('Setting');
			if($setting_db->where('1')->count()){
				$state = $setting_db->where('1')->delete();
				if($state){
					$setting_db->clearCatche();
					$this->success('操作成功');
				}else{
					$this->error('操作失败');
				}
			}
			$this->success('操作成功');
		}
	}
}