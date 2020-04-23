package com.travel.controller;

import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import com.travel.pojo.Cates;
import com.travel.pojo.Destination;
import com.travel.pojo.Hotel;
import com.travel.pojo.Scenery;
import com.travel.service.CatesService;
import com.travel.service.DestinationService;
import com.travel.service.HotelService;
import com.travel.service.SceneryService;
import com.travel.utils.UploadFileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
 * @date 2020-01-30 18:54 新建
 */
@Controller
public class DestinationController {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Resource
    private DestinationService destinationService;

    @Resource
    private CatesService catesService;

    @Resource
    private SceneryService sceneryService;

    @Resource
    private HotelService hotelService;

    @RequestMapping(value = "/travel/destination/lijiang",method = RequestMethod.GET)
    public String lijiang(@RequestParam(value = "id") Integer destId,Model model) throws Exception{
        List<Cates> cates = catesService.findCatesByDestId(destId);
        model.addAttribute("cates",cates);
        List<Scenery> sceneries = sceneryService.findSceneriesByDestId(destId);
        model.addAttribute("sceneries",sceneries);
        List<Hotel> hotels = hotelService.findHotelsByDestId(destId);
        model.addAttribute("hotels",hotels);
        return "lijiang";
    }

    @RequestMapping(value = "/travel/destination/kunming",method = RequestMethod.GET)
    public String kunming(@RequestParam(value = "id") Integer destId,Model model) throws Exception{
        List<Cates> cates = catesService.findCatesByDestId(destId);
        model.addAttribute("cates",cates);
        List<Scenery> sceneries = sceneryService.findSceneriesByDestId(destId);
        model.addAttribute("sceneries",sceneries);
        List<Hotel> hotels = hotelService.findHotelsByDestId(destId);
        model.addAttribute("hotels",hotels);
        return "kunming";
    }

    @RequestMapping(value = "/travel/destination/dali",method = RequestMethod.GET)
    public String dali(@RequestParam("id") Integer destId,Model model) throws Exception{
        List<Cates> cates = catesService.findCatesByDestId(destId);
        model.addAttribute("cates",cates);
        List<Scenery> sceneries = sceneryService.findSceneriesByDestId(destId);
        model.addAttribute("sceneries",sceneries);
        List<Hotel> hotels = hotelService.findHotelsByDestId(destId);
        model.addAttribute("hotels",hotels);
        return "dali";
    }

    @RequestMapping(value = "/travel/destination/xishuangbanna",method = RequestMethod.GET)
    public String xishuangbanna(@RequestParam("id") Integer destId,Model model) throws Exception{
        List<Cates> cates = catesService.findCatesByDestId(destId);
        model.addAttribute("cates",cates);
        List<Scenery> sceneries = sceneryService.findSceneriesByDestId(destId);
        model.addAttribute("sceneries",sceneries);
        List<Hotel> hotels = hotelService.findHotelsByDestId(destId);
        model.addAttribute("hotels",hotels);
        return "xishuangbanna";
    }

    @RequestMapping(value = "/travel/destination/xianggelila",method = RequestMethod.GET)
    public String xianggelila(@RequestParam("id") Integer destId,Model model) throws Exception{
        List<Cates> cates = catesService.findCatesByDestId(destId);
        model.addAttribute("cates",cates);
        List<Scenery> sceneries = sceneryService.findSceneriesByDestId(destId);
        model.addAttribute("sceneries",sceneries);
        List<Hotel> hotels = hotelService.findHotelsByDestId(destId);
        model.addAttribute("hotels",hotels);
        return "xianggelila";
    }

    @RequestMapping(value = "/travel/destination/tengchong",method = RequestMethod.GET)
    public String tengchong(@RequestParam("id") Integer destId,Model model) throws Exception{
        List<Cates> cates = catesService.findCatesByDestId(destId);
        model.addAttribute("cates",cates);
        List<Scenery> sceneries = sceneryService.findSceneriesByDestId(destId);
        model.addAttribute("sceneries",sceneries);
        List<Hotel> hotels = hotelService.findHotelsByDestId(destId);
        model.addAttribute("hotels",hotels);
        return "tengchong";
    }


