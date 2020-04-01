package com.hut.travel.controller;

import com.alibaba.fastjson.JSONArray;
import com.hut.travel.pojo.*;
import com.hut.travel.service.*;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-01-28 18:07 新建
 */
@Controller
public class SpringSecurityController {

    @Resource
    private CarouselService carouselService;

    @Resource
    private RouteService routeService;

    @Resource
    private DestinationService destinationService;

    @Resource
    private FoodService foodService;

    @Resource
    private UserInfoService userInfoService;

    //1.进入网站首页;查询10个背景，3条热门路线，6个热门目的地，10道美食
    @RequestMapping(value = "/travel",method = RequestMethod.GET)
    public String travel(Model model) throws Exception{
        List<Carousel> carousels = carouselService.findTenBackground();
        List<Route> routes = routeService.findThreeHeat();
        List<Destination> destinations =  destinationService.findSixDestination();
        List<Food> foods = foodService.findTenFood();
        model.addAttribute("carousels",carousels);
        model.addAttribute("routes",routes);
        model.addAttribute("destinations",destinations);
        model.addAttribute("foods",foods);
        return "travel";
    }

    //登录成功后进入网站首页
//    @RequestMapping(value = "/traveller",method = RequestMethod.POST)
//    public String traveller(Model model,HttpSession session) throws Exception{
//        List<Destination> destinations =  destinationService.findAll();
//        List<Food> foods = foodService.findAll();
//        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//        User user = (User)principal;
//        UserInfo userInfo = userInfoService.findByUsername(user.getUsername());
//        session.setAttribute("userInfo",userInfo);
//        model.addAttribute("destinations",destinations);
//        model.addAttribute("foods",foods);
//        return "traveller";
//    }

    //2.用户进入旅游网站登录页面
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login(){
        return "login";
    }

    //3.用户执行登录操作
    @RequestMapping(value = "/login.do",method = RequestMethod.POST)
    @ResponseBody
    public Object doLogin(@RequestParam("username") String username,
                          @RequestParam("password") String password,
                          HttpSession session) throws Exception{
        HashMap<String,String> loginResult = new HashMap<String, String>();
        UserInfo userInfo = userInfoService.findUser(username,password);
        if (userInfo != null){
            if (userInfo.getStatus() == 1){
                //用户名密码正确，并且账号状态可用
                session.setAttribute("userInfo",userInfo);
                loginResult.put("loginResult","true");
            }else {
                //账号不可用
                loginResult.put("loginResult","forbid");
            }
        }else {
            //用户名或密码错误
            loginResult.put("loginResult","false");
        }
        return JSONArray.toJSONString(loginResult);
    }

    //3.用户退出旅游网站
    @RequestMapping(value = "/logout",method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.removeAttribute("userInfo");
        return "redirect:travel";
    }

    //4.进入后台管理系统登录页面
    @RequestMapping(value = "/loginManage")
    public String loginManage(){
        return "loginManage";
    }

    //登录后台失败信息处理
    @RequestMapping("/loginManage/error")
    public String loginManageError(@RequestParam("message") String message, HttpSession session){
        session.setAttribute("message",message);
        return "loginManage";
    }

    //5.登录成功由SpringSecurity转发/manage进入后台管理界面
    @RequestMapping(value = "/manage")
    public String manage(){
        return "manage";
    }

}
