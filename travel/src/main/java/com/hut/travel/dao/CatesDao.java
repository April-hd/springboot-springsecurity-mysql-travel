package com.hut.travel.dao;

import com.hut.travel.pojo.Cates;
import com.hut.travel.pojo.Destination;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-02-01 13:59 新建
 */
@Mapper
public interface CatesDao {

    //根据目的地id查询该目的地所有美食店
    @Select("select * from cates where destId=#{destId}")
    public abstract List<Cates> findCatesByDestId(Integer destId) throws Exception;

    //查询所有美食店
    @Select("select * from cates")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "name",column = "name"),
            @Result(property = "url",column = "url"),
            @Result(property = "location",column = "location"),
            @Result(property = "catesDesc",column = "catesDesc"),
            @Result(property = "destId",column = "destId"),
            @Result(property = "destination",column = "destId",javaType = Destination.class,one = @One(select = "com.hut.travel.dao.DestinationDao.findById"))
    })
    public List<Cates> findAllCate() throws Exception;

    //修改美食店信息
    @Update("<script> update cates set name=#{name},location=#{location},catesDesc=#{catesDesc},<if test='url != null'>url=#{url},</if>destId=#{destId} where id=#{id} </script>")
    public abstract int updateCate(Cates cate) throws Exception;

    //查看美食店名是否已经被使用过了
    @Select("select count(*) from cates where name=#{cName} and id!=#{cId}")
    public abstract int findCNameIsUsed(@Param("cId") Integer cId,@Param("cName") String cName) throws Exception;

    //根据传过来的美食店名进行模糊查询
    @Select("select * from cates where name like concat(concat('%',#{cName},'%'))")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "name",column = "name"),
            @Result(property = "url",column = "url"),
            @Result(property = "location",column = "location"),
            @Result(property = "catesDesc",column = "catesDesc"),
            @Result(property = "destId",column = "destId"),
            @Result(property = "destination",column = "destId",javaType = Destination.class,one = @One(select = "com.hut.travel.dao.DestinationDao.findById"))
    })
    public abstract List<Cates> fuzzyQuery(String cName) throws Exception;

    //添加新美食店时查看新名字是否被使用过
    @Select("select count(*) from cates where name=#{cateName}")
    public abstract int findNewCateNameIsUsed(String cateName) throws Exception;

    //执行添加美食店操作
    @Insert("insert into cates(name,location,catesDesc,url,destId) values(#{name},#{location},#{catesDesc},#{url},#{destId})")
    public abstract int addCate(Cates cate) throws Exception;

    //根据id删除美食店
    @Delete("delete from cates where id=#{cateId}")
    public abstract int deleteCate(Integer cateId) throws Exception;

    //网站首页查询所有店铺
    @Select("select * from cates")
    public abstract List<Cates> findAll() throws Exception;
}
