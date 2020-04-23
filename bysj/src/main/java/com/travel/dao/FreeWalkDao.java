package com.travel.dao;

import com.travel.pojo.Route;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-29 12:44 新建
 */
@Mapper
public interface FreeWalkDao {

    //模糊查询用户填写的数据
    @Select("select * from route where routeDesc like concat(concat('%',#{month},'%')) and price >= #{minPrice} and price < #{maxPrice} and time >= #{minDay} and time <= #{maxDay} and routeDesc like concat(concat('%',#{dest},'%'))")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "num",column = "Num"),
            @Result(property = "name",column = "Name"),
            @Result(property = "price",column = "price"),
            @Result(property = "time",column = "time"),
            @Result(property = "season",column = "season"),
            @Result(property = "routeDesc",column = "routeDesc"),
            @Result(property = "status",column = "status"),
            @Result(property = "routePhotoList",column = "id",javaType = List.class,many = @Many(select = "com.travel.dao.RoutePhotoDao.findRoutePhotoByRId"))
    })
    public abstract List<Route> fuzzyQuery(@Param("month") String month, @Param("minPrice") Integer minPrice, @Param("maxPrice") Integer maxPrice, @Param("minDay") Integer minDay, @Param("maxDay") Integer maxDay, @Param("dest") String dest) throws Exception;

}
