package com.hut.travel.service;

import com.hut.travel.pojo.Role;

import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-02-09 16:04 新建
 */
public interface RoleService {

    //查询所有用户角色
    public abstract List<Role> findAllRole() throws Exception;

    //修改角色
    public abstract int updateRole(Integer roleId, String roleDesc) throws Exception;


}
