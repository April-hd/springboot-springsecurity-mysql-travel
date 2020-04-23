package com.travel.service.impl;

import com.github.pagehelper.PageHelper;
import com.travel.dao.FoodDao;
import com.travel.pojo.Food;
import com.travel.service.FoodService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-02-03 13:04 新建
 */
@Service
public class FoodServiceImpl implements FoodService {

    @Resource
    private FoodDao foodDao;

    //查询10道美食
    @Override
    public List<Food> findTenFood() throws Exception {
        return foodDao.findTenFood();
    }

    //查询所有美食
    @Override
    public List<Food> findAllFood(Integer page,Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return foodDao.findAllFood();
    }

    //修改食物信息
    @Override
    public int updateFood(Food food) throws Exception {
        return foodDao.updateFood(food);
    }

    //查看美食名是否已经被使用过了
    @Override
    public int findFNameIsUsed(Integer fId, String fName) throws Exception {
        return foodDao.findFNameIsUsed(fId,fName);
    }

    //根据传过来的食物名进行模糊查询
    @Override
    public List<Food> fuzzyQuery(String fName) throws Exception {
        return foodDao.fuzzyQuery(fName);
    }

    //添加新美食时查询美食名是否已经被使用过了
    @Override
    public int findNewFoodNameIsUsed(String foodName) throws Exception {
        return foodDao.findNewFoodNameIsUsed(foodName);
    }

    //执行添加新美食操作
    @Override
    public int addFood(Food food) throws Exception {
        return foodDao.addFood(food);
    }

    //根据id删除美食
    @Override
    public int deleteFood(Integer foodId) throws Exception {
        return foodDao.deleteFood(foodId);
    }

    //旅游网站查询所有美食
    @Override
    public List<Food> findAll() throws Exception {
        return foodDao.findAllFood();
    }

}
