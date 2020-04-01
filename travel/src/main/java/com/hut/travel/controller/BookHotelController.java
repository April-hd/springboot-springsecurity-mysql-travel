package com.hut.travel.controller;

import com.github.pagehelper.PageInfo;
import com.hut.travel.pojo.BookHotel;
import com.hut.travel.service.BookHotelService;
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
 * @date 2020-03-26 17:39 新建
 */
@Controller
public class BookHotelController {

    @Resource
    private BookHotelService bookHotelService;

    //后台查询所有酒店订单
    @RequestMapping(value = "/manage/bookhotel/findAllBookHotel",method = RequestMethod.GET)
    public String findAllBookHotel(@RequestParam(value = "page",required = false,defaultValue = "1") Integer page,
                                   @RequestParam(value = "size",required = false,defaultValue = "10") Integer size,
                                   Model model) throws Exception{
        List<BookHotel> bookHotels = bookHotelService.findAllBookHotel(page,size);
        PageInfo pageInfo = new PageInfo(bookHotels);
        model.addAttribute("pageInfo",pageInfo);
        return "hotelbook_list";
    }

    //根据订单编号查询订单
    @RequestMapping(value = "/manage/bookhotel/fuzzyQuery",method = RequestMethod.GET)
    public String fuzzyQuery(@RequestParam("bookHotelNum") String bookHotelNum,Model model) throws Exception{
        List<BookHotel> bookHotels = bookHotelService.fuzzyQuery(bookHotelNum);
        model.addAttribute("bookHotels",bookHotels);
        return "hotelbook_list";
    }

}
