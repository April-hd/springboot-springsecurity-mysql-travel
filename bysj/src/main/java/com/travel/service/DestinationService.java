package com.travel.service;

import com.travel.pojo.Destination;

import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-02-01 12:51 新建
 */
public interface DestinationService {

    //查找热门目的地前六个
    public abstract List<Destination> findSixDestination() throws Exception;

    //查询所有热门目的地
    public abstract List<Destination> findAllDestination(Integer page, Integer size) throws Exception;

    //修改目的地信息
    public abstract int updateDestination(Destination destination) throws Exception;

    //修改信息时查询目的地名是否已被使用
    public abstract int findDesNameIsUsed(Integer desId, String desName) throws Exception;

    //根据传过来的目的地名进行模糊查询
    public abstract List<Destination> fuzzyQuery(String desName) throws Exception;

    //添加新目的地时判断新名字是否被使用过
    public abstract int findNewDesNameIsUsed(String newDesName) throws Exception;

    //执行添加新目的地操作
    public abstract int addDestination(Destination destination) throws Exception;

    //根据id删除目的地
    public abstract int deleteDestination(Integer desId) throws Exception;

    //网站首页查找所有热门目的地
    public abstract List<Destination> findAll() throws Exception;

    //根据目的地名查询目的地
    public abstract Destination findByDestName(String destName) throws Exception;
}
