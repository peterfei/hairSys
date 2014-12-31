<?php
namespace Admin\Model;

class IncomeModel {
	public function incomeStatistics()
	{
		# 收入统计
		$cost_db = D('Cost');
		$member_detail_db = D('MemberDetail');
		$sum_cost = $cost_db ->sum('real_pay');
		trace($sum_cost,"SUM_cost");
		$member_cost = $member_detail_db ->sum('pay');
		trace($member_cost,"MEMBER_cost");
		return ($sum_cost+$member_cost);
	}
}