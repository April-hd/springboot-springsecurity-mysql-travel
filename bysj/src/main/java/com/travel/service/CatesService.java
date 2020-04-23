package com.travel.service;

import com.travel.pojo.Cates;

import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-02-01 13:58 新建
 */
public interface CatesService {

    //根据目的地id查询该目的地所有美食店
    public abstract List<Cates> findCatesByDestId(Integer destId) throws Exception;

    //查询所有美食店
    public List<Cates> findAllCate(Integer page, Integer size) throws Exception;

    //修改美食店信息
    public abstract int updateCate(Cates cate) throws Exception;

    //查看美食店名是否已经被使用过了
    public abstract int findCNameIsUsed(Integer cId, String cName) throws Exception;

    //根据传过来的美食店名进行模糊查询
    public abstract List<Cates> fuzzyQuery(String cName) throws Exception;

    //添加新美食店时查看新名字是否被使用过
    public abstract int findNewCateNameIsUsed(String cateName) throws Exception;

    //执行添加美食店操作
    public abstract int addCate(Cates cate) throws Exception;

    //根据id删除美食店
    public abstract int deleteCate(Integer cateId) throws Exception;

    //网站首页查询所有店铺
    public abstract List<Cates> findAll() throws Exception;
}
