package com.hut.travel.dao;

import com.hut.travel.pojo.LeaveWord;
import com.hut.travel.pojo.Route;
import com.hut.travel.pojo.UserInfo;
import org.apache.ibatis.annotations.*;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-02-25 13:01 新建
 */
@Mapper
public interface RouteDao {

    //查询3条最热门路线及对应的图片资源
    @Select("select * from route order by heat desc limit 0,3")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "num",column = "Num"),
            @Result(property = "name",column = "Name"),
            @Result(property = "price",column = "price"),
            @Result(property = "time",column = "time"),
            @Result(property = "season",column = "season"),
            @Result(property = "routeDesc",column = "routeDesc"),
            @Result(property = "status",column = "status"),
            @Result(property = "routePhotoList",column = "id",javaType = java.util.List.class,many = @Many(select = "com.hut.travel.dao.RoutePhotoDao.findRoutePhotoByRId"))
    })
    public abstract List<Route> findThreeHeat() throws Exception;

    //查询所有热门路线
    @Select("select * from route")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "num",column = "Num"),
            @Result(property = "name",column = "Name"),
            @Result(property = "price",column = "price"),
            @Result(property = "time",column = "time"),
            @Result(property = "season",column = "season"),
            @Result(property = "routeDesc",column = "routeDesc"),
            @Result(property = "status",column = "status"),
            @Result(property = "routePhotoList",column = "id",javaType = java.util.List.class,many = @Many(select = "com.hut.travel.dao.RoutePhotoDao.findRoutePhotoByRId"))
    })
    public abstract List<Route> findAll() throws Exception;


    //按热度查询所有所有热门路线
    @Select("select * from route order by heat desc")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "num",column = "Num"),
            @Result(property = "name",column = "Name"),
            @Result(property = "price",column = "price"),
            @Result(property = "time",column = "time"),
            @Result(property = "season",column = "season"),
            @Result(property = "routeDesc",column = "routeDesc"),
            @Result(property = "status",column = "status"),
            @Result(property = "routePhotoList",column = "id",javaType = java.util.List.class,many = @Many(select = "com.hut.travel.dao.RoutePhotoDao.findRoutePhotoByRId"))
    })
    public abstract List<Route> findAllByHeat() throws Exception;

    //按价格查询所有所有热门路线
    @Select("select * from route order by price desc")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "num",column = "Num"),
            @Result(property = "name",column = "Name"),
            @Result(property = "price",column = "price"),
            @Result(property = "time",column = "time"),
            @Result(property = "season",column = "season"),
            @Result(property = "routeDesc",column = "routeDesc"),
            @Result(property = "status",column = "status"),
            @Result(property = "routePhotoList",column = "id",javaType = java.util.List.class,many = @Many(select = "com.hut.travel.dao.RoutePhotoDao.findRoutePhotoByRId"))
    })
    public abstract List<Route> findAllByPrice() throws Exception;

    //按价格查询所有所有热门路线
    @Select("select * from route order by time desc")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "num",column = "Num"),
            @Result(property = "name",column = "Name"),
            @Result(property = "price",column = "price"),
            @Result(property = "time",column = "time"),
            @Result(property = "season",column = "season"),
            @Result(property = "routeDesc",column = "routeDesc"),
            @Result(property = "status",column = "status"),
            @Result(property = "routePhotoList",column = "id",javaType = java.util.List.class,many = @Many(select = "com.hut.travel.dao.RoutePhotoDao.findRoutePhotoByRId"))
    })
    public abstract List<Route> findAllByTime() throws Exception;

    //根据路线id查询路线详情
    @Select("select * from route where id=#{id}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "num",column = "Num"),
            @Result(property = "name",column = "Name"),
            @Result(property = "price",column = "price"),
            @Result(property = "time",column = "time"),
            @Result(property = "season",column = "season"),
            @Result(property = "routeDesc",column = "routeDesc"),
            @Result(property = "status",column = "status"),
            @Result(property = "routePhotoList",column = "id",javaType = java.util.List.class,many = @Many(select = "com.hut.travel.dao.RoutePhotoDao.findRoutePhotoByRId"))
    })
    public abstract Route findRouteById(Integer id) throws Exception;

    //根据id查询路线的留言
    @Select("select * from leaveword where routeId=#{id} order by createTime desc")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "routeId",column = "routeId"),
            @Result(property = "userId",column = "userId"),
            @Result(property = "txt",column = "txt"),
            @Result(property = "createTime",column = "createTime"),
            @Result(property = "userInfo",column = "userId",javaType = UserInfo.class,one = @One(select = "com.hut.travel.dao.UserInfoDao.findByUserId"))
    })
    public abstract List<LeaveWord> findLeaveWordById(Integer id) throws Exception;

    //修改路线信息
    @Update("update route set num=#{num},name=#{name},price=#{price},time=#{time},season=#{season},routeDesc=#{routeDesc},heat=#{heat},status=#{status} where id=#{id}")
    public abstract int updateRoute(Route route) throws Exception;

    //查看路线编号是否已被使用
    @Select("select count(*) from route where num=#{rNum} and id!=#{rId}")
    public abstract int findRNumIsUsed(@Param("rId") Integer rId,@Param("rNum") String rNum) throws Exception;

    //查看路线名是否已被使用
    @Select("select count(*) from route where name=#{rName} and id!=#{rId}")
    public abstract int findRNameIsUsed(@Param("rId") Integer rId,@Param("rName") String rName) throws Exception;

    //根据传过来的路线编号和路线名进行模糊查询
    @Select("select * from route where num like concat(concat('%',#{routeNum},'%')) and name like concat(concat('%',#{routeName},'%'))")
    public abstract List<Route> fuzzyQuery(@Param("routeNum") String routeNum,@Param("routeName") String routeName) throws Exception;

    //添加新路线时查看路线编号是否已被使用过
    @Select("select count(*) from route where num=#{newRouteNum}")
    public abstract int findNewRouteNumIsUsed(String newRouteNum) throws Exception;

    //添加新路线时查看路线名是否已被使用过
    @Select("select count(*) from route where name=#{newRouteName}")
    public abstract int findNewRouteNameIsUsed(String newRouteName) throws Exception;

    //执行添加新路线操作
    @Insert("insert into route(num,name,price,time,season,routeDesc,status,href) values(#{num},#{name},#{price},#{time},#{season},#{routeDesc},#{status},#{href})")
    public abstract int addRoute(Route route) throws Exception;

    //根据id删除路线
    @Delete("delete from route where id=#{routeId}")
    public abstract int deleteRoute(Integer routeId) throws Exception;

    //路线详情页添加图片
    @Insert("insert into rp(rid,url) values(#{routeId},#{sqlFilename})")
    public abstract int uploadImg(@Param("sqlFilename") String sqlFilename,@Param("routeId") Integer routeId) throws Exception;
}
