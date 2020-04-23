package com.travel.service.impl;

import com.github.pagehelper.PageHelper;
import com.travel.dao.OrderDao;
import com.travel.pojo.Orders;
import com.travel.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-10 10:38 新建
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Resource
    private OrderDao orderDao;

    //查询所有订单
    @Override
    public List<Orders> findAll(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return orderDao.findAll();
    }

    //根据用户id查询用户所有订单
    @Override
    public List<Orders> findOrdersByUserId(Integer userId) throws Exception {
        return orderDao.findOrdersByUserId(userId);
    }

    //根据传过来的订单编号来进行模糊查询
    @Override
    public List<Orders> fuzzyQuery(String orderNum) throws Exception {
        return orderDao.fuzzyQuery(orderNum);
    }

    //查询刚刚创建的订单
    @Override
    public Orders findOrderById(Integer id) throws Exception {
        return orderDao.findOrderById(id);
    }

}
