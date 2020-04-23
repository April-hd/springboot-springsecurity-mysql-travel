package com.travel.controller;

import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import com.travel.pojo.Destination;
import com.travel.pojo.Scenery;
import com.travel.service.DestinationService;
import com.travel.service.SceneryService;
import com.travel.utils.UploadFileUtils;
import org.apache.ibatis.annotations.Param;
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
 * @date 2020-01-30 16:59 新建
 */
@Controller
public class SceneryController {

    @Resource
    private SceneryService sceneryService;

    @Resource
    private DestinationService destinationService;

    //后台查询所有风景点
    @RequestMapping(value = "/manage/scenery/findAllScenery",method = RequestMethod.GET)
    public String findAllScenery(@RequestParam(value = "page",required = false,defaultValue = "1") Integer page,
                                 @RequestParam(value = "size",required = false,defaultValue = "5") Integer size,
                                 Model model) throws Exception{
        List<Scenery> sceneries = sceneryService.findAllScenery(page,size);
        List<Destination> destinations = destinationService.findAll();
        PageInfo pageInfo = new PageInfo(sceneries);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("destinations",destinations);
        return "scenery_list";
    }

    //旅游首页查询所有景点
    @RequestMapping(value = "/travel/scenery/findAll",method = RequestMethod.GET)
    public String findAll(Model model) throws Exception{
        List<Scenery> sceneries = sceneryService.findAll();
        model.addAttribute("sceneries",sceneries);
        return "scenery_all";
    }

    //添加新景点时判断新名字是否被使用过
    @RequestMapping(value = "/manage/scenery/findNewSceNameIsUsed.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object findNewSceNameIsUsed(@RequestParam("newSceName") String newSceName){
        HashMap<String,String> selectResult = new HashMap<String, String>();
        int res = -1;
        try {
            res = sceneryService.findNewSceNameIsUsed(newSceName);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (res > 0){
                //表示已经被使用过了
                selectResult.put("selectResult","false");
            }else if (res == 0){
                //表示没有被使用过
                selectResult.put("selectResult","true");
            }else {
                //表示没有执行查询语句
                selectResult.put("selectResult","findNewSceNameIsUsedError");
            }
        }
        return JSONArray.toJSONString(selectResult);
    }

    //执行添加景点操作
    @RequestMapping(value = "/manage/scenery/addScenery.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object addScenery(Scenery scenery, @RequestParam("file") MultipartFile file){
        HashMap<String,String> addResult = new HashMap<String, String>();
        String newFilename = "";
        try {
            newFilename = UploadFileUtils.uploadImgFile(file,"scenery");
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (newFilename != null && !"".equals(newFilename)){
            scenery.setUrl("../../images/scenery/" + newFilename);
        }else {
            scenery.setUrl("");
        }
        int res = 0;
        try {
            res = sceneryService.addScenery(scenery);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (res > 0){
                addResult.put("addResult","true");
            }else {
                addResult.put("addResult","false");
            }
        }
        return JSONArray.toJSONString(addResult);
    }

    //根据传过来的风景名进行模糊查询
    @RequestMapping(value = "/manage/scenery/fuzzyQuery",method = RequestMethod.GET)
    public String fuzzyQuery(@RequestParam("sName") String sName, Model model) throws Exception{
        List<Scenery> sceneries = sceneryService.fuzzyQuery(sName);
        model.addAttribute("sceneries",sceneries);
        if (sceneries.size() > 0){
            List<Destination> destinations = destinationService.findAll();
            model.addAttribute("destinations",destinations);
        }
        return "scenery_list";
    }


    //修改景点信息
    @RequestMapping(value = "/manage/scenery/updateScenery.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object updateScenery(Scenery scenery,@RequestParam(value = "file",required = false) MultipartFile file){
        HashMap<String,String> updateResult = new HashMap<String, String>();
        if (file != null){
            try {
                String newFilename = UploadFileUtils.uploadImgFile(file, "scenery");
                scenery.setUrl("../../images/scenery/" + newFilename);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        int res = 0;
        try {
            res = sceneryService.updateScenery(scenery);
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

    //查看景点名是否已被使用
    @RequestMapping(value = "/manage/scenery/findSceNameIsUsed.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object findSceNameIsUsed(@Param("sceId") Integer sceId,
                                    @Param("sceName") String sceName){
        HashMap<String,String> selectResult = new HashMap<String, String>();
        int res = 0;
        try {
            res = sceneryService.findSceNameIsUsed(sceId,sceName);
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

    //根据id删除景点
    @RequestMapping(value = "/manage/scenery/deleteScenery.ajax",method = RequestMethod.GET)
    @ResponseBody
    public Object deleteScenery(@RequestParam("sceneryId") Integer sceneryId){
        HashMap<String,String> delResult = new HashMap<String, String>();
        int res = 0;
        try {
            res = sceneryService.deleteScenery(sceneryId);
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
