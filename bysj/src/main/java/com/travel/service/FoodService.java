package com.travel.service;

import com.travel.pojo.Food;

import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-02-03 13:03 新建
 */
public interface FoodService {

    //查询云南10道美食
    public abstract List<Food> findTenFood() throws Exception;

    //查询所有美食
    public abstract List<Food> findAllFood(Integer page, Integer size) throws Exception;

    //修改食物信息
    public abstract int updateFood(Food food) throws Exception;

    //修改食物信息时查看美食名是否已经被使用过了
    public abstract int findFNameIsUsed(Integer fId, String fName) throws Exception;

    //根据传过来的食物名进行模糊查询
    public abstract List<Food> fuzzyQuery(String fName) throws Exception;

    //添加新美食时查询美食名是否已经被使用过了
    public abstract int findNewFoodNameIsUsed(String foodName) throws Exception;

    //执行添加新美食操作
    public abstract int addFood(Food food) throws Exception;

    //根据id删除美食
    public abstract int deleteFood(Integer foodId) throws Exception;

    //旅游网站查询所有美食
    public abstract List<Food> findAll() throws Exception;
}
