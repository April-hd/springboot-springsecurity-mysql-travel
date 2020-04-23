package com.travel.service.impl;

import com.github.pagehelper.PageHelper;
import com.travel.dao.CatesDao;
import com.travel.pojo.Cates;
import com.travel.service.CatesService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-02-01 13:59 新建
 */
@Service
public class CatesServiceImpl implements CatesService {

    @Resource
    private CatesDao catesDao;

    //根据目的地id查询该目的地所有美食店
    @Override
    public List<Cates> findCatesByDestId(Integer destId) throws Exception {
        return catesDao.findCatesByDestId(destId);
    }

    //查询所有美食店
    @Override
    public List<Cates> findAllCate(Integer page,Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return catesDao.findAllCate();
    }

    //修改美食店信息
    @Override
    public int updateCate(Cates cate) throws Exception {
        return catesDao.updateCate(cate);
    }

    //查看美食店名是否已经被使用过了
    @Override
    public int findCNameIsUsed(Integer cId, String cName) throws Exception {
        return catesDao.findCNameIsUsed(cId,cName);
    }

    //根据传过来的美食店名进行模糊查询
    @Override
    public List<Cates> fuzzyQuery(String cName) throws Exception {
        return catesDao.fuzzyQuery(cName);
    }

    //添加新美食店时查看新名字是否被使用过
    @Override
    public int findNewCateNameIsUsed(String cateName) throws Exception {
        return catesDao.findNewCateNameIsUsed(cateName);
    }

    //执行添加美食店操作
    @Override
    public int addCate(Cates cate) throws Exception {
        return catesDao.addCate(cate);
    }

    //根据id删除美食店
    @Override
    public int deleteCate(Integer cateId) throws Exception {
        return catesDao.deleteCate(cateId);
    }

    //网站首页查询所有店铺
    @Override
    public List<Cates> findAll() throws Exception {
        return catesDao.findAll();
    }

}
