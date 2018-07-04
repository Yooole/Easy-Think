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
     * @param array $data
     * @param int $expire
     * @return int
     */
    public static function addAuth(array $data, $expire = 7 * 3600)
    {
        $data['login_expire'] = time() + $expire;
        $data['login_agent'] = request() ->header('user-agent');
        return session(self::$authSessionKey, $data);
    }

    /**
     * 校验用户登录信息
     * @param  boolean $agent_verify 是否校验TOKEN
     * @return boolean
     */
    public static function checkAuth($agent_verify = true)
    {
        $data = session(self::$authSessionKey);
        if(!$data || time() >= $data['login_expire']) return false;
        if($agent_verify && $data['login_agent'] != request() ->header('user-agent')) return false;
        return true;
    }

    /**
     * 删除用户登录信息
     * @return mixed
     */
    public static function removeAuth()
    {
        return session(self::$authSessionKey, null);
    }

    /**
     * 生成用户TOKEN
     * @param array $data 参与加密的数据
     * @param string $key 加密KEY
     * @return string
     */
    public static function authToken(array $data, $key = '')
    {
        $signInfo['uid'] = $data['uid'] ?? '';
        $signInfo['login_ip'] = $data['login_ip'] ?? '';
        $signInfo['login_time'] = $data['login_time'] ?? '';
        return sha1(http_build_query($signInfo) . $key);
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