package com.hut.travel.service.impl;

import com.github.pagehelper.PageHelper;
import com.hut.travel.dao.UserDoDao;
import com.hut.travel.pojo.BookHotel;
import com.hut.travel.pojo.LeaveWord;
import com.hut.travel.pojo.Orders;
import com.hut.travel.service.UserDoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-02-22 20:12 新建
 */
@Service
public class UserDoServiceImpl implements UserDoService {

    @Resource
    private UserDoDao userDoDao;

    //用户完善个人信息
    @Override
    public int perfect(Integer id, Integer gender, String intro, String website) throws Exception {
        return userDoDao.perfect(id,gender,intro,website);
    }

    //用户修改个人密码
    @Override
    public int updatePassword(int userId, String newpwd) throws Exception {
        return userDoDao.updatePassword(userId,newpwd);
    }

    //用户添加路线订单
    @Override
    public int addOrder(Orders order) throws Exception {
        return userDoDao.addOrder(order);
    }

    //用户查询个人所有路线订单
    @Override
    public List<Orders> findOrdersById(Integer userId,Integer page,Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return userDoDao.findOrdersById(userId);
    }

    //用户留言
    @Override
    public int leaveWord(LeaveWord leaveWord) throws Exception {
        return userDoDao.leaveWord(leaveWord);
    }

    //用户修改头像
    @Override
    public int updateHeaderImg(Integer userId, String sqlFilename) throws Exception {
        return userDoDao.updateHeaderImg(userId,sqlFilename);
    }

    //用户订酒店
    @Override
    public int bookHotel(BookHotel bookHotel) throws Exception {
        return userDoDao.bookHotel(bookHotel);
    }

    //用户查询酒店订单
    @Override
    public List<BookHotel> bookHotels(Integer userId,Integer page,Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return userDoDao.bookHotels(userId);
    }

    //用户下自由行订单
    @Override
    public int addFreeWalkOrder(Orders order) throws Exception {
        return userDoDao.addFreeWalkOrder(order);
    }

}
