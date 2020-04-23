package com.travel.dao;

import com.travel.pojo.Destination;
import com.travel.pojo.Hotel;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-24 18:07 新建
 */
@Mapper
public interface HotelDao {

    //后台查询所有酒店
    @Select("select * from hotel")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "name",column = "name"),
            @Result(property = "english",column = "english"),
            @Result(property = "hotelDesc",column = "hotelDesc"),
            @Result(property = "location",column = "location"),
            @Result(property = "price",column = "price"),
            @Result(property = "url",column = "url"),
            @Result(property = "destId",column = "destId"),
            @Result(property = "destination",column = "destId",javaType = Destination.class,one = @One(select = "com.travel.dao.DestinationDao.findById")),
    })
    public abstract List<Hotel> findAllHotel() throws Exception;

    //根据酒店名模糊查询
    @Select("select * from hotel where name like concat(concat('%',#{hName},'%'))")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "name",column = "name"),
            @Result(property = "english",column = "english"),
            @Result(property = "hotelDesc",column = "hotelDesc"),
            @Result(property = "location",column = "location"),
            @Result(property = "price",column = "price"),
            @Result(property = "url",column = "url"),
            @Result(property = "destId",column = "destId"),
            @Result(property = "destination",column = "destId",javaType = Destination.class,one = @One(select = "com.travel.dao.DestinationDao.findById")),
    })
    public abstract List<Hotel> fuzzyQuery(String hName) throws Exception;

    //添加新酒店
    @Insert("insert into hotel(name,english,hotelDesc,location,price,url,destId) values(#{name},#{english},#{hotelDesc},#{location},#{price},#{url},#{destId})")
    public abstract int addHotel(Hotel hotel) throws Exception;

    //根据id删除酒店
    @Delete("delete from hotel where id=#{hotelId}")
    public abstract int deleteHotel(Integer hotelId) throws Exception;

    //修改酒店信息
    @Update("<script> update hotel set name=#{name},english=#{english},hotelDesc=#{hotelDesc},location=#{location},price=#{price},<if test='url != null'>url=#{url},</if>destId=#{destId} where id=#{id} </script>")
    public abstract int updateHotel(Hotel hotel) throws Exception;

    //根据目的地id查询酒店
    @Select("select * from hotel where destId=#{destId}")
    public abstract List<Hotel> findHotelsByDestId(Integer destId) throws Exception;

    //根据酒店id查询酒店
    @Select("select * from hotel where id=#{hotelId}")
    public abstract Hotel findByHotelId(Integer hotelId) throws Exception;

}
