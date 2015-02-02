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
    public function statisticsList($page=1, $rows=10, $search = array(), $order = 'desc'){
        if(IS_POST){
            //搜索
            // $cost_db = D('Cost');
            // trace($search, 'Search: ', 'DEBUG');
            // $where = array();
            // foreach ($search as $k=>$v) {
            //     if(!$v) continue;
            //     if ($v[0] != '' && $v[1] == ''){
            //         $where = $k . " >= " . strtotime($v[0]);
            //     } else if($v[0] == '' && $v[1] != ''){
            //         $where = $k . " <= " . strtotime($v[1]);
            //     } else if($v[0] != '' && $v[1] != '') {
            //         $where = $k . " between " . strtotime($v[0]) . " and " . strtotime($v[1]);
            //     }
            // } 
            // // $where = implode(' and ', $where);
            // trace($where,'Where ');
            // $limit=($page - 1) * $rows . "," . $rows;
            // $total = $cost_db->where($where)->count();
            // $order = "id ".$order;
            // $field= array('pid','real_pay','FROM_UNIXTIME(createdtime, "%Y-%m-%d %H:%i:%s") as modified','operate_id','point');
            // $list = $total ? $cost_db->field($field)->where($where)->order($order)->limit($limit)->select() : array();
            // $totalPay = 0;
            // foreach ($list as $value) {
            //     $totalPay += $value['real_pay'];
            // }
            // $footer = [['pid' => 'Total: ', 'real_pay' => $totalPay]];
            $cost_db = D('Cost');
            $date_where = array();
            foreach ($search as $k=>$v) {
                if(!$v) continue;
                if ($v[0] != '' && $v[1] == ''){
                    $date_where[$k] = array('egt', strtotime($v[0]));
                } else if($v[0] == '' && $v[1] != ''){
                    $date_where[$k] = array('elt', strtotime($v[1]));
                } else if($v[0] != '' && $v[1] != '') {
                    $date_where[$k] = array('between', array(strtotime($v[0]),strtotime($v[1])));
                }
            }

            $cost_db = D('Cost');
            $cash_flow_where['_complex'] = $date_where;
            $cash_flow_where['action'] = array('neq', '充值');
            $cash_flow_where['_string'] = 'cid is null';
            $cash_flow = $cost_db->where($cash_flow_where)->sum('real_pay');

            $mem_card_flow_where['_complex'] = $date_where;
            $mem_card_flow_where['action'] = array('neq', '充值');
            $mem_card_flow_where['_string'] = 'cid is not null';
            $mem_card_flow = $cost_db->where($mem_card_flow_where)->sum('real_pay');

            $mem_card_topup_where['_complex'] = $date_where;
            $mem_card_topup_where['action'] = array('eq', '充值');
            $mem_card_topup_where['_string'] = 'cid is not null';
            $mem_card_topup = $cost_db->where($mem_card_topup_where)->sum('real_pay');
            $total = 7;
            $list = [
                ['name' => '现金消费(￥)', 'value' => '4000', 'group' => '营业情况'],
                ['name' => '会员卡消费(￥)', 'value' => '5000', 'group' => '营业情况'],
                ['name' => '会员卡充值(￥)', 'value' => '8000', 'group' => '营业情况'],
                ['name' => '新增会员(#)', 'value' => '40', 'group' => '其他'],
                ['name' => '过期会员(#)', 'value' => '30', 'group' => '其他'],
                ['name' => '会员消费人次(#)', 'value' => '200', 'group' => '其他'],
                ['name' => '普通消费人次(#)', 'value' => '500', 'group' => '其他',"editor" => [
                    "type" => "validatebox",
                    "options" => [
                        "validType" => "email"
                    ]]
                ]
            ];
            trace($list, 'List');
            $data = array('total'=>$total, 'rows'=>$list);
            $this->ajaxReturn($data);
        }else{
            $menu_db = D('Menu');
            $currentpos = $menu_db->currentPos(I('get.menuid'));  //栏目位置
            $propertygrid = array(
                'options'       => array(
                    'title'     => $currentpos,
                    'url'       => U('Statistics/statisticsList', array('grid'=>'treegrid')),
                    'toolbar'   => '#statistics_propertygrid_toolbar',
                    'method'    => 'post',
                    'columns' =>  array(array(array('field'=>'name','title'=>'属性名称','width'=>40),array('field'=>'value','title'=>'属性值','width'=>40))),
                    'showGroup' => true,
                    'showHeader'  => false,
                    'scrollbarSize' => 0
                )
            );
            $this->assign('propertygrid', $propertygrid);
            $this->display('statistics_list');
        }
    }

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