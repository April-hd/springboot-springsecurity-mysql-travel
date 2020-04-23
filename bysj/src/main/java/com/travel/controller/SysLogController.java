package com.travel.controller;

import com.github.pagehelper.PageInfo;
import com.travel.pojo.SysLog;
import com.travel.service.SysLogService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-28 14:45 新建
 */
@Controller
public class SysLogController {

    @Resource
    private SysLogService sysLogService;

    //后台查找所有的日志
    @RequestMapping(value = "/manage/syslog/findAll",method = RequestMethod.GET)
    public String findAll(@RequestParam(value = "page",required = false,defaultValue = "1") Integer page,
                          @RequestParam(value = "size",required = false,defaultValue = "10") Integer size,
                          Model model) throws Exception{
        List<SysLog> sysLogs = sysLogService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(sysLogs);
        model.addAttribute("pageInfo",pageInfo);
        return "syslog_list";
    }

}
