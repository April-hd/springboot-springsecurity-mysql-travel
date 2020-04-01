package com.hut.travel.controller;

import com.alibaba.fastjson.JSONArray;
import com.hut.travel.pojo.Route;
import com.hut.travel.service.FreeWalkService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-29 12:09 新建
 */
@Controller
public class FreeWalkController {

    @Resource
    private FreeWalkService freeWalkService;

    //进入自由行主页
    @RequestMapping(value = "/travel/freewalk/main",method = RequestMethod.GET)
    public String freewalkMain(){
        return "freewalk";
    }

    //模糊查询自由行用户填写的数据
    @RequestMapping(value = "/travel/freeWalk/fuzzyQuery.ajax",method = RequestMethod.POST)
    @ResponseBody
    public Object fuzzyQuery(@RequestParam("month") String month,
                             @RequestParam("price") String price,
                             @RequestParam("day") String day,
                             @RequestParam("dest") String dest) throws Exception{
        Integer minPrice = 0;
        Integer maxPrice = 0;
        if (price != null && price != ""){
            String[] splits = price.split("-");//拆分价格
            minPrice = Integer.parseInt(splits[0]);//获取最小价格，转成数值型
            maxPrice = Integer.parseInt(splits[1]);//获取最大价格，转成数值型
        }else {
            minPrice = 0;
            maxPrice = 99999;
        }
        Integer minDay = 0;
        Integer maxDay = 0;
        if (day != null && day != ""){
            String[] splits = day.split("-");//拆分天数
            minDay = Integer.parseInt(splits[0]);//获取最小天数，转成数值型
            maxDay = Integer.parseInt(splits[1]);//获取最大天数，转成数值型
        }else {
            minDay = 0;
            maxDay = 365;
        }
        List<Route> routes = freeWalkService.fuzzyQuery(month,minPrice,maxPrice,minDay,maxDay,dest);
        return JSONArray.toJSONString(routes);
    }

}
