package com.hut.travel.dao;

import com.hut.travel.pojo.*;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-02-22 20:17 新建
 */
@Mapper
public interface UserDoDao {

    //用户完善个人信息
    @Update("update user set gender=#{gender},intro=#{intro},website=#{website} where id=#{id}")
    public abstract int perfect(@Param("id") int id, @Param("gender") int gender,@Param("intro") String intro,@Param("website") String website) throws Exception;

    //用户修改个人密码
    @Update("update user set password=#{newpwd} where id = #{userId}")
    public abstract int updatePassword(@Param("userId") int userId,@Param("newpwd") String newpwd) throws Exception;

    //用户添加订单
    @Insert("INSERT INTO travel.orders (orderNum,routeId,userId,orderTime,reserveTime,adult,child,totalPrice)" +
            "VALUES(#{orderNum},#{routeId},#{userId},#{orderTime},#{reserveTime},#{adult},#{child},#{totalPrice})")
    public abstract int addOrder(Orders order) throws Exception;

    //用户查询个人所有订单
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
            @Result(property = "userInfo",column = "userId",javaType = UserInfo.class,one = @One(select = "com.hut.travel.dao.UserInfoDao.findByUserId")),
            @Result(property = "route",column = "routeId",javaType = Route.class,one = @One(select = "com.hut.travel.dao.RouteDao.findRouteById"))
    })
    public abstract List<Orders> findOrdersById(Integer userId) throws Exception;

    //用户留言
    @Insert("insert into leaveword(routeId,userId,txt,createTime) values(#{routeId},#{userId},#{txt},#{createTime})")
    public abstract int leaveWord(LeaveWord leaveWord) throws Exception;

    //用户修改头像
    @Update("update user set url=#{sqlFilename} where id=#{userId}")
    public abstract int updateHeaderImg(@Param("userId") Integer userId,@Param("sqlFilename") String sqlFilename) throws Exception;

    //用户订酒店
    @Insert("insert into bookhotel(num,userId,hotelId,liveTime,leaveTime,peopleCount,price,createTime) values(#{num},#{userId},#{hotelId},#{liveTime},#{leaveTime},#{peopleCount},#{price},#{createTime})")
    public abstract int bookHotel(BookHotel bookHotel) throws Exception;

    //用户查询酒店订单
    @Select("select * from bookhotel where userId=#{userId} order by createTime desc")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "num",column = "num"),
            @Result(property = "userId",column = "userId"),
            @Result(property = "hotelId",column = "hotelId"),
            @Result(property = "liveTime",column = "liveTime"),
            @Result(property = "leaveTime",column = "leaveTime"),
            @Result(property = "peopleCount",column = "peopleCount"),
            @Result(property = "price",column = "price"),
            @Result(property = "status",column = "status"),
            @Result(property = "payType",column = "payType"),
            @Result(property = "createTime",column = "createTime"),
            @Result(property = "userInfo",column = "userId",javaType = UserInfo.class,one = @One(select = "com.hut.travel.dao.UserInfoDao.findByUserId")),
            @Result(property = "hotel",column = "hotelId",javaType = Hotel.class,one = @One(select = "com.hut.travel.dao.HotelDao.findByHotelId"))
    })
    public abstract List<BookHotel> bookHotels(Integer userId) throws Exception;

    //用户下自由行订单
    @Insert("INSERT INTO travel.orders (orderNum,routeId,userId,orderTime,reserveTime,adult,child,totalPrice)" +
            "VALUES(#{orderNum},#{routeId},#{userId},#{orderTime},#{reserveTime},#{adult},#{child},#{totalPrice})")
    @Options(useGeneratedKeys = true,keyProperty = "id",keyColumn = "id")
    public abstract int addFreeWalkOrder(Orders order) throws Exception;
}
