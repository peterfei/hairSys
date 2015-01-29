<?php
namespace Admin\Controller;
use Admin\Controller\CommonController;

/**
 * 普通消费管理模块
 * @author peterfei
 */
class StatisticsController extends CommonController {
    /**
     * 普通消费管理列表
     */
    public function statisticsList($page=1, $rows=10, $search = array('createdtime' => 'day'), $order = 'desc'){
        if(IS_POST){
            //搜索
            $cost_db = D('Cost');
            trace($search, 'Search: ', 'DEBUG');
            $where = array();
            foreach ($search as $k=>$v) {
                if(!$v) continue;
                if ($v[0] != '' && $v[1] == ''){
                    $where = $k . " >= " . strtotime($v[0]);
                } else if($v[0] == '' && $v[1] != ''){
                    $where = $k . " <= " . strtotime($v[1]);
                } else if($v[0] != '' && $v[1] != '') {
                    $where = $k . " between " . strtotime($v[0]) . " and " . strtotime($v[1]);
                }
            } 
            // $where = implode(' and ', $where);
            trace($where,'Where ');
            $limit=($page - 1) * $rows . "," . $rows;
            $total = $cost_db->where($where)->count();
            $order = "id ".$order;
            $field= array('pid','real_pay','FROM_UNIXTIME(modified, "%Y-%m-%d %H:%i:%s") as modified','operate_id','point');
            $list = $total ? $cost_db->field($field)->where($where)->order($order)->limit($limit)->select() : array();
            $totalPay = 0;
            foreach ($list as $value) {
                $totalPay += $value['real_pay'];
            }
            $footer = [['pid' => 'Total: ', 'real_pay' => $totalPay]];
            trace($list, 'List');
            $data = array('total'=>$total, 'rows'=>$list, 'footer' => $footer);
            $this->ajaxReturn($data);
        }else{
            $menu_db = D('Menu');
            $currentpos = $menu_db->currentPos(I('get.menuid'));  //栏目位置
            $datagrid = array(
                'options'       => array(
                    'title'     => $currentpos,
                    // 'view'    => 'detailview',
                    // 'detailFormatter' => 'detailFormatter',
                    // 'onExpandRow' => 'onExpandRow',
                    'url'       => U('Statistics/statisticsList', array('grid'=>'treegrid')),
                    'idField'   => 'id',
                    'treeField' => 'name',
                    'toolbar'   => '#statistics_list_datagrid_toolbar',
                    'rownumbers'=> true,
                    'showFooter'=> true,
                ),
                'fields' => array(
                    '项目'  => array('field'=>'pid','width'=>20,'align'=>'center','sortable'=>true),
                    '实付'    => array('field'=>'real_pay','width'=>10,'sortable'=>true),
                    '消费时间'    => array('field'=>'modified','width'=>20),
                    '操作人'    => array('field'=>'operate_id','width'=>10,'sortable'=>true),
                    '是否点牌'    => array('field'=>'point','width'=>10, 'sortable'=>true), 
                )
            );
            $this->assign('datagrid', $datagrid);
            $this->display('statistics_list');
        }
    }
    {"total":7,"rows":[
        {"name":"现金消费(￥)","value":"800","group":"营业情况"},
        {"name":"会员卡消费(￥)","value":"500","group":"营业情况"},
        {"name":"会员卡充值(￥)","value":"40","group":"营业情况"},
        {"name":"新增会员(#)","value":"3","group":"ID Settings"},
        {"name":"过期会员(#)","value":"3","group":"ID Settings"},
        {"name":"会员消费人次(#)","value":"123-456-7890","group":"ID Settings"},
        {"name":"普通消费人次(#)","value":"bill@gmail.com","group":"Marketing Settings"},
        {"name":"FrequentBuyer","value":"false","group":"Marketing Settings","editor":{
            "type":"checkbox",
            "options":{
                "on":true,
                "off":false
            }
        }}
    ]}

    public function sublist($pid, $createdtime) {
        $cost_db = D('Cost');
        $where = array();
        foreach ($search as $k=>$v) {
            if(!$v) continue;
            switch ($createdtime){
                case 'day':
                case 'week':
                case 'month':
                case 'year': 
                    $where = "createdtime" . " between " . self::getBegin($v) . " and " . self::getEnd($v) . " and pid = '" . $pid . "'"; 
                    break;
                default:
                    if ($v[0] != '' && $v[1] == ''){
                        $where = $k . " >= " . strtotime($v[0]);
                    } else if($v[0] == '' && $v[1] != ''){
                        $where = $k . " <= " . strtotime($v[1]);
                    } else if($v[0] != '' && $v[1] != '') {
                        $where = $k . " between " . strtotime($v[0]) . " and " . strtotime($v[1]);
                    }
                    break;
            }
        } 
        // $where = implode(' and ', $where);
        trace($where,'Where ');
        $limit=($page - 1) * $rows . "," . $rows;
        $total = $cost_db->where($where)->count();
        $order = "id ".$order;
        $field= array('pid','real_pay','FROM_UNIXTIME(modified, "%Y-%m-%d %H:%i:%s") as modified','operate_id','point');
        $list = $total ? $cost_db->field($field)->where($where)->order($order)->limit($limit)->select() : array();
        $totalPay = 0;
        foreach ($list as $value) {
            $totalPay += $value['real_pay'];
        }
        $footer = [['pid' => 'Total: ', 'real_pay' => $totalPay]];
        trace($list, 'List');
        $data = array('total'=>$total, 'rows'=>$list, 'footer' => $footer);
        $this->ajaxReturn($data);
    }

    #每天的开始和结束
    private function getBegin($date = 'day') {
        $begin = 0;
        switch ($date) {
            case 'day':
                $begin = mktime(0,0,0,date('m'),date('d'),date('Y'));
            case 'week':
                $begin = mktime(0,0,0,date('m'),date('d')-date('w')+1,date('Y'));
                break;
            case 'month':
                $begin = mktime(0,0,0,date('m'),1,date('Y'));
                break;
            case 'year':
                $begin = mktime(0,0,0,1,1,date('Y'));
                break;
            default:
                break;
        }
        return $begin;
    }

    private function getEnd($date = 'day') {
        $end = 0;
        switch ($date) {
            case 'day':
                $end = mktime(0,0,0,date('m'),date('d')+1,date('Y'))-1;
            case 'week':
                $end = mktime(23,59,59,date('m'),date('d')-date('w')+7,date('Y'));
                break;
            case 'month':
                $end = mktime(23,59,59,date('m'),date('t'),date('Y'));
                break;
            case 'year':
                $end = mktime(23,59,59,12,date('t'),date('Y'));
                break;
            default:
                break;
        }
        return $end;
    }
}