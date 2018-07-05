<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/27 0027
 * Time: 15:48
 */

namespace app\common;



class AppInit
{
    public static function run()
    {
        error_reporting(E_ERROR | E_PARSE );
        header('Access-Control-Allow-Origin: http://www.7imm.com:8080');
        header('Access-Control-Allow-Credentials', true);
        header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, Access-Token");
        header('Access-Control-Allow-Methods: PUT, POST, GET, DELETE, OPTIONS');
    }
}