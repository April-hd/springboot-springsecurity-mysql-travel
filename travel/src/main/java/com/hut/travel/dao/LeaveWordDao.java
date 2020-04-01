package com.hut.travel.dao;

import com.hut.travel.pojo.LeaveWord;
import com.hut.travel.pojo.Route;
import com.hut.travel.pojo.UserInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-10 18:36 新建
 */
@Mapper
public interface LeaveWordDao {

    @Select("select * from leaveword")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "routeId",column = "routeId"),
            @Result(property = "userId",column = "userId"),
            @Result(property = "txt",column = "txt"),
            @Result(property = "createTime",column = "createTime"),
            @Result(property = "route",column = "routeId",javaType = Route.class,one = @One(select = "com.hut.travel.dao.RouteDao.findRouteById")),
            @Result(property = "userInfo",column = "userId",javaType = UserInfo.class,one = @One(select = "com.hut.travel.dao.UserInfoDao.findByUserId"))
    })
    public abstract List<LeaveWord> findAll() throws Exception;

    //根据id删除留言
    @Delete("delete from leaveword where id=#{id}")
    public abstract int deleteLeaaveWord(Integer id) throws Exception;

    //根据传来的留言人和留言文本进行模糊查询
    @Select("select * from leaveword where userId=#{leaveWordNameId} and txt like concat(concat('%',#{leaveWordTxt},'%'))")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "routeId",column = "routeId"),
            @Result(property = "userId",column = "userId"),
            @Result(property = "txt",column = "txt"),
            @Result(property = "createTime",column = "createTime"),
            @Result(property = "route",column = "routeId",javaType = Route.class,one = @One(select = "com.hut.travel.dao.RouteDao.findRouteById")),
            @Result(property = "userInfo",column = "userId",javaType = UserInfo.class,one = @One(select = "com.hut.travel.dao.UserInfoDao.findByUserId"))
    })
    public abstract List<LeaveWord> fuzzyQuery(@Param("leaveWordNameId") Integer leaveWordNameId,@Param("leaveWordTxt") String leaveWordTxt) throws Exception;

    //如果没传留言人，就对留言文本进行模糊查询
    @Select("select * from leaveword where txt like concat(concat('%',#{leaveWordTxt},'%'))")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "routeId",column = "routeId"),
            @Result(property = "userId",column = "userId"),
            @Result(property = "txt",column = "txt"),
            @Result(property = "createTime",column = "createTime"),
            @Result(property = "route",column = "routeId",javaType = Route.class,one = @One(select = "com.hut.travel.dao.RouteDao.findRouteById")),
            @Result(property = "userInfo",column = "userId",javaType = UserInfo.class,one = @One(select = "com.hut.travel.dao.UserInfoDao.findByUserId"))
    })
    public abstract List<LeaveWord> fuzzyQueryByTxt(String leaveWordTxt) throws Exception;
}
