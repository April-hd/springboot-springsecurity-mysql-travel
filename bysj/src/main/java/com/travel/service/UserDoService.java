package com.travel.service;

import com.travel.pojo.BookHotel;
import com.travel.pojo.LeaveWord;
import com.travel.pojo.Orders;

import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-02-22 20:14 新建
 */
public interface UserDoService {

    //用户完善个人信息
    public abstract int perfect(Integer id, Integer gender, String intro, String website) throws Exception;

    //用户修改个人密码
    public abstract int updatePassword(int userId, String newpwd) throws Exception;

    //用户添加订单
    public abstract int addOrder(Orders order) throws Exception;

    //用户查询自己所有订单
    public abstract List<Orders> findOrdersById(Integer userId, Integer page, Integer size) throws Exception;

    //用户留言
    public abstract int leaveWord(LeaveWord leaveWord) throws Exception;

    //用户修改头像
    public abstract int updateHeaderImg(Integer userId, String sqlFilename) throws Exception;

    //用户订酒店
    public abstract int bookHotel(BookHotel bookHotel) throws Exception;

    //用户查询酒店订单
    public abstract List<BookHotel> bookHotels(Integer userId, Integer page, Integer size) throws Exception;

    //用户下自由行订单
    public abstract int addFreeWalkOrder(Orders order) throws Exception;
}
