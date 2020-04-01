package com.hut.travel.controller;

import com.github.pagehelper.PageInfo;
import com.hut.travel.pojo.Orders;
import com.hut.travel.service.OrderService;
import com.hut.travel.service.UserDoService;
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
 * @date 2020-03-10 10:29 新建
 */
@Controller
public class OrderController {

    @Resource
    private OrderService orderService;

    //查询所有路线订单
    @RequestMapping("/manage/order/findAllOrder")
    public String findAll(@RequestParam(value = "page",required = false,defaultValue = "1") Integer page,
                          @RequestParam(value = "size",required = false,defaultValue = "10") Integer size,
                          Model model) throws Exception{
        List<Orders> orders = orderService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(orders);
        model.addAttribute("pageInfo",pageInfo);
        return "order_list";
    }

    //根据传过来的订单编号来进行模糊查询
    @RequestMapping(value = "/manage/order/fuzzyQuery",method = RequestMethod.GET)
    public String fuzzyQuery(@RequestParam("orderNum") String orderNum, Model model) throws Exception{
        List<Orders> orders = orderService.fuzzyQuery(orderNum);
        model.addAttribute("orders",orders);
        return "order_list";
    }

}