    //旅游网站查找所有目的地
    @RequestMapping(value = "/travel/destination/findAll",method = RequestMethod.GET)
    public String findAll(Model model) throws Exception{
        List<Destination> destinations = destinationService.findAll();
        model.addAttribute("destinations",destinations);
        return "destination_all";
    }

    //查找所有目的地
    @RequestMapping(value = "/manage/destination/findAllDestination",method = RequestMethod.GET)
    public String findAllDestination(@RequestParam(value = "page",required = false,defaultValue = "1") Integer page,
                                     @RequestParam(value = "size",required = false,defaultValue = "5") Integer size,
                                     Model model) throws Exception{
        List<Destination> destinations = destinationService.findAllDestination(page,size);
        PageInfo pageInfo = new PageInfo(destinations);
        model.addAttribute("pageInfo",pageInfo);
        return "destination_list";
    }

    @RequestMapping(value = "/manage/destination/findNewDesNameIsUsed.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object findNewDesNameIsUsed(@RequestParam("newDesName") String newDesName){
        //添加新目的地时判断新名字是否被使用过
        HashMap<String,String> selectResult = new HashMap<String, String>();
        int res = -1;
        try {
            res = destinationService.findNewDesNameIsUsed(newDesName);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (res > 0){
                //表示已经被使用过了
                selectResult.put("selectResult","false");
            }else if (res == 0){
                //表示没有被使用过
                selectResult.put("selectResult","true");
            }else {
                //表示没有执行查询语句
                selectResult.put("selectResult","findNewDesNameIsUsedError");
            }
        }
        return JSONArray.toJSONString(selectResult);
    }

    //执行添加目的地操作
    @RequestMapping(value = "/manage/destination/addDestination.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object addDestination(Destination destination, @RequestParam("file") MultipartFile file){
        HashMap<String,String> addResult = new HashMap<String, String>();
        String newFilename = "";
        try {
            newFilename = UploadFileUtils.uploadImgFile(file,"destination");
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (newFilename != null && !"".equals(newFilename)){
            destination.setUrl("../../images/destination/" + newFilename);
        }else {
            destination.setUrl("");
        }
        int res = 0;
        try {
            res = destinationService.addDestination(destination);
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

    //根据传过来的目的地名进行模糊查询
    @RequestMapping(value = "/manage/destination/fuzzyQuery",method = RequestMethod.GET)
    public String fuzzyQuery(@RequestParam("desName") String desName, Model model) throws Exception{
        List<Destination> destinations = destinationService.fuzzyQuery(desName);
        model.addAttribute("destinations",destinations);
        return "destination_list";
    }

    //修改目的地信息
    @RequestMapping(value = "/manage/destination/updateDestination.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object updateDestination(Destination destination,@RequestParam(value = "file",required = false) MultipartFile file){
        HashMap<String,String> updateResult = new HashMap<String, String>();
        if (file != null){
            try {
                String newFilename = UploadFileUtils.uploadImgFile(file,"destination");
                destination.setUrl("../../images/destination/" + newFilename);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        int res = 0;
        try {
            res = destinationService.updateDestination(destination);
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

    //修改信息时查询目的地名是否已被使用
    @RequestMapping(value = "/manage/destination/findDesNameIsUsed.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object findDesNameIsUsed(@RequestParam("desId") Integer desId,
                                    @RequestParam("desName") String desName){
        HashMap<String,String> selectResult = new HashMap<String, String>();
        int res = 0;
        try {
            res = destinationService.findDesNameIsUsed(desId,desName);
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

    //根据id删除目的地
    @RequestMapping(value = "/manage/destination/deleteDestination.ajax",method = RequestMethod.GET)
    @ResponseBody
    public Object deleteDestination(@RequestParam("desId") Integer desId){
        HashMap<String,String> delResult = new HashMap<String, String>();
        int res = 0;
        try {
            res = destinationService.deleteDestination(desId);
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
