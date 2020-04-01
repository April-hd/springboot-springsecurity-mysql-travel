package com.hut.travel.controller;

import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import com.hut.travel.pojo.LeaveWord;
import com.hut.travel.pojo.UserInfo;
import com.hut.travel.service.LeaveWordService;
import com.hut.travel.service.UserInfoService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-10 18:31 新建
 */
@Controller
public class LeaveWordController {

    @Resource
    private LeaveWordService leaveWordService;

    @Resource
    private UserInfoService userInfoService;

    //后台查询所有留言
    @RequestMapping(value = "/manage/leaveWord/findAllLeaveWord",method = RequestMethod.GET)
    public String findAllLeaveWord(@RequestParam(value = "page",required = false,defaultValue = "1") Integer page,
                                   @RequestParam(value = "size",required = false,defaultValue = "10") Integer size,
                                   Model model) throws Exception{
        List<LeaveWord> leaveWords = leaveWordService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(leaveWords);
        model.addAttribute("pageInfo",pageInfo);
        return "leaveword_list";
    }

    //根据传来的留言人和留言文本进行模糊查询
    @RequestMapping(value = "/manage/leaveword/fuzzyQuery",method = RequestMethod.GET)
    public String fuzzyQuery(@RequestParam("leaveWordName") String leaveWordName,
                             @RequestParam("leaveWordTxt") String leaveWordTxt,
                             Model model) throws Exception{
        List<LeaveWord> leaveWords = new ArrayList<LeaveWord>();
        if (leaveWordName == null || "".equals(leaveWordName)){
            leaveWords = leaveWordService.fuzzyQueryByTxt(leaveWordTxt);
            model.addAttribute("leaveWords",leaveWords);
        }else {
            UserInfo userInfo = userInfoService.findByUsername(leaveWordName);
            if (userInfo != null){
                leaveWords = leaveWordService.fuzzyQuery(userInfo.getId(),leaveWordTxt);
                model.addAttribute("leaveWords",leaveWords);
            }else {
                model.addAttribute("leaveWords",leaveWords);
            }
        }
        return "leaveword_list";
    }

    //删除留言
    @RequestMapping(value = "/manage/leaaveWord/deleteLeaaveWord.ajax",method = RequestMethod.GET)
    @ResponseBody
    public Object deleteLeaaveWord(@RequestParam("leaveWordId") Integer id){
        HashMap<String,String> delResult = new HashMap<String, String>();
        int res = 0;
        try {
            res = leaveWordService.deleteLeaaveWord(id);
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
