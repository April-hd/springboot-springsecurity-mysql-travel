package com.hut.travel.service.impl;

import com.hut.travel.dao.RegisterDao;
import com.hut.travel.pojo.UserInfo;
import com.hut.travel.service.RegisterService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-01-28 22:49 新建
 */
@Service
public class RegisterServiceImpl implements RegisterService {

    @Resource
    private RegisterDao registerDao;

    //用户注册
    @Override
    public int register(UserInfo userInfo) throws Exception {
        return registerDao.register(userInfo);
    }

    //注册时判断用户名是否已被使用过
    @Override
    public int findUsernameIsUsed(String username) throws Exception {
        return registerDao.findUsernameIsUsed(username);
    }

    //注册时判断电话号码是否被使用过
    @Override
    public int findPhoneNumIsUsed(String phoneNum) throws Exception {
        return registerDao.findPhoneNumIsUsed(phoneNum);
    }

    //注册时判断电子邮箱是否被使用过
    @Override
    public int findEmailIsUsed(String email) throws Exception {
        return registerDao.findEmailIsUsed(email);
    }

}
