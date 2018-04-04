package com.seckill.service;


import com.seckill.dto.Exposer;
import com.seckill.dto.SeckillExecution;
import com.seckill.entity.Seckill;
import com.seckill.exception.RepeatKillException;
import com.seckill.exception.SeckillCloseException;
import com.seckill.exception.SeckillException;

import java.util.List;

/**
 * @author          echelon
 * @email           2954632969@qq.com
 * @created_time    2018/3/23 12:05
 * 三个方法：方法定义粒度、参数、返回类型（return 类型/异常）
 */
public interface SeckillService {

    /* 查询所有秒杀记录 */
    List<Seckill> getSeckillList();

    /* 查询单个秒杀记录 */
    Seckill getById(long seckillId);

    /* 秒杀开启则输出秒杀接口地址 ，
    *  否则输出系统时间和秒杀时间
    *  */
    Exposer exportSeckillUrl(long seckillId);

    /**
     * 执行秒杀操作
     */
    SeckillExecution executeSeckill(long seckillId, long userPhone, String md5) throws SeckillCloseException, RepeatKillException, SeckillException;

}
