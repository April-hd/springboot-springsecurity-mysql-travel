package com.hut.travel.service.impl;

import com.github.pagehelper.PageHelper;
import com.hut.travel.dao.CarouselDao;
import com.hut.travel.pojo.Carousel;
import com.hut.travel.service.CarouselService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-21 21:41 新建
 */
@Service
public class CarouselServiceImpl implements CarouselService {

    @Resource
    private CarouselDao carouselDao;

    //网站首页十道背景图
    @Override
    public List<Carousel> findTenBackground() throws Exception {
        return carouselDao.findTenBackground();
    }

    //后台查询所有网站首页轮播图
    @Override
    public List<Carousel> findAllCarousel(Integer page,Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return carouselDao.findAllCarousel();
    }

    //根据中文名模糊查询
    @Override
    public List<Carousel> fuzzyQuery(String chinese) throws Exception {
        return carouselDao.fuzzyQuery(chinese);
    }

    //添加新轮播图
    @Override
    public int addCarousel(Carousel carousel) throws Exception {
        return carouselDao.addCarousel(carousel);
    }

    //根据id删除轮播图
    @Override
    public int deleteCarousel(Integer carouselId) throws Exception {
        return carouselDao.deleteCarousel(carouselId);
    }

    //修改轮播图信息
    @Override
    public int updateCarousel(Carousel carousel) throws Exception {
        return carouselDao.updateCarousel(carousel);
    }

}
