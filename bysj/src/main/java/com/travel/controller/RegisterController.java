package com.travel.controller;

import com.alibaba.fastjson.JSONArray;
import com.travel.pojo.UserInfo;
import com.travel.service.RegisterService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-01-28 22:08 新建
 */
@Controller
public class RegisterController {

    @Resource
    private RegisterService registerService;

    //2.注册时判断用户名是否已被使用过
    @RequestMapping(value = "/register/findUsernameIsUsed.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object findUsernameIsUsed(@RequestParam("username") String username){
        HashMap<String,String> selectResult = new HashMap<String, String>();
        int res = -1;
        try {
            res = registerService.findUsernameIsUsed(username);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if (res > 0){
                //表示已经被使用过了
                selectResult.put("selectResult","false");
            }else if (res == 0){
                //表示没有被使用过
                selectResult.put("selectResult","true");
            }else {
                //表示没有执行查询，或者查询时出现异常
                selectResult.put("selectResult","error");
            }
        }
        return JSONArray.toJSONString(selectResult);
    }

    //3.注册时判断电话号码是否被使用过
    @RequestMapping(value = "/register/findPhoneNumIsUsed.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object findPhoneNumIsUsed(@RequestParam("phoneNum") String phoneNum){
        HashMap<String,String> selectResult = new HashMap<String, String>();
        int res = -1;
        try {
            res = registerService.findPhoneNumIsUsed(phoneNum);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if (res > 0){
                //表示已经被使用过了
                selectResult.put("selectResult","false");
            }else if (res == 0){
                //表示没有被使用过
                selectResult.put("selectResult","true");
            }else {
                //表示没有执行查询，或者查询时出现异常
                selectResult.put("selectResult","error");
            }
        }
        return JSONArray.toJSONString(selectResult);
    }

    //4.注册时判断电子邮箱是否被使用过
    @RequestMapping(value = "/register/findEmailIsUsed.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object findEmailIsUsed(@RequestParam("email") String email){
        HashMap<String,String> selectResult = new HashMap<String, String>();
        int res = -1;
        try {
            res = registerService.findEmailIsUsed(email);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            if (res > 0){
                //表示已经被使用过了
                selectResult.put("selectResult","false");
            }else if (res == 0){
                //表示没有被使用过
                selectResult.put("selectResult","true");
            }else {
                //表示没有执行查询，或者查询时出现异常
                selectResult.put("selectResult","error");
            }
        }
        return JSONArray.toJSONString(selectResult);
    }

    //5.用户执行注册操作
    @RequestMapping(value = "/register.do",method = RequestMethod.POST)
    @ResponseBody
    public Object doRegister(UserInfo userInfo, Model model){
        HashMap<String,String> registerResult = new HashMap<String, String>();
        int res = 0;
        try {
            res = registerService.register(userInfo);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (res > 0){
                //注册成功
                registerResult.put("registerResult","true");
            }else {
                //注册失败
                registerResult.put("registerResult","false");
            }
        }
        return JSONArray.toJSONString(registerResult);
    }

}
