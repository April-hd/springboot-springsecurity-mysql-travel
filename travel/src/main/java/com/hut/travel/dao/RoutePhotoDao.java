package com.hut.travel.dao;

import com.hut.travel.pojo.RoutePhoto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-02-25 13:45 新建
 */
@Mapper
public interface RoutePhotoDao {

    //根据旅游路线id查询对应图片资源
    @Select("select * from rp where rid = #{rid}")
    public abstract List<RoutePhoto> findRoutePhotoByRId(int rid);

}
