package com.travel.service;

import com.travel.pojo.LeaveWord;
import com.travel.pojo.Route;

import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-02-25 13:00 新建
 */
public interface RouteService {

    //查询3条最热门路线
    public abstract List<Route> findThreeHeat() throws Exception;

    //查询所有路线
    public abstract List<Route> findAll(int page, int size) throws Exception;

    //按热度查询所有所有热门路线
    public abstract List<Route> findAllByHeat(int page, int size) throws Exception;

    //按价格查询所有所有热门路线
    public abstract List<Route> findAllByPrice(int page, int size) throws Exception;

    //按天数查询所有所有热门路线
    public abstract List<Route> findAllByTime(int page, int size) throws Exception;

    //根据路线id查询路线
    public abstract Route findRouteById(Integer id) throws Exception;

    //根据id查询路线的留言
    public abstract List<LeaveWord> findLeaveWordById(Integer id, int page, int size) throws Exception;

    //修改路线信息
    public abstract int updateRoute(Route route) throws Exception;

    //查看路线编号是否已被使用
    public abstract int findRNumIsUsed(Integer rId, String rNum) throws Exception;

    //查看路线名是否已被使用
    public abstract int findRNameIsUsed(Integer rId, String rName) throws Exception;

    //根据传过来的路线编号和路线名进行模糊查询
    public abstract List<Route> fuzzyQuery(String routeNum, String routeName) throws Exception;

    //添加新路线时查看路线编号是否已被使用过
    public abstract int findNewRouteNumIsUsed(String newRouteNum) throws Exception;

    //添加新路线时查看路线名是否已被使用过
    public abstract int findNewRouteNameIsUsed(String newRouteName) throws Exception;

    //执行添加新路线操作
    public abstract int addRoute(Route route) throws Exception;

    //根据id删除路线
    public abstract int deleteRoute(Integer routeId) throws Exception;

    //路线详情页添加图片
    public abstract int uploadImg(String sqlFilename, Integer routeId) throws Exception;
}
