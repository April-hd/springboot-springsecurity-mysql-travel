package com.travel.service.impl;

import com.github.pagehelper.PageHelper;
import com.travel.dao.DestinationDao;
import com.travel.pojo.Destination;
import com.travel.service.DestinationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-02-01 12:51 新建
 */
@Service
public class DestinationServiceImpl implements DestinationService {

    @Resource
    private DestinationDao destinationDao;

    //查找热门目的地前六个
    @Override
    public List<Destination> findSixDestination() throws Exception {
        return destinationDao.findSixDestination();
    }

    //查找所有热门目的地
    @Override
    public List<Destination> findAllDestination(Integer page,Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return destinationDao.findAllDestination();
    }

    //修改目的地信息
    @Override
    public int updateDestination(Destination destination) throws Exception {
        return destinationDao.updateDestination(destination);
    }

    //修改信息时查询目的地名是否已被使用
    @Override
    public int findDesNameIsUsed(Integer desId, String desName) throws Exception {
        return destinationDao.findDesNameIsUsed(desId,desName);
    }

    //根据传过来的目的地名进行模糊查询
    @Override
    public List<Destination> fuzzyQuery(String desName) throws Exception {
        return destinationDao.fuzzyQuery(desName);
    }

    //添加新目的地时判断新名字是否被使用过
    @Override
    public int findNewDesNameIsUsed(String newDesName) throws Exception {
        return destinationDao.findNewDesNameIsUsed(newDesName);
    }

    //执行添加目的地操作
    @Override
    public int addDestination(Destination destination) throws Exception {
        return destinationDao.addDestination(destination);
    }

    //根据id删除目的地
    @Override
    public int deleteDestination(Integer desId) throws Exception {
        return destinationDao.deleteDestination(desId);
    }

    //旅游网站首页查找所有热门目的地
    @Override
    public List<Destination> findAll() throws Exception {
        return destinationDao.findAll();
    }

    //根据目的地名查询目的地
    @Override
    public Destination findByDestName(String destName) throws Exception {
        return destinationDao.findByDestName(destName);
    }

}
