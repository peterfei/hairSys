<?php
return array(
	/* 前台设置  */
	// 'SITE_TITLE' => array(
	// 	'name'    => '站点标题',
	// 	'group'   => '前台设置',
	// 	'editor'  => 'text',
	// 	'default' => '',
	// ),
	// 'SITE_KEYWORDS' => array(
	// 	'name'    => '关键字',
	// 	'group'   => '前台设置',
	// 	'editor'  => 'text',
	// 	'default' => '',
	// ),
	// 'SITE_DESCRIPTION' => array(
	// 	'name'    => '描述',
	// 	'group'   => '前台设置',
	// 	'editor'  => 'textarea',
	// 	'default' => '',
	// ),
	// 'SITE_ICP' => array(
	// 	'name'    => '备案号',
	// 	'group'   => '前台设置',
	// 	'editor'  => 'text',
	// 	'default' => '',
	// ),
	
	/* 后台设置  */
	'SAVE_LOG_OPEN' => array(
		'name'    => '开启后台日志记录',
		'group'   => '后台设置',
		'editor'  => array('type'=>'checkbox','options'=>array('on'=>'开启','off'=>'关闭')),
		'default' => C('SAVE_LOG_OPEN') ? '开启' : '关闭',
	),
	// 'MAX_LOGIN_TIMES' => array(
	// 	'name'    => '登录失败后允许最大次数',
	// 	'group'   => '后台设置',
	// 	'editor'  => 'numberbox',
	// 	'default' => C('MAX_LOGIN_TIMES'),
	// ),
	// 'LOGIN_WAIT_TIME' => array(
	// 	'name'    => '错误等待时间(分钟)',
	// 	'group'   => '后台设置',
	// 	'editor'  => 'numberbox',
	// 	'default' => C('LOGIN_WAIT_TIME'),
	// ),
	'DATAGRID_PAGE_SIZE' => array(
		'name'    => '列表默认分页数',
		'group'   => '后台设置',
		'editor'  => 'numberbox',
		'default' => C('DATAGRID_PAGE_SIZE'),
	),
	
	/* 上传设置  */
	'FILE_UPLOAD_CONFIG.exts' => array(
		'name'    => '允许上传扩展(全局)',
		'group'   => '上传设置',
		'editor'  => 'text',
		'default' => C('FILE_UPLOAD_CONFIG.exts.exts'),
	),
	'FILE_UPLOAD_CONFIG.maxSize' => array(
		'name'    => '允许上传大小(全局)',
		'group'   => '上传设置',
		'editor'  => 'numberbox',
		'default' => C('FILE_UPLOAD_CONFIG.maxSize'),
	),
	'FILE_UPLOAD_LINK_CONFIG.exts' => array(
		'name'    => '允许上传扩展(附件)',
		'group'   => '上传设置',
		'editor'  => 'text',
		'default' => C('FILE_UPLOAD_LINK_CONFIG.exts'),
	),
	'FILE_UPLOAD_IMG_CONFIG.exts' => array(
		'name'    => '允许上传扩展(图片)',
		'group'   => '上传设置',
		'editor'  => 'text',
		'default' => C('FILE_UPLOAD_IMG_CONFIG.exts'),
	),
	'FILE_UPLOAD_FLASH_CONFIG.exts' => array(
		'name'    => '允许上传扩展(动画)',
		'group'   => '上传设置',
		'editor'  => 'text',
		'default' => C('FILE_UPLOAD_FLASH_CONFIG.exts'),
	),
	'FILE_UPLOAD_MEDIA_CONFIG.exts' => array(
		'name'    => '允许上传扩展(媒体)',
		'group'   => '上传设置',
		'editor'  => 'text',
		'default' => C('FILE_UPLOAD_MEDIA_CONFIG.exts'),
	),
	
	// /* 邮箱设置  */
	// 'EMAIL_SMTP' => array(
	// 	'name'    => 'SMTP',
	// 	'group'   => '邮箱设置',
	// 	'editor'  => 'text',
	// 	'default' => '',
	// ),
	// 'EMAIL_PORT' => array(
	// 	'name'    => '端口',
	// 	'group'   => '邮箱设置',
	// 	'editor'  => 'numberbox',
	// 	'default' => '25',
	// ),
	// 'EMAIL_EMAIL' => array(
	// 	'name'    => '邮箱地址',
	// 	'group'   => '邮箱设置',
	// 	'editor'  => 'text',
	// 	'default' => '',
	// ),
	// 'EMAIL_USER' => array(
	// 	'name'    => '用户名',
	// 	'group'   => '邮箱设置',
	// 	'editor'  => 'text',
	// 	'default' => '',
	// ),
	// 'EMAIL_PWD' => array(
	// 	'name'    => '密码',
	// 	'group'   => '邮箱设置',
	// 	'editor'  => 'text',
	// 	'default' => '',
	// ),
	
	// /* 飞信设置  */
	// 'FETION_USER' => array(
	// 	'name'    => '用户名',
	// 	'group'   => '飞信设置',
	// 	'editor'  => 'text',
	// 	'default' => '',
	// ),
	// 'FETION_PWD' => array(
	// 	'name'    => '密码',
	// 	'group'   => '飞信设置',
	// 	'editor'  => 'text',
	// 	'default' => '',
	// ),
	
	// /* 登录接口设置  */
	// 'API_SINA_APPKEY' => array(
	// 	'name'    => '新浪AppKey',
	// 	'group'   => '登录接口设置',
	// 	'editor'  => 'text',
	// 	'default' => '',
	// ),
	// 'API_SINA_SECRET' => array(
	// 	'name'    => '新浪AppSecret',
	// 	'group'   => '登录接口设置',
	// 	'editor'  => 'text',
	// 	'default' => '',
	// ),
	
	// 'API_QQ_APPKEY' => array(
	// 	'name'    => 'QQAppKey',
	// 	'group'   => '登录接口设置',
	// 	'editor'  => 'text',
	// 	'default' => '',
	// ),
	// 'API_QQ_SECRET' => array(
	// 	'name'    => 'QQAppSecret',
	// 	'group'   => '登录接口设置',
	// 	'editor'  => 'text',
	// 	'default' => '',
	// ),
	
	// 'API_GOOGLE_APPKEY' => array(
	// 	'name'    => '谷歌AppKey',
	// 	'group'   => '登录接口设置',
	// 	'editor'  => 'text',
	// 	'default' => '',
	// ),
	// 'API_GOOGLE_SECRET' => array(
	// 	'name'    => '谷歌AppSecret',
	// 	'group'   => '登录接口设置',
	// 	'editor'  => 'text',
	// 	'default' => '',
	// ),
	#会员等级设置
	'MEMER_JUNIOR' => array(
		'name'    => '初级会员',
		'group'   => '会员等级设置',
		'editor'  => 'numberbox',
		'default' => '0.90',
	),
	'MEMER_MIDDLE' => array(
		'name'    => '中级会员',
		'group'   => '会员等级设置',
		'editor'  => 'numberbox',
		'default' => '0.80',
	),
	'MEMER_ADVANCED' => array(
		'name'    => '高级会员',
		'group'   => '会员等级设置',
		'editor'  => 'numberbox',
		'default' => '0.70',
	),
	#员工工种设置
	'EMPLOYEE_LEARN' => array(
		'name'    => '助理',
		'group'   => '员工工种设置',
		'editor'  => 'numberbox',
		'default' => '0.90',
	),
	'EMPLOYEE_JUNIOR' => array(
		'name'    => '发型师',
		'group'   => '员工工种设置',
		'editor'  => 'numberbox',
		'default' => '0.90',
	),
	'EMPLOYEE_MIDDLE' => array(
		'name'    => '中级发型师',
		'group'   => '员工工种设置',
		'editor'  => 'numberbox',
		'default' => '0.80',
	),
	'EMPLOYEE_ADVANCED' => array(
		'name'    => '高级发型师',
		'group'   => '员工工种设置',
		'editor'  => 'numberbox',
		'default' => '0.70',
	),
	#项目
	'ITEM_WASH' => array(
		'name'    => '洗',
		'group'   => '美发项目设置',
		'editor'  => 'numberbox',
		'default' => '0.90',
	),
	'ITEM_HAIRDRESSING' => array(
		'name'    => '剪发',
		'group'   => '美发项目设置',
		'editor'  => 'numberbox',
		'default' => '0.90',
	),
	'ITEM_BLOW' => array(
		'name'    => '吹',
		'group'   => '美发项目设置',
		'editor'  => 'numberbox',
		'default' => '0.90',
	),
	'ITEM_STYLIST' => array(
		'name'    => '造型',
		'group'   => '美发项目设置',
		'editor'  => 'numberbox',
		'default' => '0.90',
	),
	'ITEM_PERM' => array(
		'name'    => '烫发',
		'group'   => '美发项目设置',
		'editor'  => 'numberbox',
		'default' => '0.90',
	),
	'ITEM_DYE' => array(
		'name'    => '染发',
		'group'   => '美发项目设置',
		'editor'  => 'numberbox',
		'default' => '0.90',
	),
	#门店
	'STORE_1' => array(
		'name'    => '门店一',
		'group'   => '门店',
		'editor'  => 'numberbox',
		'default' => '1',
	),
	'STORE_2' => array(
		'name'    => '门店二',
		'group'   => '门店',
		'editor'  => 'numberbox',
		'default' => '2',
	),
   #员工级别
   'LEVEL_1' => array(
		'name'    => '级别1',
		'group'   => '员工级别',
		'editor'  => 'text',
		'default' => '22,24',
	),
   'LEVEL_2' => array(
		'name'    => '级别2',
		'group'   => '员工级别',
		'editor'  => 'text',
		'default' => '24,26',
	),
   'LEVEL_3' => array(
		'name'    => '级别3',
		'group'   => '员工级别',
		'editor'  => 'text',
		'default' => '26,28',
	)
);