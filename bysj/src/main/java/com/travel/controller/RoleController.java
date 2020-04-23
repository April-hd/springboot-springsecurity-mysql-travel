package com.travel.controller;

import com.alibaba.fastjson.JSONArray;
import com.travel.pojo.Role;
import com.travel.service.RoleService;
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
 * @date 2020-02-09 16:00 新建
 */
@Controller
public class RoleController {

    @Resource
    private RoleService roleService;

    //查找所有的角色
    @RequestMapping(value = "/manage/role/findAllRole",method = RequestMethod.GET)
    public String findAllRole(Model model) throws Exception{
        List<Role> roles = roleService.findAllRole();
        model.addAttribute("roles",roles);
        return "role_list";
    }

    //修改角色信息
    @RequestMapping(value = "/manage/role/updateRole.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object updateRole(@RequestParam("roleId") Integer roleId,
                             @RequestParam("roleDesc") String roleDesc){
        HashMap<String, String> updateResult = new HashMap<String, String>();
        int res = 0;
        try {
            res = roleService.updateRole(roleId,roleDesc);
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

}
