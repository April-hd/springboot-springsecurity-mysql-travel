package com.travel.service.impl;

import com.github.pagehelper.PageHelper;
import com.travel.dao.UserInfoDao;
import com.travel.pojo.Role;
import com.travel.pojo.UserInfo;
import com.travel.service.UserInfoService;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-01-28 20:05 新建
 */
@Service
public class UserInfoServiceImpl implements UserInfoService {

    @Resource
    private UserInfoDao userInfoDao;

    //登录后台管理系统SpringSecurity一定会调用的方法
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserInfo userInfo = userInfoDao.findUserByUsername(username);
        if (userInfo == null){
            throw new UsernameNotFoundException("用户不存在");
        }
        UserDetails userDetails = new User(userInfo.getUsername(),"{noop}"+userInfo.getPassword(),userInfo.getStatus()==0?false:true,true,true,true,getAuthority(userInfo.getRoles()));
        return userDetails;
    }

    public List<SimpleGrantedAuthority> getAuthority(List<Role> roles){
        List<SimpleGrantedAuthority> list = new ArrayList<SimpleGrantedAuthority>();
        for (Role role : roles){
            list.add(new SimpleGrantedAuthority("ROLE_"+role.getRoleName()));
        }
        return list;
    }

    //用户登录旅游网站查询用户名密码是否正确
    @Override
    public UserInfo findUser(String username,String password) throws Exception {
        return userInfoDao.findUser(username,password);
    }

    //根据用户名查询用户
    @Override
    public UserInfo findByUsername(String username) {
        return userInfoDao.findByUsername(username);
    }

    //根据id查询用户
    @Override
    public UserInfo findByUserId(Integer userId) throws Exception {
        return userInfoDao.findByUserId(userId);
    }


    //查询全部用户信息
    @Override
    public List<UserInfo> findAllUser(Integer page,Integer size) throws Exception {
        PageHelper.startPage(page,size);
        return userInfoDao.findAllUser();
    }

    //禁用用户
    @Override
    public int forbidById(Integer id) throws Exception {
        return userInfoDao.forbidById(id);
    }

    //启用用户
    @Override
    public int openById(Integer id) throws Exception {
        return userInfoDao.openById(id);
    }

    //查询当前用户没有的角色
    @Override
    public List<Role> findOtherRoles(Integer userId) throws Exception {
        return userInfoDao.findOtherRoles(userId);
    }

    //为当前用户赋予新角色
    @Override
    public void addRoleToUser(Integer userId, Integer[] roleIds) throws Exception {
        for (Integer roleId : roleIds) {
            userInfoDao.addRoleToUser(userId,roleId);
        }
    }

    //修改用户信息
    @Override
    public int updateUserInfo(Integer userId, String phoneNum, String email) throws Exception {
        return userInfoDao.updateUserInfo(userId,phoneNum,email);
    }

    //修改用户信息时判断电话号，是否已被使用过
    @Override
    public int findPhoneNumIsUsed(Integer userId, String phoneNum) throws Exception {
        return userInfoDao.findPhoneNumIdUsed(userId,phoneNum);
    }

    //修改用户信息时判断电子邮箱，是否已被使用过
    @Override
    public int findEmailIsUsed(Integer userId, String email) throws Exception {
        return userInfoDao.findEmailIsUsed(userId,email);
    }

    //根据传过来的用户名，电话号码，电子邮箱进行模糊查询
    @Override
    public List<UserInfo> fuzzyQuery(String userName, String phoneNum, String emial) throws Exception {
        return userInfoDao.fuzzyQuery(userName,phoneNum,emial);
    }

}
