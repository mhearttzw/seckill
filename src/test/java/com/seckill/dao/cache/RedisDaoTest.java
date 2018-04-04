package com.seckill.dao.cache;

import com.seckill.dao.SeckillDao;
import com.seckill.entity.Seckill;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring配置文件
@ContextConfiguration({"classpath:spring/spring-dao.xml"})
public class RedisDaoTest {

    private long id = 1000;

    @Autowired
    private RedisDao redisDao;

    @Autowired
    private SeckillDao seckillDao;

    @Test
    public void testSeckill() {
        //get and put
        Seckill seckill = redisDao.getSekill(id);
        if (seckill == null) {
            seckill = seckillDao.queryById(id);
            if (seckill != null) {
                String result = redisDao.putSeckill(seckill);
                System.out.println("result: " + result);
                seckill = redisDao.getSekill(id);
                System.out.println("seckill: " + seckill);
            }
        }
    }

    @Test
    public void getSekill() {
    }

    @Test
    public void putSeckill() {
    }
}