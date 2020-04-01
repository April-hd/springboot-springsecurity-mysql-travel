package com.hut.travel.controller;

import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import com.hut.travel.pojo.*;
import com.hut.travel.service.OrderService;
import com.hut.travel.service.RouteService;
import com.hut.travel.service.UserDoService;
import com.hut.travel.service.UserInfoService;
import com.hut.travel.utils.UploadFileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

/**
 * 类说明
 * 用户操作类
 * @author 茶茶
 * @date 2020-02-22 18:13 新建
 */
@Controller
public class UserDoController {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Resource
    private UserDoService userDoService;

    @Resource
    private UserInfoService userInfoService;

    @Resource
    private RouteService routeService;

    @Resource
    private OrderService orderService;

    //用户进入主页
    @RequestMapping("/travel/user/homepage")
    public String setting(){
        return "user_main";
    }

    //用户更换头像
    @RequestMapping(value = "/travel/user/updateHeaderImg.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object updateHeaderImg(@RequestParam("file") MultipartFile file, HttpServletRequest request,HttpSession session) throws IOException {
        HashMap<String,String> updateResult = new HashMap<String, String>();
        //1.通过上传文件工具类，进行文件的上传以及备份，并返回生成的文件名
        String newFilename = UploadFileUtils.uploadImgFile(file,request,"header");
        //2.获取当前登录用户的id
        UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
        Integer userId = userInfo.getId();
        //3.将新文件名通过id保存到数据库里
        String sqlFilename = "../../images/header/" + newFilename;
        int res = 0;
        try {
            res = userDoService.updateHeaderImg(userId,sqlFilename);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (res > 0){
                try {
                    UserInfo ufo = userInfoService.findByUserId(userId);
                    session.setAttribute("userInfo",ufo);//更新session
                    updateResult.put("updateResult","true");
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }else {
                logger.debug("添加到数据库失败");
                updateResult.put("updateResult","false");
            }
        }
        return JSONArray.toJSONString(updateResult);
    }

    //用户完善个人信息
    @RequestMapping(value = "/travel/user/perfect.ajax",method = RequestMethod.POST)
    @ResponseBody
    public String perfect(@RequestParam("userId") Integer userId,
                          @RequestParam("gender") Integer gender,
                          @RequestParam("intro") String intro,
                          @RequestParam("website") String website
                          ,HttpSession session) {
        HashMap<String,String> updateResult = new HashMap<String, String>();
        int res = 0;
        try {
            res = userDoService.perfect(userId,gender,intro,website);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if (res > 0){
                //修改成功
                UserInfo userInfo = userInfoService.findByUsername(((UserInfo)session.getAttribute("userInfo")).getUsername());
                //更新userInfo
                session.setAttribute("userInfo",userInfo);
                updateResult.put("updateResult","true");
            }else {
                updateResult.put("updateResult","false");
            }
        }
        return JSONArray.toJSONString(updateResult);
    }

    //用户修改密码
    @RequestMapping(value = "/travel/user/updatepwd.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object updatepwd(@RequestParam("oldpwd") String oldpwd,
                            @RequestParam("newpwd") String newpwd,
                            HttpSession session) throws Exception{
        HashMap<String,String> resultMap = new HashMap<String, String>();
        //获取用户当前密码
        String password = ((UserInfo)session.getAttribute("userInfo")).getPassword();
        //获取用户id
        int userId = ((UserInfo)session.getAttribute("userInfo")).getId();
        if (password.equals(oldpwd)){//判断密码是否相等
            //修改密码
            int res = userDoService.updatePassword(userId,newpwd);
            if (res > 0) {
                //修改成功
                resultMap.put("updateResult","true");
                //删除session，让用户重新登录
                session.removeAttribute("userInfo");
            }
            else {
                //修改失败
                resultMap.put("updateResult","error");
            }
        }else {
            //原密码错误
            resultMap.put("updateResult","false");
        }
        return JSONArray.toJSONString(resultMap);
    }

    //用户下路线订单
    @RequestMapping(value = "/travel/user/order.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object addOrder(Orders order, HttpSession session) throws Exception{
        HashMap<String,String> orderResult = new HashMap<String, String>();
        UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
        //获取用户id
        Integer userId = userInfo.getId();
        String orderNum = UUID.randomUUID().toString().replace("-","");
        order.setOrderNum(orderNum);
        order.setUserId(userId);
        order.setOrderTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        int res = userDoService.addOrder(order);
        if (res > 0){
            orderResult.put("orderResult","true");
        }else {
            orderResult.put("orderResult","false");
        }
        return JSONArray.toJSONString(orderResult);
    }

    //用户查询路线订单
    @RequestMapping(value = "/travel/user/orders",method = RequestMethod.GET)
    public String findOrders(@RequestParam(value = "page",required = true,defaultValue = "1") Integer page,
                             @RequestParam(value = "size",required = true,defaultValue = "5") Integer size,
                             HttpSession session,Model model) throws Exception{
        UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
        Integer userId = userInfo.getId();
        List<Orders> orders = userDoService.findOrdersById(userId,page,size);
        PageInfo pageInfo = new PageInfo(orders);
        model.addAttribute("pageInfo",pageInfo);
        return "user_orders";

    }

    //用户发表留言
    @RequestMapping(value = "/travel/user/leaveWord.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object leaveWord(LeaveWord leaveWord,HttpSession session) throws Exception{
        HashMap<String,String> leaveWordResult = new HashMap<String, String>();
        UserInfo userInfo = (UserInfo)session.getAttribute("userInfo");
        leaveWord.setUserId(userInfo.getId());
        leaveWord.setCreateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        int res = userDoService.leaveWord(leaveWord);
        if (res > 0){
            leaveWordResult.put("leaveWordResult","true");
        }else {
            leaveWordResult.put("leaveWordResult","false");
        }
        return JSONArray.toJSONString(leaveWordResult);
    }

    //用户订酒店
    @RequestMapping(value = "/travel/user/bookHotel.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object bookHotel(BookHotel bookHotel,HttpSession session){
        HashMap<String,String> addResult = new HashMap<String, String>();
        UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
        bookHotel.setNum(UUID.randomUUID().toString().replace("-",""));
        bookHotel.setUserId(userInfo.getId());
        bookHotel.setCreateTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        int res = 0;
        try {
            res = userDoService.bookHotel(bookHotel);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }finally {
            if (res > 0){
                addResult.put("addResult","true");
            }else {
                addResult.put("addResult","false");
            }
        }
        return JSONArray.toJSONString(addResult);
    }

    //用户查询酒店订单
    @RequestMapping(value = "/travel/user/bookhotels",method = RequestMethod.GET)
    public String bookHotels(@RequestParam(value = "page",required = false,defaultValue = "1") Integer page,
                             @RequestParam(value = "size",required = false,defaultValue = "1") Integer size,
                             Model model, HttpSession session) throws Exception{
        UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
        List<BookHotel> bookHotels = userDoService.bookHotels(userInfo.getId(),page,size);
        PageInfo pageInfo = new PageInfo(bookHotels);
        model.addAttribute("pageInfo",pageInfo);
        return "user_bookhotels";
    }

    //用户进入自由行订单页面
    @RequestMapping(value = "/travel/user/addFreeWalkOrder",method = RequestMethod.GET)
    public String addFreeWalkOrderPage(@RequestParam("routeId") Integer routeId,Model model,HttpSession session) throws Exception{
        UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
        Route route = routeService.findRouteById(routeId);
        model.addAttribute("userInfo",userInfo);
        model.addAttribute("route",route);
        return "freewalk_addOrder";
    }

    //用户下自由行订单
    @RequestMapping(value = "/travel/user/addFreeWalkOrder.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object addFreeWalkOrder(Orders order,HttpSession session){
        HashMap<String,Object> addResult = new HashMap<String, Object>();
        UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
        Integer userId = userInfo.getId();
        String orderNum = UUID.randomUUID().toString().replace("-","");
        order.setOrderNum(orderNum);
        order.setUserId(userId);
        order.setOrderTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        int res = 0;
        try {
            res = userDoService.addFreeWalkOrder(order);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if (res > 0){
                //添加成功
                addResult.put("addResult","true");
                //查询刚刚创建的订单
                Orders o = null;
                try {
                    o = orderService.findOrderById(order.getId());
                } catch (Exception e) {
                    e.printStackTrace();
                }finally {
                    if (o != null){
                        //查到订单
                        addResult.put("newOrder",o);
                    }else {
                        //查询出错
                        addResult.put("newOrder","notexist");
                    }
                }
            }else {
                addResult.put("addResult","false");
            }
        }
        return JSONArray.toJSONString(addResult);
    }

}
