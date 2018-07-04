<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/27 0027
 * Time: 15:39
 */

namespace app\admin\controller;


use app\admin\Admin;
use app\common\service\AuthService;
use app\common\utils\EasyAuth;
use app\common\utils\EasyResult;
use app\common\utils\EasyValidate;
use think\facade\Hook;
use think\Request;

class UserController extends Admin
{

    /** @var $authService AuthService*/
    private $authService;

    public function initialize()
    {
        parent::initialize();
        $this ->authService = app(AuthService::class);
    }

    /**
     * 用户登录接口
     * @param string $username 登录账号
     * @param string $password 登录密码
     * @param string $code
     * @return EasyResult
     */
    public function loginByUserName($username, $password, $code)
    {
        //字段验证
        $rules = ['username' =>'require', 'password' =>'require|min:6'];
        $message = ['username.require' =>'登录账号不能为空', 'password.require' =>'密码不能为空', 'password.min' =>'登录密码最少6位数'];
        EasyValidate::make($this ->request ->param(), $rules, $message)->send();

        //验证码验证
        if(!captcha_check($code)) return EasyResult::error('验证码错误');

        //执行登录操作
        $member = $this ->authService ->usernameLogin($username, $password);
        Hook::listen('user_login_success');
        return EasyResult::success('登录成功') ->put('token', $member['login_token']);
    }

    public function loginByToken($token)
    {
        EasyValidate::make($this ->request ->param()) ->rule('token', 'require') ->send();
        return $this ->authService ->tokenLogin($token);
    }

    /**
     * 安全退出
     * @return EasyResult
     */
    public function logout()
    {
        $this ->authService ->logout();
        return EasyResult::success('已安全退出');
    }
}