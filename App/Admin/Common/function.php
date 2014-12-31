<?php
/**
 * 获取数据字典
 * @param $key      //键值，方便查找数据
 * @param $fileName //字典文件名 目录Common/Dict/
 * @return mixed
 */
function dict($key = '', $fileName = 'Setting') {
    static $_dictFileCache  =   array();
    $file = MODULE_PATH . 'Common' . DS . 'Dict' . DS . $fileName . '.php';
    if (!file_exists($file)){
    	unset($_dictFileCache);
    	return null;
    }
    if(!$key && !empty($_dictFileCache)) return $_dictFileCache;
    if ($key && isset($_dictFileCache[$key])) return $_dictFileCache[$key];
    $data = require_once $file;
    $_dictFileCache = $data;
	return $key ? $data[$key] : $data;
}
/**
 * 获取字典相似属性列表
 * @param  string $key      [属性]
 * @param  string $fileName [字典文件名 目录Common/Dict/]
 * @return [mixed]          
 */
function dict_attr($key = '', $fileName = 'Setting') {
    static $_dictFileCache  =   array();
    $file = MODULE_PATH . 'Common' . DS . 'Dict' . DS . $fileName . '.php';
    if (!file_exists($file)){
        unset($_dictFileCache);
        return null;
    }
    if(!$key && !empty($_dictFileCache)) return $_dictFileCache;
    if ($key && isset($_dictFileCache[$key])) return $_dictFileCache[$key];
    $data = require $file;
    // trace("/^".$key."_/","test");
    $data =array_intersect_key($data, array_flip(preg_grep("/^".$key."_/", array_keys($data))));
    return $data;
    // $_dictFileCache = $data;
    // return $key ? $data[$key] : $data;
}

/**
 * 查询门店信息
 */
function findEmp($id)
{
    # code...
    trace($id,"EMPID");
    $empInfo = D('Employee')->find($id);
    trace($empInfo,"EMPNAME");
    return $empInfo['name'];
    // return '';
}