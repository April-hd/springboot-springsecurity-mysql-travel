package com.hut.travel.service.impl;

import com.github.pagehelper.PageHelper;
import com.hut.travel.dao.SysLogDao;
import com.hut.travel.pojo.SysLog;
import com.hut.travel.service.SysLogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-28 14:46 新建
 */
@Service
public class SysLogServiceImpl implements SysLogService {

    @Resource
    private SysLogDao sysLogDao;

    //保存日志信息
    @Override
    public void addLog(SysLog sysLog) throws Exception {
        sysLogDao.addLog(sysLog);
    }

    //后台查找所有的日志
    @Override
    public List<SysLog> findAll(Integer page,Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return sysLogDao.findAll();
    }

}
