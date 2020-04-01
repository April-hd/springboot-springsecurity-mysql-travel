package com.hut.travel.service;

import com.hut.travel.pojo.Role;
import com.hut.travel.pojo.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-01-28 20:04 新建
 */
public interface UserInfoService extends UserDetailsService {

    //后台用户登录
    public UserInfo findByUsername(String username);

    //前台用户登录
    public UserInfo findUser(String username,String password) throws Exception;

    //查询全部用户信息
    public List<UserInfo> findAllUser(Integer page,Integer size) throws Exception;

    //禁用用户
    public int forbidById(Integer id) throws Exception;

    //启用用户
    public int openById(Integer id) throws Exception;

    //根据id查询用户
    public abstract UserInfo findByUserId(Integer userId) throws Exception;

    //查询当前用户没有的角色
    public abstract List<Role> findOtherRoles(Integer userId) throws Exception;

    //为当前用户添加新角色
    public abstract void addRoleToUser(Integer userId, Integer[] roleIds) throws Exception;

    //修改用户信息
    public abstract int updateUserInfo(Integer userId, String phoneNum, String email) throws Exception;

    //修改用户信息时判断电话号，是否已被使用过
    public abstract int findPhoneNumIsUsed(Integer userId, String phoneNum) throws Exception;

    //修改用户信息时判断电子邮箱，是否已被使用过
    public abstract int findEmailIsUsed(Integer userId, String email) throws Exception;

    //根据传过来的用户名，电话号码，电子邮箱进行模糊查询
    public abstract List<UserInfo> fuzzyQuery(String userName, String phoneNum, String emial) throws Exception;
}
