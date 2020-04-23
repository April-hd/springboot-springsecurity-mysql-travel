package com.travel.controller;

import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import com.travel.pojo.Food;
import com.travel.service.FoodService;
import com.travel.utils.UploadFileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-02-10 18:07 新建
 */
@Controller
public class FoodController {

    @Resource
    private FoodService foodService;

    //旅游网站查询所有美食
    @RequestMapping(value = "/travel/food/findAll",method = RequestMethod.GET)
    public String findAll(Model model) throws Exception{
        List<Food> foods = foodService.findAll();
        model.addAttribute("foods",foods);
        return "food_all";
    }

    //管理系统查找所有食物
    @RequestMapping(value = "/manage/food/findAllFood",method = RequestMethod.GET)
    public String findAllFood(@RequestParam(value = "page",required = false,defaultValue = "1") Integer page,
                              @RequestParam(value = "size",required = false,defaultValue = "5") Integer size,
                              Model model) throws Exception{
        List<Food> foods = foodService.findAllFood(page,size);
        PageInfo pageInfo = new PageInfo(foods);
        model.addAttribute("pageInfo",pageInfo);
        return "food_list";
    }

    //添加新美食时查询美食名是否已经被使用过了
    @RequestMapping(value = "/manage/food/findNewFoodNameIsUsed.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object findNewFoodNameIsUsed(@RequestParam("newFoodName") String foodName){
        HashMap<String,String> selectResult = new HashMap<String, String>();
        int res = -1;
        try {
            res = foodService.findNewFoodNameIsUsed(foodName);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if (res > 0){
                //表示美食名已经被使用过了
                selectResult.put("selectResult","false");
            }else if (res == 0){
                //表示美食名没被使用过
                selectResult.put("selectResult","true");
            }else {
                //表示没有执行sql语句
                selectResult.put("selectResult","findNewFoodNameIsUsedError");
            }
        }
        return JSONArray.toJSONString(selectResult);
    }

    //执行添加新美食操作
    @RequestMapping(value = "/manage/food/addFood.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object addFood(Food food, @RequestParam("file")MultipartFile file){
        HashMap<String,String> addResult = new HashMap<String, String>();
        String newFilename = "";
        try {
            newFilename = UploadFileUtils.uploadImgFile(file,"food");
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (newFilename != null && !"".equals(newFilename)){
            food.setUrl("../../images/food/" + newFilename);
        }else {
            food.setUrl("");
        }
        int res = 0;
        try {
            res = foodService.addFood(food);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if (res > 0){
                addResult.put("addResult","true");
            }else {
                addResult.put("addResult","false");
            }
        }
        return JSONArray.toJSONString(addResult);
    }

    //根据传过来的食物名进行模糊查询
    @RequestMapping(value = "/manage/food/fuzzyQuery",method = RequestMethod.GET)
    public String fuzzyQuery(@RequestParam("fName") String fName, Model model) throws Exception{
        List<Food> foods = foodService.fuzzyQuery(fName);
        model.addAttribute("foods",foods);
        return "food_list";
    }

    //修改食物信息
    @RequestMapping(value = "/manage/food/updateFood.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object updateFood(Food food,@RequestParam(value = "file",required = false) MultipartFile file){
        HashMap<String,String> updateResult = new HashMap<String, String>();
        if (file != null){
            try {
                String newFilename = UploadFileUtils.uploadImgFile(file, "food");
                food.setUrl("../../images/food/" + newFilename);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        int res = 0;
        try {
            res = foodService.updateFood(food);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }finally {
            if (res > 0){
                updateResult.put("updateResult","true");
            }else {
                updateResult.put("updateResult","false");
            }
        }
        return JSONArray.toJSONString(updateResult);
    }

    //查看美食名是否已经被使用过了
    @RequestMapping(value = "/manage/food/findFNameIsUsed.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object findFNameIsUsed(@RequestParam("fId") Integer fId,
                                  @RequestParam("fName") String fName){
        HashMap<String,String> selectResult = new HashMap<String, String>();
        int res = 0;
        try {
            res = foodService.findFNameIsUsed(fId,fName);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }finally {
            if (res > 0){
                //大于0个表示至少有一个同名的，返回false
                selectResult.put("selectResult","false");
            }else {
                selectResult.put("selectResult","true");
            }
        }
        return JSONArray.toJSONString(selectResult);
    }

    //根据id删除美食
    @RequestMapping(value = "/manage/food/deleteFood.ajax",method = RequestMethod.GET)
    @ResponseBody
    public Object deleteFood(@RequestParam("foodId") Integer foodId){
        HashMap<String,String> delResult = new HashMap<String, String>();
        int res = 0;
        try {
            res = foodService.deleteFood(foodId);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (res > 0){
                delResult.put("delResult","true");
            }else {
                delResult.put("delResult","false");
            }
        }
        return JSONArray.toJSONString(delResult);
    }

}
