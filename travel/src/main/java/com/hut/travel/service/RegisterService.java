package com.hut.travel.service;

import com.hut.travel.pojo.UserInfo;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-01-28 22:49 新建
 */
public interface RegisterService {

    //用户注册
    public abstract int register(UserInfo userInfo) throws Exception;

    //注册时判断用户名是否已被使用过
    public abstract int findUsernameIsUsed(String username) throws Exception;

    //注册时判断电话号码是否被使用过
    public abstract int findPhoneNumIsUsed(String phoneNum) throws Exception;

    //注册时判断电子邮箱是否被使用过
    public abstract int findEmailIsUsed(String email) throws Exception;
}
