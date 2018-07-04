<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/28 0028
 * Time: 20:38
 */

namespace app\common\model;


use app\common\service\MemberService;
use think\Model;

/**
 * Class UserMember
 * @package app\common\model
 */
class UserMember extends Model
{
    protected $pk = 'uid';
    protected $table = 'easy_user_member';
    protected $autoWriteTimestamp = true;

    public static function init()
    {
        self::event('after_update', function ($member) {
            $service = new MemberService();
            $service ->clearMemberCache($member ->uid);
        });
    }
}