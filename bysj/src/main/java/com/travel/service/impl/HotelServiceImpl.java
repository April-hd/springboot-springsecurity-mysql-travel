package com.travel.service.impl;

import com.github.pagehelper.PageHelper;
import com.travel.dao.HotelDao;
import com.travel.pojo.Hotel;
import com.travel.service.HotelService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-24 18:02 新建
 */
@Service
public class HotelServiceImpl implements HotelService {

    @Resource
    private HotelDao hotelDao;

    //后台查询所有酒店
    @Override
    public List<Hotel> findAllHotel(Integer page, Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return hotelDao.findAllHotel();
    }

    //根据酒店名模糊查询
    @Override
    public List<Hotel> fuzzyQuery(String hName) throws Exception {
        return hotelDao.fuzzyQuery(hName);
    }

    //添加新酒店
    @Override
    public int addHotel(Hotel hotel) throws Exception {
        return hotelDao.addHotel(hotel);
    }

    //根据id删除酒店
    @Override
    public int deleteHotel(Integer hotelId) throws Exception {
        return hotelDao.deleteHotel(hotelId);
    }

    //修改酒店信息
    @Override
    public int updateHotel(Hotel hotel) throws Exception {
        return hotelDao.updateHotel(hotel);
    }

    //根据destId查询酒店
    @Override
    public List<Hotel> findHotelsByDestId(Integer destId) throws Exception {
        return hotelDao.findHotelsByDestId(destId);
    }

}
