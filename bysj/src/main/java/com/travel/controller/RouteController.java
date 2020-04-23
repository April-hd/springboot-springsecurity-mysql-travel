package com.travel.controller;

import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import com.travel.pojo.LeaveWord;
import com.travel.pojo.Route;
import com.travel.service.RouteService;
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
 * @date 2020-02-26 15:23 新建
 */
@Controller
public class RouteController {

    @Resource
    private RouteService routeService;

    //默认查询所有路线
    @RequestMapping(value = "/travel/route/findAll",method = RequestMethod.GET)
    public String findAll(@RequestParam(value = "page",required = false,defaultValue = "1") int page,
                           @RequestParam(value = "size",required = false,defaultValue = "5") int size,
                           Model model) throws Exception{
        List<Route> routes = routeService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(routes);
        model.addAttribute("pageInfo",pageInfo);
        return "route_all";
    }

    //按热度查询所有所有热门路线
    @RequestMapping(value = "/travel/route/findAllByHeat",method = RequestMethod.GET)
    public String routeAllByHeat(@RequestParam(value = "page",required = false,defaultValue = "1") int page,
                           @RequestParam(value = "size",required = false,defaultValue = "5") int size,
                           Model model) throws Exception{
        List<Route> routes = routeService.findAllByHeat(page,size);
        PageInfo pageInfo = new PageInfo(routes);
        model.addAttribute("pageInfo",pageInfo);
        return "route_all";
    }

    //按价格查询所有所有热门路线
    @RequestMapping(value = "/travel/route/findAllByPrice",method = RequestMethod.GET)
    public String routeAllByPrice(@RequestParam(value = "page",required = false,defaultValue = "1") int page,
                                 @RequestParam(value = "size",required = false,defaultValue = "5") int size,
                                 Model model) throws Exception{
        List<Route> routes = routeService.findAllByPrice(page,size);
        PageInfo pageInfo = new PageInfo(routes);
        model.addAttribute("pageInfo",pageInfo);
        return "route_all";
    }

    //按天数查询所有所有热门路线
    @RequestMapping(value = "/travel/route/findAllByTime",method = RequestMethod.GET)
    public String routeAllByTime(@RequestParam(value = "page",required = false,defaultValue = "1") int page,
                                  @RequestParam(value = "size",required = false,defaultValue = "5") int size,
                                  Model model) throws Exception{
        List<Route> routes = routeService.findAllByTime(page,size);
        PageInfo pageInfo = new PageInfo(routes);
        model.addAttribute("pageInfo",pageInfo);
        return "route_all";
    }

    //根据路线id查询路线
    @RequestMapping(value = "/travel/route/001",method = RequestMethod.GET)
    public String route_001(@RequestParam(value = "routeId",required = true) Integer id,
                            @RequestParam(value = "page",required = false,defaultValue = "1") Integer page,
                            @RequestParam(value = "size",required = false,defaultValue = "5") Integer size,
                            Model model) throws Exception{
        Route route = routeService.findRouteById(id);
        List<LeaveWord> leaveWords = routeService.findLeaveWordById(id,page,size);
        PageInfo pageInfo = new PageInfo(leaveWords);
        model.addAttribute("route",route);
        model.addAttribute("pageInfo",pageInfo);
        return "route_001";
    }

    @RequestMapping(value = "/travel/route/002",method = RequestMethod.GET)
    public String route_002(@RequestParam(value = "routeId",required = true) Integer id,
                            @RequestParam(value = "page",required = false,defaultValue = "1") Integer page,
                            @RequestParam(value = "size",required = false,defaultValue = "5") Integer size,
                            Model model) throws Exception{
        Route route = routeService.findRouteById(id);
        List<LeaveWord> leaveWords = routeService.findLeaveWordById(id,page,size);
        PageInfo pageInfo = new PageInfo(leaveWords);
        model.addAttribute("route",route);
        model.addAttribute("pageInfo",pageInfo);
        return "route_002";
    }

    @RequestMapping(value = "/travel/route/003",method = RequestMethod.GET)
    public String route_003(@RequestParam(value = "routeId",required = true) Integer id,
                            @RequestParam(value = "page",required = false,defaultValue = "1") Integer page,
                            @RequestParam(value = "size",required = false,defaultValue = "5") Integer size,
                            Model model) throws Exception{
        Route route = routeService.findRouteById(id);
        List<LeaveWord> leaveWords = routeService.findLeaveWordById(id,page,size);
        PageInfo pageInfo = new PageInfo(leaveWords);
        model.addAttribute("route",route);
        model.addAttribute("pageInfo",pageInfo);
        return "route_003";
    }

