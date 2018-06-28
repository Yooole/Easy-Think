<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/27 0027
 * Time: 16:16
 */

namespace app\common;


use think\exception\HttpResponseException;
use think\facade\Response;

class Result
{
    public $success;
    public $code;
    public $msg;
    public $data = [];

    /**
     * 成功响应
     * @param string $msg
     * @param int $code
     * @return static
     */
    public static function success($msg = '', $code = 3000)
    {
        $static = new static();
        $static ->success = true;
        $static ->code = $code;
        $static ->msg = $msg;
        return $static;
    }

    /**
     * 失败响应
     * @param string $msg
     * @param int $code
     * @return static
     */
    public static function error($msg = '', $code = 4000)
    {
        $static = new static();
        $static ->success = false;
        $static ->code = $code;
        $static ->msg = $msg;
        return $static;
    }

    /**
     * 响应数据
     * @param array $data
     * @param int $code
     * @return static
     */
    public static function data($data = [], $code = 3000)
    {
        $static = new static();
        $static ->success = true;
        $static ->code = $code;
        $static ->data = $data;
        return $static;
    }

    /**
     * 动态插入数据
     * @param $key
     * @param $value
     * @return $this
     */
    public function put($key, $value)
    {
        $this ->$key = $value;
        return $this;
    }

    /**
     * 抛出响应
     * @param $header
     */
    public function send($header = [])
    {
        $result = Response::create($this, 'json') ->header($header);
        throw new HttpResponseException($result);
    }
}