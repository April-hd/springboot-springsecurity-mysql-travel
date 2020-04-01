package com.hut.travel.dao;

import com.hut.travel.pojo.Orders;
import com.hut.travel.pojo.Route;
import com.hut.travel.pojo.UserInfo;
import org.apache.ibatis.annotations.*;


import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-10 10:40 新建
 */
@Mapper
public interface OrderDao {

    //查询所有订单
    @Select("select * from orders")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "orderNum",column = "orderNum"),
            @Result(property = "routeId",column = "routeId"),
            @Result(property = "userId",column = "userId"),
            @Result(property = "orderTime",column = "orderTime"),
            @Result(property = "reserveTime",column = "reserveTime"),
            @Result(property = "adult",column = "adult"),
            @Result(property = "child",column = "child"),
            @Result(property = "totalPrice",column = "totalPrice"),
            @Result(property = "orderStatus",column = "orderStatus"),
            @Result(property = "payType",column = "payType"),
            @Result(property = "route",column = "routeId",javaType = Route.class,one = @One(select = "com.hut.travel.dao.RouteDao.findRouteById")),
            @Result(property = "userInfo",column = "userId",javaType = UserInfo.class,one = @One(select = "com.hut.travel.dao.UserInfoDao.findByUserId"))
    })
    public abstract List<Orders> findAll() throws Exception;

    //根据用户id查询用户所有订单
    @Select("select * from orders where userId=#{userId} ORDER BY orderTime desc")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "orderNum",column = "orderNum"),
            @Result(property = "routeId",column = "routeId"),
            @Result(property = "userId",column = "userId"),
            @Result(property = "orderTime",column = "orderTime"),
            @Result(property = "reserveTime",column = "reserveTime"),
            @Result(property = "adult",column = "adult"),
            @Result(property = "child",column = "child"),
            @Result(property = "totalPrice",column = "totalPrice"),
            @Result(property = "orderStatus",column = "orderStatus"),
            @Result(property = "payType",column = "payType"),
            @Result(property = "route",column = "routeId",javaType = Route.class,one = @One(select = "com.hut.travel.dao.RouteDao.findRouteById"))
    })
    public abstract List<Orders> findOrdersByUserId(Integer userId) throws Exception;

    //根据传过来的订单编号来进行模糊查询
    @Select("select * from orders where orderNum like concat(concat('%',#{orderNum},'%'))")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "orderNum",column = "orderNum"),
            @Result(property = "routeId",column = "routeId"),
            @Result(property = "userId",column = "userId"),
            @Result(property = "orderTime",column = "orderTime"),
            @Result(property = "reserveTime",column = "reserveTime"),
            @Result(property = "adult",column = "adult"),
            @Result(property = "child",column = "child"),
            @Result(property = "totalPrice",column = "totalPrice"),
            @Result(property = "orderStatus",column = "orderStatus"),
            @Result(property = "payType",column = "payType"),
            @Result(property = "route",column = "routeId",javaType = Route.class,one = @One(select = "com.hut.travel.dao.RouteDao.findRouteById")),
            @Result(property = "userInfo",column = "userId",javaType = UserInfo.class,one = @One(select = "com.hut.travel.dao.UserInfoDao.findByUserId"))
    })
    public abstract List<Orders> fuzzyQuery(String orderNum) throws Exception;

    //查询刚刚创建的订单
    @Select("select * from orders where id=#{id}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "orderNum",column = "orderNum"),
            @Result(property = "routeId",column = "routeId"),
            @Result(property = "userId",column = "userId"),
            @Result(property = "orderTime",column = "orderTime"),
            @Result(property = "reserveTime",column = "reserveTime"),
            @Result(property = "adult",column = "adult"),
            @Result(property = "child",column = "child"),
            @Result(property = "totalPrice",column = "totalPrice"),
            @Result(property = "orderStatus",column = "orderStatus"),
            @Result(property = "payType",column = "payType"),
            @Result(property = "route",column = "routeId",javaType = Route.class,one = @One(select = "com.hut.travel.dao.RouteDao.findRouteById")),
            @Result(property = "userInfo",column = "userId",javaType = UserInfo.class,one = @One(select = "com.hut.travel.dao.UserInfoDao.findByUserId"))
    })
    public abstract Orders findOrderById(Integer id) throws Exception;
}