    //后台查询所有路线
    @RequestMapping(value = "/manage/route/findAllRoute",method = RequestMethod.GET)
    public String findAllRoute(@RequestParam(value = "page",required = false,defaultValue = "1") Integer page,
                               @RequestParam(value = "size",required = false,defaultValue = "10") Integer size,
                               Model model) throws Exception{
        List<Route> routes = routeService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(routes);
        model.addAttribute("pageInfo",pageInfo);
        return "route_list";
    }

    //添加新路线时查看路线编号是否已被使用过
    @RequestMapping(value = "/manage/route/findNewRouteNumIsUsed.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object findNewRouteNumIsUsed(@RequestParam("newRouteNum") String newRouteNum){
        HashMap<String,String> selectResult = new HashMap<String, String>();
        int res = -1;
        try {
            res = routeService.findNewRouteNumIsUsed(newRouteNum);
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
                selectResult.put("selectResult","findNewRouteNumIsUsedError");
            }
        }
        return JSONArray.toJSONString(selectResult);
    }

    //添加新路线时查看路线名是否已被使用过
    @RequestMapping(value = "/manage/route/findNewRouteNameIsUsed.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object findNewRouteNameIsUsed(@RequestParam("newRouteName") String newRouteName){
        HashMap<String,String> selectResult = new HashMap<String, String>();
        int res = -1;
        try {
            res = routeService.findNewRouteNameIsUsed(newRouteName);
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
                selectResult.put("selectResult","findNewRouteNameIsUsedError");
            }
        }
        return JSONArray.toJSONString(selectResult);
    }

    //执行添加新路线操作
    @RequestMapping(value = "/manage/route/addRoute.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object addRoute(Route route){
        HashMap<String,String> addResult = new HashMap<String, String>();
        int res = 0;
        try {
            res = routeService.addRoute(route);
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

    //根据传过来的路线编号和路线名进行模糊查询
    @RequestMapping(value = "/manage/route/fuzzyQuery",method = RequestMethod.GET)
    public String fuzzyQuery(@RequestParam("routeNum") String routeNum,
                             @RequestParam("routeName") String routeName,
                             Model model) throws Exception{
        List<Route> routes = routeService.fuzzyQuery(routeNum,routeName);
        model.addAttribute("routes",routes);
        return "route_list";
    }

    //后台修改路线信息
    @RequestMapping(value = "/manage/route/updateRoute.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object updateRoute(Route route){
        HashMap<String, String> updateResult = new HashMap<String, String>();
        int res = 0;
        try {
            res = routeService.updateRoute(route);
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

    //查看路线编号是否已被使用
    @RequestMapping(value = "/manage/route/findRNumIsUsed.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object findRNumIsUsed(@Param("rId") Integer rId,
                                 @Param("rNum") String rNum){
        HashMap<String,String> selectResult = new HashMap<String, String>();
        int res = 0;
        try {
            res = routeService.findRNumIsUsed(rId,rNum);
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

    //查看路线名是否已被使用
    @RequestMapping(value = "/manage/route/findRNameIsUsed.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object findRNameIsUsed(@Param("rId") Integer rId,
                                 @Param("rName") String rName){
        HashMap<String,String> selectResult = new HashMap<String, String>();
        int res = 0;
        try {
            res = routeService.findRNameIsUsed(rId,rName);
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

    //根据id删除路线
    @RequestMapping(value = "/manage/route/deleteRoute.ajax",method = RequestMethod.GET)
    @ResponseBody
    public Object deleteRoute(@RequestParam("routeId") Integer routeId){
        HashMap<String,String> delResult = new HashMap<String, String>();
        int res = 0;
        try {
            res = routeService.deleteRoute(routeId);
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

    //后台查看路线详情
    @RequestMapping(value = "/manage/route/detail",method = RequestMethod.GET)
    public String routeDetail(@RequestParam("routeId") Integer id,Model model) throws Exception{
        Route route = routeService.findRouteById(id);
        model.addAttribute(route);
        return "route_detail";
    }

    //路线详情页面上传图片
    @RequestMapping("/manage/route/uploadImg.ajax")
    @ResponseBody
    public Object uploadImg(@RequestParam("routeId") Integer routeId, @RequestParam("file") MultipartFile file){
        HashMap<String,String> addResult = new HashMap<String, String>();
        String newFilename = "";
        try {
            newFilename = UploadFileUtils.uploadImgFile(file,"rp");
        } catch (IOException e) {
            e.printStackTrace();
        }
        String sqlFilename;
        if (newFilename != null && !"".equals(newFilename)){
            sqlFilename = "../../images/rp/" + newFilename;
        }else {
            sqlFilename = "";
        }
        int res = 0;
        try {
            res = routeService.uploadImg(sqlFilename,routeId);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if (res > 0){
                //保存到数据库成功
                addResult.put("addResult","true");
            }else {
                //保存到数据库失败
                addResult.put("addResult","false");
            }
        }
        return JSONArray.toJSONString(addResult);
    }

}
