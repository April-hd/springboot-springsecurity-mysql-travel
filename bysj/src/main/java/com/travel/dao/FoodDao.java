package com.travel.dao;

import com.travel.pojo.Food;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-02-03 13:03 新建
 */
@Mapper
public interface FoodDao {

    //查询云南10道美食
    @Select("select * from food limit 0,10")
    public List<Food> findTenFood() throws Exception;

    //查询所有美食
    @Select("select * from food")
    public List<Food> findAllFood() throws Exception;

    //修改食物信息
    @Update("<script> update food set name=#{name},price=#{price},<if test='url != null'>url=#{url},</if>foodDesc=#{foodDesc} where id=#{id} </script>")
    public abstract int updateFood(Food food) throws Exception;

    //查看美食名是否已经被使用过了
    @Select("select count(*) from food where name=#{fName} and id!=#{fId}")
    public abstract int findFNameIsUsed(@Param("fId") Integer fId, @Param("fName") String fName) throws Exception;

    //根据传过来的食物名进行模糊查询
    @Select("select * from food where name like concat(concat('%',#{fName},'%'))")
    public abstract List<Food> fuzzyQuery(String fName) throws Exception;

    //添加新美食时查询美食名是否已经被使用过了
    @Select("select count(*) from food where name=#{foodName}")
    public abstract int findNewFoodNameIsUsed(String foodName) throws Exception;

    //执行添加新美食操作
    @Insert("insert into food (name,price,foodDesc,url) values(#{name},#{price},#{foodDesc},#{url})")
    public abstract int addFood(Food food) throws Exception;

    //根据id删除美食
    @Delete("delete from food where id=#{foodId}")
    public abstract int deleteFood(Integer foodId) throws Exception;
}
