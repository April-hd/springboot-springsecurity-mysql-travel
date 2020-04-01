package com.hut.travel.service;

import com.hut.travel.pojo.BookHotel;

import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-26 17:40 新建
 */
public interface BookHotelService {

    //后台查询所有酒店订单
    public abstract List<BookHotel> findAllBookHotel(Integer page, Integer size) throws Exception;

    //根据订单编号查询订单
    public abstract List<BookHotel> fuzzyQuery(String bookHotelNum) throws Exception;
}
