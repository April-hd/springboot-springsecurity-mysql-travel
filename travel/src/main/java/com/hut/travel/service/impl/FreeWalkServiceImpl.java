package com.hut.travel.service.impl;

import com.hut.travel.dao.FreeWalkDao;
import com.hut.travel.pojo.Route;
import com.hut.travel.service.FreeWalkService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-29 12:43 新建
 */
@Service
public class FreeWalkServiceImpl implements FreeWalkService {

    @Resource
    private FreeWalkDao freeWalkDao;

    //模糊查询用户填写的数据
    @Override
    public List<Route> fuzzyQuery(String month,Integer minPrice,Integer maxPrice,Integer minDay,Integer maxDay,String dest) throws Exception {
        return freeWalkDao.fuzzyQuery(month,minPrice,maxPrice,minDay,maxDay,dest);
    }

}
