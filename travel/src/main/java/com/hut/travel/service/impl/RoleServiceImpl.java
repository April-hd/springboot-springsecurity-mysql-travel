package com.hut.travel.service.impl;

import com.hut.travel.dao.RoleDao;
import com.hut.travel.pojo.Role;
import com.hut.travel.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-02-09 16:04 新建
 */
@Service
public class RoleServiceImpl implements RoleService {

    @Resource
    private RoleDao roleDao;

    //查找所有角色信息
    public List<Role> findAllRole() throws Exception{
        return roleDao.findAllRole();
    }

    //修改角色信息
    @Override
    public int updateRole(Integer roleId, String roleDesc) throws Exception {
        return roleDao.updateRole(roleId,roleDesc);
    }

}
