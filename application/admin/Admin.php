<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/27 0027
 * Time: 15:40
 */

namespace app\admin;


use app\common\service\AuthService;
use app\common\utils\EasyAuth;
use app\common\utils\EasyResult;
use think\Controller;

class Admin extends Controller
{
    /** @var $AuthService AuthService */
    private $AuthService;

    public function initialize()
    {
        $whiteList = ['login', 'logout'];
        if(!in_array($this ->request ->action(), $whiteList)) {
            if(!EasyAuth::isLogin()) {
                EasyResult::error('请求超时，请重新登录', 4009) ->send();
            }
        }

        //设置用户自动登录，防止Session过期
        $this ->AuthService = app(AuthService::class);
        $this ->AuthService ->automaticLogin();
    }

}