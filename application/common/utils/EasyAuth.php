<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/28 0028
 * Time: 20:58
 */

namespace app\common\utils;


class EasyAuth
{
    private static $authSessionKey = 'easy_auth_login_session';

    /**
     * 保存用户登录信息
     * @return int
     */
    public static function addAuth()
    {
        $data['login_time'] = time();
        $data['login_expire'] = 7 * 3600;
        $data['login_ip'] = request() ->ip(true);
        $data['login_agent'] = request() ->header('user-agent');
        $data['login_token'] = self::signAuth($data);
        session(self::$authSessionKey, $data);
    }

    /**
     * 删除用户登录信息
     * @return mixed
     */
    public static function removeAuth()
    {
        return session(self::$authSessionKey, null);
    }

    public static function checkAuth()
    {

    }

    public static function signAuth($data)
    {

    }


    /**
     * 生成密码
     * @param $password
     * @return bool|string
     */
    public static function passwordEncrypt($password)
    {
        return password_hash($password, PASSWORD_DEFAULT);
    }

    /**
     * 验证密码
     * @param $password
     * @param $passwordEncrypt
     * @return bool
     */
    public static function passwordVerify($password, $passwordEncrypt)
    {
        return password_verify($password, $passwordEncrypt);
    }
}