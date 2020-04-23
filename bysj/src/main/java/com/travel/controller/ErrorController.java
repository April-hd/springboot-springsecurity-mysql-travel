package com.travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-09 20:17 新建
 */
@Controller
@RequestMapping("/error")
public class ErrorController {

    @RequestMapping("/400")
    public String BAD_REQUEST(){
        return "400";
    }

    @RequestMapping("/403")
    public String forbidden(){
        return "403";
    }

    @RequestMapping("/404")
    public String not_found(){
        return "404";
    }

    @RequestMapping("/405")
    public String METHOD_NOT_ALLOWED(){
        return "405";
    }

    @RequestMapping("/500")
    public String internal_server_error(){
        return "500";
    }

}
