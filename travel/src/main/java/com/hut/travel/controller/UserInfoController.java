package com.hut.travel.controller;

import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import com.hut.travel.pojo.Orders;
import com.hut.travel.pojo.Role;
import com.hut.travel.pojo.UserInfo;
import com.hut.travel.service.OrderService;
import com.hut.travel.service.UserDoService;
import com.hut.travel.service.UserInfoService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-02-04 13:27 新建
 */
@Controller
public class UserInfoController {

    @Resource
    private UserInfoService userInfoService;

    @Resource
    private OrderService orderService;

    //查询用户全部信息
    @RequestMapping(value = "/manage/user/findAllUser",method = RequestMethod.GET)
    public String findAllUser(@RequestParam(value = "page",required = false,defaultValue = "1") Integer page,
                              @RequestParam(value = "size",required = false,defaultValue = "10") Integer size,
                              Model model) throws Exception{
        List<UserInfo> userInfos = userInfoService.findAllUser(page,size);
        PageInfo pageInfo = new PageInfo(userInfos);
        model.addAttribute("pageInfo",pageInfo);
        return "user_list";
    }

    //根据传过来的用户名，电话号码，电子邮箱进行模糊查询
    @RequestMapping(value = "/manage/user/fuzzyQuery",method = RequestMethod.GET)
    public String fuzzyQuery(@RequestParam(value = "userName",required = false,defaultValue = "") String userName,
                             @RequestParam(value = "phoneNum",required = false,defaultValue = "") String phoneNum,
                             @RequestParam(value = "email",required = false,defaultValue = "") String emial,
                             Model model) throws Exception{
        List<UserInfo> userInfos = userInfoService.fuzzyQuery(userName,phoneNum,emial);
        model.addAttribute("userInfos",userInfos);
        return "user_list";
    }

    //查询用户详情
    @RequestMapping(value = "/manage/user/findDetailsById",method = RequestMethod.GET)
    public String findDetailsById(@RequestParam(value = "id") Integer userId, Model model) throws Exception{
        UserInfo userInfo = userInfoService.findByUserId(userId);
        List<Orders> orders = orderService.findOrdersByUserId(userId);
        model.addAttribute("orders",orders);
        model.addAttribute("userInfo",userInfo);
        return "user_detail";
    }

    //查询用户可以添加的角色
    //1.前往添加角色页面
    @RequestMapping(value = "/manage/user/findUserByIdAndAllRole",method = RequestMethod.GET)
    public String findUserByIdAndAllRole(@RequestParam(value = "id") Integer userId,Model model) throws Exception{
        UserInfo userInfo = userInfoService.findByUserId(userId);
        List<Role> roles = userInfoService.findOtherRoles(userId);
        if (roles.size() > 0){
            model.addAttribute("roles",roles);
        }else {
            model.addAttribute("roles",null);
        }
        model.addAttribute("userInfo",userInfo);
        return "user_role_add";
    }
    //2.执行添加角色操作
    @RequestMapping(value = "/manage/user/addRoleToUser",method = RequestMethod.POST)
    public String addRoleToUser(@RequestParam("userId") Integer userId,
                                @RequestParam("ids") Integer[] roleIds) throws Exception{
        userInfoService.addRoleToUser(userId,roleIds);
        return "redirect:findUserByIdAndAllRole?id=" + userId;
    }

    //禁用用户
    @RequestMapping(value = "/manage/user/forbidById.json",method = RequestMethod.GET)
    @ResponseBody
    public Object forbidById(@RequestParam("id") Integer id) throws Exception{
        HashMap<String,String> forbidResult = new HashMap<String, String>();
        int res = 0;
        try {
            res = userInfoService.forbidById(id);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        if (res > 0){
            forbidResult.put("forbidResult","true");
        }else {
            forbidResult.put("forbidResult","false");
        }
        return JSONArray.toJSONString(forbidResult);
    }

    //启用用户
    @RequestMapping(value = "/manage/user/openById.json",method = RequestMethod.GET)
    @ResponseBody
    public String openById(@RequestParam("id") Integer id) throws Exception{
        HashMap<String,String> openResult = new HashMap<String, String>();
        int res = 0;
        try {
            res = userInfoService.openById(id);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        if (res > 0){
            openResult.put("openResult","true");
        }else {
            openResult.put("openResult","false");
        }
        return JSONArray.toJSONString(openResult);
    }

    //修改用户信息
    @RequestMapping(value = "/manage/user/updateUserInfo.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object updateUserInfo(@RequestParam("userId") Integer userId,
                                 @RequestParam("phoneNum") String phoneNum,
                                 @RequestParam("email") String email){
        HashMap<String,String> updateResult = new HashMap<String, String>();
        int res = 0;
        try {
            res = userInfoService.updateUserInfo(userId,phoneNum,email);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        if (res > 0){
            updateResult.put("updateResult","true");
        }else {
            updateResult.put("updateResult","false");
        }
        return JSONArray.toJSONString(updateResult);
    }

    //修改用户信息时判断电话号，是否已被使用过
    @RequestMapping(value = "/manage/user/findPhoneNumIsUsed.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object findPhoneNumIsUsed(@RequestParam("userId") Integer userId,
                                     @RequestParam("phoneNum") String phoneNum){
        HashMap<String,String> selectResult = new HashMap<String, String>();
        int res = 0;
        try {
            res = userInfoService.findPhoneNumIsUsed(userId,phoneNum);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (res > 0){
                //个数大于0表示该电话号码已经被使用过，返回false
                selectResult.put("selectResult","false");
            }else {
                //个数等于0表示该电话号码未被他人使用过，返回true
                selectResult.put("selectResult","true");
            }
        }
        return JSONArray.toJSONString(selectResult);
    }


    //修改用户信息时判断电子邮箱，是否已被使用过
    @RequestMapping(value = "/manage/user/findEmailIsUsed.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object findEmailIsUsed(@RequestParam("userId") Integer userId,
                                  @RequestParam("email") String email){
        HashMap<String,String> selectResult = new HashMap<String, String>();
        int res = 0;
        try {
            res = userInfoService.findEmailIsUsed(userId,email);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            if (res > 0){
                //个数大于0表示该电子邮箱已经被使用过，返回false
                selectResult.put("selectResult","false");
            }else {
                //个数等于0表示该电子邮箱已经被使用过，返回false
                selectResult.put("selectResult","true");
            }
        }
        return JSONArray.toJSONString(selectResult);
    }

}
