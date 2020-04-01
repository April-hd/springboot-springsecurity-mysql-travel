package com.hut.travel.controller;

import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import com.hut.travel.pojo.Carousel;
import com.hut.travel.service.CarouselService;
import com.hut.travel.utils.UploadFileUtils;
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
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-22 10:06 新建
 */
@Controller
public class CarouselController {

    @Resource
    private CarouselService carouselService;

    //后台查询所有网站首页轮播图
    @RequestMapping(value = "/manage/carousel/findAllCarousel",method = RequestMethod.GET)
    public String findAllCarousel(@RequestParam(value = "page",required = false,defaultValue = "1") Integer page,
                                  @RequestParam(value = "size",required = false,defaultValue = "5") Integer size,
                                  Model model) throws Exception{
        List<Carousel> carousels = carouselService.findAllCarousel(page,size);
        PageInfo pageInfo = new PageInfo(carousels);
        model.addAttribute("pageInfo",pageInfo);
        return "carousel_list";
    }

    //根据中文名模糊查询
    @RequestMapping(value = "/manage/carousel/fuzzyQuery",method = RequestMethod.GET)
    public String fuzzyQuery(@RequestParam("chinese") String chinese,Model model) throws Exception{
        List<Carousel> carousels = carouselService.fuzzyQuery(chinese);
        model.addAttribute("carousels",carousels);
        return "carousel_list";
    }

    //添加新轮播图
    @RequestMapping(value = "/manage/carousel/addCarousel.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object addCarousel(Carousel carousel, @RequestParam("file")MultipartFile file, HttpServletRequest request){
        HashMap<String,String> addResult = new HashMap<String,String>();
        String newFilename = "";
        try {
            newFilename = UploadFileUtils.uploadImgFile(file,request,"carousel");
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (newFilename != null && !"".equals(newFilename)){
            carousel.setUrl("../../images/carousel/" + newFilename);
        }else {
            carousel.setUrl("");
        }
        carousel.setCreateTime(new Date());
        int res = 0;
        try {
            res = carouselService.addCarousel(carousel);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if (res > 0){
                //添加成功
                addResult.put("addResult","true");
            }else {
                addResult.put("addResult","false");
            }
        }
        return JSONArray.toJSONString(addResult);
    }

    //根据id删除轮播图
    @RequestMapping(value = "/manage/carousel/deleteCarousel.ajax",method = RequestMethod.GET)
    @ResponseBody
    public Object deleteCarousel(@RequestParam("carouselId") Integer carouselId){
        HashMap<String,String> delResult = new HashMap<String, String>();
        int res = 0;
        try {
            res = carouselService.deleteCarousel(carouselId);
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

    //修改轮播图信息
    @RequestMapping(value = "/manage/carousel/updateCarousel.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object updateCarousel(Carousel carousel,@RequestParam(value = "file",required = false) MultipartFile file,HttpServletRequest request){
        HashMap<String,String> updateResult = new HashMap<String, String>();
        if (file != null){
            try {
                String newFilename = UploadFileUtils.uploadImgFile(file,request,"carousel");
                carousel.setUrl("../../images/carousel/" + newFilename);
            } catch (IOException e) {
                e.printStackTrace();
                carousel.setUrl("");
            }
        }
        int res = 0;
        try {
            res = carouselService.updateCarousel(carousel);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if (res > 0){
                //修改成功
                updateResult.put("updateResult","true");
            }else {
                //修改失败
                updateResult.put("updateResult","false");
            }
        }
        return JSONArray.toJSONString(updateResult);
    }

}
