<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/27 0027
 * Time: 17:29
 */

namespace app\common\service;


use app\common\model\UserMember;
use app\common\utils\EasyAuth;
use app\common\utils\EasyResult;


class UserService
{
    private $userNameLoginErrorMessage = '登录账号或密码错误';

    /**
     * 用户名登录
     * @param $username
     * @param $password
     * @return int
     */
    public function usernameLogin($username, $password)
    {
        $userMember = UserMember::where('username', $username) ->find();
        if(!$userMember || !EasyAuth::passwordVerify($password, $userMember['password'])) {
            EasyResult::error($this ->userNameLoginErrorMessage) ->send();
        }

        $loginToken = EasyAuth::addAuth();



        $update['login_ip'] = request() ->ip(true);
        $update['login_time'] = time();
        $update['login_token'] = $loginToken;
        UserMember::update($update, ['uid' =>$userMember['uid']]);
        $userMember ->visible(['uid', 'username', 'create_time', 'update_time', 'status']);
        return $loginToken;
    }

    public function usernameRegister($username, $password)
    {

    }

    public function checkUserName($username)
    {

    }

    public function getUserMemberByUsername($username)
    {

    }

    public function TokenLogin($token)
    {
        //这边
    }

    public function logout()
    {

    }

}