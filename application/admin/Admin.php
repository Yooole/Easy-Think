<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/27 0027
 * Time: 15:40
 */

namespace app\admin;


use think\Controller;

class Admin extends Controller
{

    public function initialize()
    {
        $whiteList = ['login'];
        if(!in_array($this ->request ->action(), $whiteList)) {
            //验证用户登录权限


        }
    }

}