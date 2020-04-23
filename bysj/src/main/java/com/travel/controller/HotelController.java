package com.travel.controller;

import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import com.travel.pojo.Destination;
import com.travel.pojo.Hotel;
import com.travel.service.DestinationService;
import com.travel.service.HotelService;
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
 * @date 2020-03-24 17:40 新建
 */
@Controller
public class HotelController {

    @Resource
    private HotelService hotelService;

    @Resource
    private DestinationService destinationService;

    //进入订酒店首页
    @RequestMapping(value = "/travel/hotel/main",method = RequestMethod.GET)
    public String main(){
        return "hotel_book";
    }

    //后台查询所有酒店
    @RequestMapping(value = "/manage/hotel/findAllHotel",method = RequestMethod.GET)
    public String findAllHotel(@RequestParam(value = "page",required = false,defaultValue = "1") Integer page,
                               @RequestParam(value = "size",required = false,defaultValue = "5") Integer size,
                               Model model) throws Exception{
        List<Hotel> hotels = hotelService.findAllHotel(page,size);
        List<Destination> destinations = destinationService.findAll();
        PageInfo pageInfo = new PageInfo(hotels);
        model.addAttribute("pageInfo",pageInfo);
        model.addAttribute("destinations",destinations);
        return "hotel_list";
    }

    //根据酒店名模糊查询
    @RequestMapping(value = "/manage/hotel/fuzzyQuery",method = RequestMethod.GET)
    public String fuzzyQuery(@RequestParam("hName") String hName, Model model) throws Exception{
        List<Hotel> hotels = hotelService.fuzzyQuery(hName);
        List<Destination> destinations = destinationService.findAll();
        model.addAttribute("hotels",hotels);
        model.addAttribute("destinations",destinations);
        return "hotel_list";
    }

    //添加新酒店
    @RequestMapping(value = "/manage/hotel/addHotel.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object addHotel(Hotel hotel, @RequestParam("file")MultipartFile file){
        HashMap<String,String> addResult = new HashMap<String,String>();
        String newFilename = "";
        try {
            newFilename = UploadFileUtils.uploadImgFile(file,"hotel");
        } catch (IOException e) {
            e.printStackTrace();
            hotel.setUrl("");
        }
        if (newFilename != null && !"".equals(newFilename)){
            hotel.setUrl("../../images/hotel/" + newFilename);
        }else {
            hotel.setUrl("");
        }
        int res = 0;
        try {
            res = hotelService.addHotel(hotel);
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

    //根据id删除酒店
    @RequestMapping(value = "/manage/hotel/deleteHotel.ajax",method = RequestMethod.GET)
    @ResponseBody
    public Object deleteHotel(@RequestParam("hotelId") Integer hotelId){
        HashMap<String,String> delResult = new HashMap<String, String>();
        int res = 0;
        try {
            res = hotelService.deleteHotel(hotelId);
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

    //修改酒店信息
    @RequestMapping(value = "/manage/hotel/updateHotel.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object updateHotel(Hotel hotel, @RequestParam(value = "file",required = false) MultipartFile file){
        HashMap<String,String> updateResult = new HashMap<String, String>();
        if (file != null){
            try {
                String newFilename = UploadFileUtils.uploadImgFile(file,"hotel");
                hotel.setUrl("../../images/hotel/" + newFilename);
            } catch (IOException e) {
                e.printStackTrace();
                hotel.setUrl("");
            }
        }
        int res = 0;
        try {
            res = hotelService.updateHotel(hotel);
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

    //根据用户传的目的地名来查找酒店信息
    @RequestMapping(value = "/travel/hotel/findHotelsByDestName.ajax",method = RequestMethod.GET)
    @ResponseBody
    public Object findHotelsByDestName(@RequestParam("destName") String destName) throws Exception{
        Destination destination = destinationService.findByDestName(destName);
        List<Hotel> hotels = null;
        if (destination != null){
            hotels = hotelService.findHotelsByDestId(destination.getId());
        }
        return JSONArray.toJSONString(hotels);
    }

}
