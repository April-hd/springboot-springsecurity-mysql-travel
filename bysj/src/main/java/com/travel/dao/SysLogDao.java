package com.travel.dao;

import com.travel.pojo.SysLog;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-28 14:52 新建
 */
@Mapper
public interface SysLogDao {

    //保存日志信息
    @Insert("insert into syslog(requestServletPath,requestRemoteAddr,requestUsername,requestMethod,requestQueryString,createTime) values(#{requestServletPath},#{requestRemoteAddr},#{requestUsername},#{requestMethod},#{requestQueryString},#{createTime})")
    public abstract void addLog(SysLog sysLog) throws Exception;

    //后台查找所有的日志
    @Select("select * from syslog order by createTime desc")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "requestServletPath",column = "requestServletPath"),
            @Result(property = "requestRemoteAddr",column = "requestRemoteAddr"),
            @Result(property = "requestUsername",column = "requestUsername"),
            @Result(property = "requestMethod",column = "requestMethod"),
            @Result(property = "requestQueryString",column = "requestQueryString"),
            @Result(property = "createTime",column = "createTime")
    })
    public abstract List<SysLog> findAll() throws Exception;

}
