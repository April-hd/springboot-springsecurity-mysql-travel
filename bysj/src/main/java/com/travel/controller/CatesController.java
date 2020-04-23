package com.travel.controller;

import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import com.travel.pojo.Cates;
import com.travel.pojo.Destination;
import com.travel.service.CatesService;
import com.travel.service.DestinationService;
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
 * @date 2020-02-01 13:57 新建
 */
@Controller
public class CatesController {

    @Resource
    private CatesService catesService;

    @Resource
    private DestinationService destinationService;

    //后台管理系统查询所有美食店
    @RequestMapping(value = "/manage/cates/findAllCate",method = RequestMethod.GET)
    public String findAllCate(@RequestParam(value = "page",required = false,defaultValue = "1") Integer page,
                              @RequestParam(value = "size",required = false,defaultValue = "5") Integer size,
                              Model model) throws Exception{
        List<Cates> cates = catesService.findAllCate(page,size);
        List<Destination> destinations = destinationService.findAll();
        PageInfo pageInfo = new PageInfo(cates);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("destinations",destinations);
        return "cate_list";
    }

    //网站首页查询所有店铺
    @RequestMapping(value = "/travel/cate/findAll",method = RequestMethod.GET)
    public String findAll(Model model) throws Exception{
        List<Cates> cates = catesService.findAll();
        model.addAttribute("cates",cates);
        return "cate_all";
    }

    //添加新美食店时查看新名字是否被使用过
    @RequestMapping(value = "/manage/cate/findNewCateNameIsUsed.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object findNewCateNameIsUsed(@RequestParam("newCateName") String cateName){
        HashMap<String,String> selectResult = new HashMap<String, String>();
        int res = -1;
        try {
            res = catesService.findNewCateNameIsUsed(cateName);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (res > 0){
                //被使用过
                selectResult.put("selectResult","false");
            }else if (res == 0){
                //没被使用过
                selectResult.put("selectResult","true");
            }else {
                selectResult.put("selectResult","findNewCateNameIsUsedError");
            }
        }
        return JSONArray.toJSONString(selectResult);
    }

    //执行添加美食店操作
    @RequestMapping(value = "/manage/cate/addCate.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object addCate(Cates cate, @RequestParam("file")MultipartFile file){
        HashMap<String,String> addResult = new HashMap<String, String>();
        String newFilename = "";
        try {
            newFilename = UploadFileUtils.uploadImgFile(file,"cate");
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (newFilename != null && !"".equals(newFilename)){
            cate.setUrl("../../images/cate/" + newFilename);
        }else {
            cate.setUrl("");
        }
        int res = 0;
        try {
            res = catesService.addCate(cate);
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

    //根据传过来的美食店名进行模糊查询
    @RequestMapping(value = "/manage/cate/fuzzyQuery",method = RequestMethod.GET)
    public String fuzzyQuery(@RequestParam("cName") String cName, Model model) throws Exception{
        List<Cates> cates = catesService.fuzzyQuery(cName);
        model.addAttribute("cates",cates);
        if (cates.size() > 0){
            List<Destination> destinations = destinationService.findAll();
            model.addAttribute("destinations",destinations);
        }
        return "cate_list";
    }

    //修改美食店信息
    @RequestMapping(value = "/manage/cate/updateCate.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object updateCate(Cates cate,@RequestParam(value = "file",required = false) MultipartFile file){
        HashMap<String,String> updateResult = new HashMap<String, String>();
        if (file != null){
            try {
                String newFilename = UploadFileUtils.uploadImgFile(file, "cate");
                cate.setUrl("../../images/cate/" + newFilename);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        int res = 0;
        try {
            res = catesService.updateCate(cate);
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

    //查看美食店名是否已经被使用过了
    @RequestMapping(value = "/manage/cate/findCNameIsUsed.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object findCNameIsUsed(@RequestParam("cId") Integer cId,
                                  @RequestParam("cName") String cName){
        HashMap<String,String> selectResult = new HashMap<String, String>();
        int res = 0;
        try {
            res = catesService.findCNameIsUsed(cId,cName);
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

    //根据id删除美食店
    @RequestMapping(value = "/manage/cate/deleteCate.ajax",method = RequestMethod.GET)
    @ResponseBody
    public Object deleteCate(@RequestParam("cateId") Integer cateId){
        HashMap<String,String> delResult = new HashMap<String, String>();

        int res = 0;
        try {
            res = catesService.deleteCate(cateId);
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
