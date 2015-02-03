<?php
namespace Admin\Controller;
use Admin\Controller\CommonController;

/**
 *  统计管理模块
 * @author Daniel
 */
class StatisticsController extends CommonController {
    public function statisticsList($search = array()){
        if(IS_POST){
            //搜索
            $date_where = array();
            if (! count($search)) {
                $date_where['created_time'] = array('between', array($this->getBegin(), $this->getEnd()));
            } else if ($search['beginDate'] == $search['endDate']) {
                $date_where['created_time'] = array('between', array($this->getBegin($search['beginDate']), $this->getEnd($search['endDate'])));
            } else if ($search['beginDate'] != '' && $search['endDate'] == '') {
                $date_where['created_time'] = array('egt', strtotime($search['beginDate']));
            } else if($search['beginDate'] == '' && $search['endDate'] != '') {
                $date_where['created_time'] = array('elt', strtotime($search['endDate']));
            } else if($search['beginDate'] != '' && $search['endDate'] != '') {
                $date_where['created_time'] = array('between', array(strtotime($search['beginDate']),strtotime($search['endDate'])));
            }
            
            $cost_db = D('Cost');
            //Get cash flows in specific date range
            $cash_flow_where['_complex'] = $date_where;
            $cash_flow_where['action'] = array('neq', '充值');
            $cash_flow_where['_string'] = 'cid is null';
            $cash_flow = $cost_db->where($cash_flow_where)->sum('real_pay');
            
            //Get member card flows in specific date range
            $mem_card_flow_where['_complex'] = $date_where;
            $mem_card_flow_where['action'] = array('neq', '充值');
            $mem_card_flow_where['_string'] = 'cid is not null';
            $mem_card_flow = $cost_db->where($mem_card_flow_where)->sum('real_pay');

            //Get member card top up flows in specific date range
            $mem_card_topup_where['_complex'] = $date_where;
            $mem_card_topup_where['action'] = array('eq', '充值');
            $mem_card_topup_where['_string'] = 'cid is not null';
            $mem_card_topup = $cost_db->where($mem_card_topup_where)->sum('real_pay');

            //Get member number of consumption in specific date range
            $mem_consume_num_where['_complex'] = $date_where;
            $mem_consume_num_where['action'] = array('neq', '充值');
            $mem_consume_num = $cost_db->where($mem_consume_num_where)->count('cid');

            //Get non member number of consumption in specific date range
            $non_mem_consume_num_where['_complex'] = $date_where;
            $non_mem_consume_num_where['action'] = array('neq', '充值');
            $non_mem_consume_num_where['_string'] = 'cid is null';
            $non_mem_consume_num = $cost_db->where($non_mem_consume_num_where)->count();

            $member_db = D('Member');
            //Get new member number in specific date range
            $new_mem_where['_complex'] = $date_where;
            $new_mem_num = $member_db->where($new_mem_where)->count('cid');

            //Get expired member in specific date range
            $invalid_mem_where['_complex'] = $date_where;
            $invalid_mem_where['status'] = array('lt', 0);
            $invalid_mem_num = $member_db->where($invalid_mem_where)->count('cid');


            trace($cash_flow, "cash_flow");
            trace($mem_card_flow, "mem_card_flow");
            trace($mem_card_topup, "mem_card_topup");
            trace($mem_consume_num, "mem_consume_num");
            trace($non_mem_consume_num, "non_mem_consume_num");
            trace($new_mem_num, "new_mem_num");
            trace($invalid_mem_num, "invalid_mem_num");


            $total = 7;
            $list = [
                ['name' => '现金消费(￥)', 'value' => $cash_flow, 'group' => '营业情况'],
                ['name' => '会员卡消费(￥)', 'value' => $mem_card_flow, 'group' => '营业情况'],
                ['name' => '会员卡充值(￥)', 'value' => $mem_card_topup, 'group' => '营业情况'],
                ['name' => '新增会员(#)', 'value' => $new_mem_num, 'group' => '其他'],
                ['name' => '未激活会员(#)', 'value' => $invalid_mem_num, 'group' => '其他'],
                ['name' => '会员消费人次(#)', 'value' => $mem_consume_num, 'group' => '其他'],
                ['name' => '普通消费人次(#)', 'value' => $non_mem_consume_num, 'group' => '其他']
            ];
            trace($list, 'List');
            $data = array('total' => 7, 'rows' => $list);
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

    #每天的开始和结束
    private function getBegin($date = '') {
        $begin = 0;
        if ($date == '') {
            $begin = mktime(0,0,0,date('m'),date('d'),date('Y'));
            trace($begin, 'Begin Time');
        } else {
            $begin = strtotime($date);
        }
        return $begin;
    }

    private function getEnd($date = '') {
        $end = 0;
        if ($end == '') {
            $end = mktime(23,59,59,date('m'),date('d'),date('Y'));
            trace($end, "End Time");
        } else {
            $end = strtotime($date . ' 23:59:59');
        }
        return $end;
    }
}