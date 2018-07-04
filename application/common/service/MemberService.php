<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/27 0027
 * Time: 17:29
 */

namespace app\common\service;


use app\common\CacheKeys;
use app\common\model\UserMember;
use think\Cache;


class MemberService
{

    /**
     * 根据用户ID获取用户信息
     * @param $uid
     * @return mixed
     */
    public function getMemberByUserId($uid)
    {
        $cacheKey = CacheKeys::$MemberInfoByUserId . $uid;
        return Cache::remember($cacheKey, function() use($uid){
            return UserMember::where('uid', $uid) ->find();
        });
    }

    /**
     * 根据用户名获取用户信息
     * @param $username
     * @return UserMember
     */
    public function getMemberByUsername($username)
    {
        $cacheKey = CacheKeys::$MemberInfoByUserName . $username;
        return Cache::remember($cacheKey, function() use($username){
            return UserMember::where('username', $username) ->find();
        });
    }

    /**
     * 根据Token获取用户信息
     * @param $token
     * @return mixed
     */
    public function getMemberByToken($token)
    {
        $cacheKey = CacheKeys::$MemberInfoByToken . $token;
        return Cache::remember($cacheKey, function() use($token){
            return UserMember::where('login_token', $token) ->find();
        });
    }

    /**
     * 检验用户名
     * @param $username
     * @return bool
     */
    public function checkUserName($username)
    {
        return $this ->getMemberByUsername($username) ? true : false;
    }

    /**
     * 更新用户
     * @param $data
     * @param $uid
     * @return bool
     */
    public function updateMember($data, $uid)
    {
        return UserMember::where('uid', $uid) ->isUpdate(true) ->save($data);
    }

    /**
     * 清理用户缓存
     * @param $uid
     * @return bool
     */
    public function clearMemberCache($uid)
    {
        $memberInfo = $this ->getMemberByUserId($uid);
        Cache::rm(CacheKeys::$MemberInfoByUserId . $memberInfo['uid']);
        Cache::rm(CacheKeys::$MemberInfoByUserName . $memberInfo['username']);
        return true;
    }

}