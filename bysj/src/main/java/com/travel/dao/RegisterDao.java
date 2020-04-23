package com.travel.dao;

import com.travel.pojo.UserInfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-01-28 22:52 新建
 */
@Mapper
public interface RegisterDao {

    //注册
    @Insert("insert into user(username,password,phoneNum,email,status) values(#{username},#{password},#{phoneNum},#{email},1)")
    public abstract int register(UserInfo userInfo) throws Exception;

    //注册时判断用户名是否已被使用过
    @Select("select count(*) from user where username=#{username}")
    public abstract int findUsernameIsUsed(String username) throws Exception;

    //注册时判断电话号码是否被使用过
    @Select("select count(*) from user where phoneNum=#{phoneNum}")
    public abstract int findPhoneNumIsUsed(String phoneNum) throws Exception;

    //注册时判断电子邮箱是否被使用过
    @Select("select count(*) from user where email=#{email}")
    public abstract int findEmailIsUsed(String email) throws Exception;
}
