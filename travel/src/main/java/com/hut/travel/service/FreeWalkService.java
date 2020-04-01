package com.hut.travel.service;

import com.hut.travel.pojo.Route;

import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-29 12:43 新建
 */
public interface FreeWalkService {

    //模糊查询用户填写的数据
    public abstract List<Route> fuzzyQuery(String month,Integer minPrice,Integer maxPrice,Integer minDay,Integer maxDay,String dest) throws Exception;

}
