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
        header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
        header('Access-Control-Allow-Methods: GET ,POST');
    }
}