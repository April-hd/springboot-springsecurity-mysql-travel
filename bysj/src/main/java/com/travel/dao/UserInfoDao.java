package com.travel.dao;

import com.travel.pojo.Role;
import com.travel.pojo.UserInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-01-28 23:27 新建
 */
@Mapper
public interface UserInfoDao {

    //loadUserByUsername里查询用户信息以及权限的方法，后台管理系统登录
    @Select("select * from user where username=#{username}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "password",column = "password"),
            @Result(property = "phoneNum",column = "email"),
            @Result(property = "email",column = "email"),
            @Result(property = "status",column = "status"),
            @Result(property = "roles",column = "id",javaType = List.class,many = @Many(select = "com.travel.dao.RoleDao.findRoleByUserId"))
    })
    public UserInfo findUserByUsername(String Username);

    //MyAuthenticationSuccessHandler登录成功处理器查询用户信息
    @Select("select * from user where username=#{username}")
    public UserInfo findByUsername(String Username);

    //前台旅游网站登录
    @Select("select * from user where username=#{username} and password=#{password}")
    public UserInfo findUser(@Param("username") String Username, @Param("password") String Password) throws Exception;

    //根据用户id查询用户信息
    @Select("select * from user where id=#{userId}")
    @Results({
            @Result(id = true,property = "id",column = "id"),
            @Result(property = "username",column = "username"),
            @Result(property = "password",column = "password"),
            @Result(property = "phoneNum",column = "phoneNum"),
            @Result(property = "email",column = "email"),
            @Result(property = "status",column = "status"),
            @Result(property = "roles",column = "id",javaType = List.class,many = @Many(select = "com.travel.dao.RoleDao.findRoleByUserId"))
    })
    public abstract UserInfo findByUserId(Integer userId) throws Exception;

    //查询全部用户信息
    @Select("select * from user")
    public abstract List<UserInfo> findAllUser() throws Exception;

    //禁用用户
    @Update("update user set status=0 where id=#{id}")
    public abstract int forbidById(Integer id) throws Exception;

    //启用用户
    @Update("update user set status=1 where id=#{id}")
    public abstract int openById(Integer id) throws Exception;

    //查询当前用户没有的角色
    @Select("SELECT * FROM role WHERE id NOT IN(SELECT roleId FROM user_role WHERE userId = #{userId})")
    public abstract List<Role> findOtherRoles(Integer userId) throws Exception;

    //为当前用户赋予新角色
    @Insert("insert into user_role values (#{userId},#{roleId})")
    public abstract void addRoleToUser(@Param("userId") Integer userId, @Param("roleId") Integer roleId) throws Exception;

    //修改用户信息
    @Update("update user set phoneNum=#{phoneNum},email=#{email} where id=#{userId}")
    public abstract int updateUserInfo(@Param("userId") Integer userId, @Param("phoneNum") String phoneNum, @Param("email") String email) throws Exception;

    //修改用户信息时判断电话号，除了本账号外是否已被使用过
    @Select("select count(*) from user where phoneNum=#{phoneNum} and id!=#{userId}")
    public abstract int findPhoneNumIdUsed(@Param("userId") Integer userId, @Param("phoneNum") String phoneNum) throws Exception;

    //修改用户信息时判断电子邮箱，是否已被使用过
    @Select("select count(*) from user where email=#{email} and id!=#{userId}")
    public abstract int findEmailIsUsed(@Param("userId") Integer userId, @Param("email") String email) throws Exception;

    //根据传过来的用户名，电话号码，电子邮箱进行模糊查询
    @Select("select * from user where userName like CONCAT(CONCAT('%',#{userName},'%')) and phoneNum like CONCAT(CONCAT('%',#{phoneNum},'%')) and email like CONCAT(CONCAT('%',#{email},'%'))")
    public abstract List<UserInfo> fuzzyQuery(@Param("userName") String userName, @Param("phoneNum") String phoneNum, @Param("email") String emial) throws Exception;
}
