package com.hut.travel.service.impl;

import com.github.pagehelper.PageHelper;
import com.hut.travel.dao.SceneryDao;
import com.hut.travel.pojo.Scenery;
import com.hut.travel.service.SceneryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-01-30 19:52 新建
 */
@Service
public class SceneryServiceImpl implements SceneryService {

    @Resource
    private SceneryDao sceneryDao;

    //根据目的地id查询该目的地所有景点
    @Override
    public List<Scenery> findSceneriesByDestId(Integer destId) throws Exception {
        return sceneryDao.findSceneriesByDestId(destId);
    }

    //查询所有风景店
    @Override
    public List<Scenery> findAllScenery(Integer page,Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return sceneryDao.findAllScenery();
    }

    //修改景点信息
    @Override
    public int updateScenery(Scenery scenery) throws Exception {
        return sceneryDao.updateScenery(scenery);
    }

    //查看景点名是否已被使用
    @Override
    public int findSceNameIsUsed(Integer sceId, String sceName) throws Exception {
        return sceneryDao.findSceNameIsUsed(sceId,sceName);
    }

    //根据传过来的风景名进行模糊查询
    @Override
    public List<Scenery> fuzzyQuery(String sName) throws Exception {
        return sceneryDao.fuzzyQuery(sName);
    }

    //添加新景点时判断新名字是否被使用过
    @Override
    public int findNewSceNameIsUsed(String newSceName) throws Exception {
        return sceneryDao.findNewSceNameIsUsed(newSceName);
    }

    //执行添加景点操作
    @Override
    public int addScenery(Scenery scenery) throws Exception {
        return sceneryDao.addScenery(scenery);
    }

    //根据id删除景点
    @Override
    public int deleteScenery(Integer sceneryId) throws Exception {
        return sceneryDao.deleteScenery(sceneryId);
    }

    //旅游首页查询所有景点
    @Override
    public List<Scenery> findAll() throws Exception {
        return sceneryDao.findAll();
    }


}
