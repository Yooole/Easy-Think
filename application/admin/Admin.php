<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/27 0027
 * Time: 15:40
 */

namespace app\admin;


use app\common\utils\EasyAuth;
use app\common\utils\EasyResult;
use think\Controller;

class Admin extends Controller
{

    public function initialize()
    {
        $whiteList = ['login'];
        if(!in_array($this ->request ->action(), $whiteList)) {
            if(!EasyAuth::checkAuth()) {
                EasyResult::error('请求超时，请重新登录', 4009) ->send();
            }
        }
    }

}