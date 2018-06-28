<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/28 0028
 * Time: 10:28
 */

namespace app\common\utils;


use think\Validate;

class EasyValidate
{

    /** @var $validate \think\Validate */
    private $validate;

    /** @var array 需要验证的数据 */
    private $data = [];

    /**
     * 创建验证器
     * @param array $data
     * @param array $rules
     * @param array $message
     * @return static
     */
    public static function make($data = [], $rules = [], $message = [])
    {
        $validate = new static();
        $validate ->data = $data ?: request() ->param();
        $validate ->validate = app(Validate::class, ['rules' =>$rules, 'message' =>$message], true);
        return $validate;
    }

    /**
     * 单个验证 参考TP规则
     * @param $name
     * @param $rule
     * @param string|array $message
     * @return $this
     */
    public function rule($name, $rule, $message = [])
    {
        if(!is_array($message)) $message = [$name.'.'.$rule =>$message ?: $name . '为空'];
        $this ->validate ->rule($name, $rule) ->message($message);
        return $this;
    }

    /**
     * 多个验证 参考TP规则
     * @param array $rules
     * @param array $message
     * @return $this
     */
    public function rules($rules, $message = [])
    {
        $this ->validate ->rule($rules) ->message($message);
        return $this;
    }

    /**
     * 验证结果
     * @return bool
     */
    public function check()
    {
        return $this ->validate ->check($this ->data);
    }

    /**
     * 获取错误信息
     * @return array
     */
    public function getError()
    {
        $this ->check();
        return $this ->validate ->getError();
    }

    /**
     * 执行验证，错误抛出
     */
    public function send()
    {
        if(!$this ->check()) {
            EasyResult::error($this ->getError()) ->send();
        }
    }
}