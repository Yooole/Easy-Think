<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/28 0028
 * Time: 20:38
 */

namespace app\common\model;


use think\Model;

class UserMember extends Model
{
    protected $table = 'easy_user_member';
    protected $autoWriteTimestamp = true;

    public $uid; //用户ID
    public $username; //登录账号
    public $password; //登录密码
    public $login_time; //登录时间
    public $login_ip; //登录IP
    public $login_count; //登录次数
    public $login_token; //登录TOKEN
    public $create_time; //创建时间
    public $update_time; //更新时间
    public $status; //状态
}