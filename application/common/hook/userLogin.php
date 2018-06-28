<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/27 0027
 * Time: 15:54
 */

namespace app\common\hook;


class userLogin
{
    /**
     * 用户登录成功后钩子
     * @param $params
     */
    public function run($params)
    {
        //可以在这边增加积分
        //每日登录初始化工作
        //其他任务...
    }

}