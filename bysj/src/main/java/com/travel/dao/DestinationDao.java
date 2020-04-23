package com.travel.dao;

import com.travel.pojo.Destination;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-02-01 12:53 新建
 */
@Mapper
public interface DestinationDao {

    //查找热门目的地前六个
    @Select("select * from destination limit 0,6")
    public abstract List<Destination> findSixDestination() throws Exception;

    //后台查询所有热门目的地
    @Select("select * from destination")
    public abstract List<Destination> findAllDestination() throws Exception;

    //根据id查询热门目的地
    @Select("select * from destination where id=#{id}")
    public abstract Destination findById(Integer id) throws Exception;

    //修改目的地信息
    @Update("<script> update destination set name=#{name},<if test='url != null'>url=#{url},</if>destiDesc=#{destiDesc},status=#{status} where id=#{id} </script>")
    public abstract int updateDestination(Destination destination) throws Exception;

    //修改信息时查询目的地名是否已被使用
    @Select("select count(*) from destination where name=#{desName} and id!=#{desId}")
    public abstract int findDesNameIsUsed(@Param("desId") Integer desId, @Param("desName") String desName) throws Exception;

    //根据传过来的目的地名进行模糊查询
    @Select("select * from destination where name like concat(concat('%',#{desName},'%'))")
    public abstract List<Destination> fuzzyQuery(String desName) throws Exception;

    //添加新目的地时判断新名字是否被使用过
    @Select("select count(*) from destination where name=#{newDesName}")
    public abstract int findNewDesNameIsUsed(String newDesName) throws Exception;

    //执行添加目的地操作
    @Insert("insert into destination (name,destiDesc,href,url,status) values (#{name},#{destiDesc},#{href},#{url},#{status})")
    public abstract int addDestination(Destination destination) throws Exception;

    //根据id删除目的地
    @Delete("delete from destination where id=#{desId}")
    public abstract int deleteDestination(Integer desId) throws Exception;

    //旅游网站首页查找所有热门目的地
    @Select("select * from destination")
    public abstract List<Destination> findAll() throws Exception;

    //根据目的地名查询目的地
    @Select("select * from destination where name=#{destName}")
    public abstract Destination findByDestName(String destName) throws Exception;
}
