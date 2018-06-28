<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/27 0027
 * Time: 15:59
 */

namespace app\common;


use app\common\hook\userLoginEvent;
use think\facade\Hook;

class HookInit
{
    public function run()
    {
        Hook::add('user_login_success', userLoginEvent::class);
    }
}