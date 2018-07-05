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
     * 验证用户是否登录
     * @param bool $verify_agent 是否需要验证用户的请求头
     * @return bool
     */
    public static function isLogin($verify_agent = true)
    {
        $data = session(self::$authSessionKey);
        if(!$data || time() >= $data['expire_time']) return false;
        if($verify_agent && request() ->header('user-agent') != $data['user_agent']) return false;
        return true;
    }

    /**
     * 获取当前登录用户信息
     * @return array
     */
    public static function getAuthInfo()
    {
        $data = session(self::$authSessionKey);
        return array_diff_key($data, ['expire_time', 'user_agent']);
    }

    /**
     * 用户登录
     * @param array $data 保存的信息
     * @param int $expire 有效期 默认一个小时
     * @return string
     */
    public static function authLogin(array $data, $expire = 24 * 3600)
    {
        $data['expire_time'] = time() + $expire;
        $data['user_agent'] = request() ->header('user-agent');
        $data['user_token'] = self::sign($data);
        session(self::$authSessionKey, $data);
        return $data['user_token'];
    }

    /**
     * 用户退出
     * @return mixed
     */
    public static function authLogout()
    {
        return session(self::$authSessionKey, NULL);
    }

    /**
     * 用户签名
     * @param array $data 需要生成签名的数据
     * @param string $key 加密字符串
     * @return string
     */
    public static function sign(array $data, $key = '')
    {
        ksort($data);
        return sha1(implode('|', $data) . $key);
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