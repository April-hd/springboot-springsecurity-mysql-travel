package com.travel.service;

import com.travel.pojo.Scenery;
import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-01-30 19:51 新建
 */
public interface SceneryService {

    //根据目的地id查询该目的地所有景点
    public abstract List<Scenery> findSceneriesByDestId(Integer destId) throws Exception;

    //查询所有风景店
    public List<Scenery> findAllScenery(Integer page, Integer size) throws Exception;

    //修改景点信息
    public abstract int updateScenery(Scenery scenery) throws Exception;

    //修改景点信息时查看景点名是否已被使用
    public abstract int findSceNameIsUsed(Integer sceId, String sceName) throws Exception;

    //根据传过来的风景名进行模糊查询
    public abstract List<Scenery> fuzzyQuery(String sName) throws Exception;

    //添加新景点时判断新名字是否被使用过
    public abstract int findNewSceNameIsUsed(String newSceName) throws Exception;

    //执行添加景点操作
    public abstract int addScenery(Scenery scenery) throws Exception;

    //根据id删除景点
    public abstract int deleteScenery(Integer sceneryId) throws Exception;

    //旅游首页查询所有景点
    public abstract List<Scenery> findAll() throws Exception;
}
