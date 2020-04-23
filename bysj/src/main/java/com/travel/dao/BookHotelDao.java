package com.travel.dao;

import com.travel.pojo.BookHotel;
import com.travel.pojo.Hotel;
import com.travel.pojo.UserInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-26 17:42 新建
 */
@Mapper
public interface BookHotelDao {

    //后台查询所有酒店订单
    @Select("select * from bookhotel")
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
            @Result(property = "userInfo",column = "userId",javaType = UserInfo.class,one = @One(select = "com.travel.dao.UserInfoDao.findByUserId")),
            @Result(property = "hotel",column = "hotelId",javaType = Hotel.class,one = @One(select = "com.travel.dao.HotelDao.findByHotelId"))
    })
    public abstract List<BookHotel> findAllBookHotel() throws Exception;

    //根据订单编号查询订单
    @Select("select * from bookhotel where num like concat(concat('%',#{bookHotelNum},'%')) ")
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
            @Result(property = "userInfo",column = "userId",javaType = UserInfo.class,one = @One(select = "com.travel.dao.UserInfoDao.findByUserId")),
            @Result(property = "hotel",column = "hotelId",javaType = Hotel.class,one = @One(select = "com.travel.dao.HotelDao.findByHotelId"))
    })
    public abstract List<BookHotel> fuzzyQuery(String bookHotelNum) throws Exception;
}
