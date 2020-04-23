package com.travel.service.impl;

import com.github.pagehelper.PageHelper;
import com.travel.dao.RouteDao;
import com.travel.pojo.LeaveWord;
import com.travel.pojo.Route;
import com.travel.service.RouteService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-02-25 13:01 新建
 */
@Service
public class RouteServiceImpl implements RouteService {

    @Resource
    private RouteDao routeDao;

    //查询3条热门路线
    @Override
    public List<Route> findThreeHeat() throws Exception {
        return routeDao.findThreeHeat();
    }

    //查询所有路线
    @Override
    public List<Route> findAll(int page,int size) throws Exception {
        PageHelper.startPage(page,size);
        return routeDao.findAll();
    }

    //按热度查询所有所有热门路线
    @Override
    public List<Route> findAllByHeat(int page, int size) throws Exception {
        PageHelper.startPage(page,size);
        return routeDao.findAllByHeat();
    }

    //按价格查询所有所有热门路线
    @Override
    public List<Route> findAllByPrice(int page, int size) throws Exception {
        PageHelper.startPage(page,size);
        return routeDao.findAllByPrice();
    }

    //按价格查询所有所有热门路线
    @Override
    public List<Route> findAllByTime(int page, int size) throws Exception {
        PageHelper.startPage(page,size);
        return routeDao.findAllByTime();
    }

    //根据路线id查询路线
    @Override
    public Route findRouteById(Integer id) throws Exception {
        return routeDao.findRouteById(id);
    }

    //根据id查询路线的留言
    @Override
    public List<LeaveWord> findLeaveWordById(Integer id, int page, int size) throws Exception {
        PageHelper.startPage(page,size);
        return routeDao.findLeaveWordById(id);
    }

    //修改路线信息
    @Override
    public int updateRoute(Route route) throws Exception {
        return routeDao.updateRoute(route);
    }

    //查看路线编号是否已被使用
    @Override
    public int findRNumIsUsed(Integer rId, String rNum) throws Exception {
        return routeDao.findRNumIsUsed(rId,rNum);
    }

    //查看路线名是否已被使用
    @Override
    public int findRNameIsUsed(Integer rId, String rName) throws Exception {
        return routeDao.findRNameIsUsed(rId,rName);
    }

    //根据传过来的路线编号和路线名进行模糊查询
    @Override
    public List<Route> fuzzyQuery(String routeNum, String routeName) throws Exception {
        return routeDao.fuzzyQuery(routeNum,routeName);
    }

    //添加新路线时查看路线编号是否已被使用过
    @Override
    public int findNewRouteNumIsUsed(String newRouteNum) throws Exception {
        return routeDao.findNewRouteNumIsUsed(newRouteNum);
    }

    //添加新路线时查看路线名是否已被使用过
    @Override
    public int findNewRouteNameIsUsed(String newRouteName) throws Exception {
        return routeDao.findNewRouteNameIsUsed(newRouteName);
    }

    //执行添加新路线操作
    @Override
    public int addRoute(Route route) throws Exception {
        return routeDao.addRoute(route);
    }

    //根据id删除路线
    @Override
    public int deleteRoute(Integer routeId) throws Exception {
        return routeDao.deleteRoute(routeId);
    }

    //路线详情页添加图片
    @Override
    public int uploadImg(String sqlFilename,Integer routeId) throws Exception {
        return routeDao.uploadImg(sqlFilename,routeId);
    }

}
