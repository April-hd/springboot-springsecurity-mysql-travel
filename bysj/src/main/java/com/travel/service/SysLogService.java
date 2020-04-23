package com.travel.service;

import com.travel.pojo.SysLog;
import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-28 14:46 新建
 */
public interface SysLogService {

    //保存日志信息
    public abstract void addLog(SysLog sysLog) throws Exception;

    //后台查找所有的日志
    public abstract List<SysLog> findAll(Integer page, Integer size) throws Exception;

}
