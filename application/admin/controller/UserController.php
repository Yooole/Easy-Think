<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/27 0027
 * Time: 15:39
 */

namespace app\admin\controller;


use app\admin\Admin;
use app\common\Result;
use app\common\service\UserService;
use think\facade\Hook;
use think\facade\Validate;
use think\validate\ValidateRule;

class UserController extends Admin
{

    /** @var $userService UserService */
    private $userService;

    public function initialize()
    {
        parent::initialize();
        $this ->userService = app(UserService::class);
    }

    /**
     * 用户登录接口
     * @param $username
     * @param $password
     * @param $captcha
     */
    public function login($username, $password, $captcha)
    {
        $result = Validate::make() ->rule('username',ValidateRule::must()->isEmail()->title('邮箱')) ->check($this ->request ->param());
        halt($result);

        Hook::listen('user_login_success');
        Result::success('登录成功') ->send();
    }

    public function logout()
    {

    }
}