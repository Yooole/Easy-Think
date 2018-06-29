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

        //更新用户登录信息
        $data['login_time'] = time();
        $data['login_ip'] = request() ->ip(true);
        $data['login_agent'] = request() ->header('user-agent');
        $data['login_token'] = EasyAuth::authToken($data);
        $data['login_count'] = ['exp' =>'login_count + 1'];
        $userMember = UserMember::update($data, ['uid' =>$userMember['uid']], true);

        //保存用户登录状态
        $userMember ->hidden(['password', 'create_time', 'update_time']);
        EasyAuth::addAuth($userMember ->toArray());
        return $data['login_token'];
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