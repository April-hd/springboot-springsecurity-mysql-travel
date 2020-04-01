package com.hut.travel.service.impl;

import com.github.pagehelper.PageHelper;
import com.hut.travel.dao.BookHotelDao;
import com.hut.travel.pojo.BookHotel;
import com.hut.travel.service.BookHotelService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-26 17:41 新建
 */
@Service
public class BookHotelServiceImpl implements BookHotelService {

    @Resource
    private BookHotelDao bookHotelDao;

    //后台查询所有酒店订单
    @Override
    public List<BookHotel> findAllBookHotel(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return bookHotelDao.findAllBookHotel();
    }

    //根据订单编号查询订单
    @Override
    public List<BookHotel> fuzzyQuery(String bookHotelNum) throws Exception {
        return bookHotelDao.fuzzyQuery(bookHotelNum);
    }

}
