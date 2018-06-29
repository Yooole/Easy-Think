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
     * @return int
     */
    public static function addAuth(array $data)
    {
        $data['login_expire'] = 7 * 3600;
        $data['login_agent'] = request() ->header('user-agent');
        return session(self::$authSessionKey, $data);
    }

    /**
     * 校验用户登录信息
     * @param  boolean $agent_verify 是否校验TOKEN
     * @return array|false
     */
    public function checkAuth($agent_verify = true)
    {
        $data = session(self::$authSessionKey);
        $userAgent = request() ->header('user-agent');
        if(!$agent_verify || $data['login_agent'] == $userAgent) {
            $expireData = $data['login_expire'];
            if($data['login_time'] + $expireData > time()) {
                return $data;
            }
        }
        return false;
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
        ksort($data);
        $code = http_build_query($data);
        $token = sha1($code . $key);
        return sha1($token . $key);
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