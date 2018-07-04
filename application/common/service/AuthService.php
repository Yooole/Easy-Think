<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/7/4 0004
 * Time: 17:17
 */

namespace app\common\service;


use app\common\utils\EasyAuth;
use app\common\utils\EasyResult;

class AuthService
{
    /** @var $memberService MemberService */
    private $memberService;
    private $userNameLoginErrorMessage = '登录账号或密码错误';

    public function __construct()
    {
        $this ->memberService = app(MemberService::class);
    }

    /**
     * 用户名登录
     * @param $username
     * @param $password
     * @return array
     */
    public function usernameLogin($username, $password)
    {
        $member = $this ->memberService ->getMemberByUsername($username);
        if(!$member || !EasyAuth::passwordVerify($password, $member['password'])) {
            EasyResult::error($this ->userNameLoginErrorMessage) ->send();
        }
        $member ->login_time = time();
        $member ->login_count = ['inc', 1];
        $member ->login_ip = request() ->ip(true);
        $member ->login_token = EasyAuth::authToken($member ->toArray());
        $member ->isUpdate(true) ->save();
        EasyAuth::addAuth($member ->toArray());
        return $member ->hidden(['password', 'create_time', 'update_time', 'status']) ->toArray();
    }

    public function logout()
    {
        EasyAuth::removeAuth();
    }
}