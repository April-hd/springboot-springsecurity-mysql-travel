package com.hut.travel.pojo;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-01-30 15:22 新建
 */
public class Role {

    private Integer id;//角色id自增
    private String roleName;//角色名称
    private String roleDesc;//角色描述

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleDesc() {
        return roleDesc;
    }

    public void setRoleDesc(String roleDesc) {
        this.roleDesc = roleDesc;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", roleName='" + roleName + '\'' +
                ", roleDesc='" + roleDesc + '\'' +
                '}';
    }

}
