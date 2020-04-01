package com.hut.travel.dao;

import com.hut.travel.pojo.Destination;
import com.hut.travel.pojo.Scenery;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-01-30 19:48 新建
 */
@Mapper
public interface SceneryDao {

    //根据目的地id查询该目的地所有景点
    @Select("select * from scenery where destId=#{destId}")
    public abstract List<Scenery> findSceneriesByDestId(Integer destId) throws Exception;

    //查询所有风景点
    @Select("select * from scenery")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "name",column = "name"),
            @Result(property = "location",column = "location"),
            @Result(property = "level",column = "level"),
            @Result(property = "openTime",column = "openTime"),
            @Result(property = "price",column = "price"),
            @Result(property = "url",column = "url"),
            @Result(property = "destId",column = "destId"),
            @Result(property = "destination",column = "destId",javaType = Destination.class,one = @One(select = "com.hut.travel.dao.DestinationDao.findById"))
    })
    public List<Scenery> findAllScenery() throws Exception;

    //修改景点信息
    @Update("<script> update scenery set name=#{name},location=#{location},level=#{level},openTime=#{openTime},price=#{price}<if test='url != null'>,url=#{url}</if>,destId=#{destId} where id=#{id} </script>")
    public abstract int updateScenery(Scenery scenery) throws Exception;

    //修改时查看景点名是否已被使用
    @Select("select count(*) from scenery where name=#{sceName} and id!=#{sceId}")
    public abstract int findSceNameIsUsed(@Param("sceId") Integer sceId,@Param("sceName") String sceName) throws Exception;

    //根据传过来的风景名进行模糊查询
    @Select("select * from scenery where name like concat(concat('%',#{sName},'%'))")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "name",column = "name"),
            @Result(property = "location",column = "location"),
            @Result(property = "level",column = "level"),
            @Result(property = "openTime",column = "openTime"),
            @Result(property = "price",column = "price"),
            @Result(property = "url",column = "url"),
            @Result(property = "destId",column = "destId"),
            @Result(property = "destination",column = "destId",javaType = Destination.class,one = @One(select = "com.hut.travel.dao.DestinationDao.findById"))
    })
    public abstract List<Scenery> fuzzyQuery(String sName) throws Exception;

    //添加新景点时判断新名字是否被使用过
    @Select("select count(*) from scenery where name=#{newSceName}")
    public abstract int findNewSceNameIsUsed(String newSceName) throws Exception;

    //执行添加景点操作
    @Insert("insert into scenery (name,location,level,openTime,price,url,destId) values(#{name},#{location},#{level},#{openTime},#{price},#{url},#{destId})")
    public abstract int addScenery(Scenery scenery) throws Exception;

    //根据id删除景点
    @Delete("delete from scenery where id=#{sceneryId}")
    public abstract int deleteScenery(Integer sceneryId) throws Exception;

    //旅游首页查询所有景点
    @Select("select * from scenery")
    public abstract List<Scenery> findAll() throws Exception;
}
