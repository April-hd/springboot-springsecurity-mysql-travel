package com.hut.travel.pojo;

/**
 * 类说明
 * 留言
 * @author 茶茶
 * @date 2020-03-07 17:27 新建
 */
public class LeaveWord {

    private Integer id;//id自增
    private Integer routeId;//路线id
    private Integer userId;//用户id
    private String txt;//留言内容
    private String createTime;//留言时间

    private Route route;//路线详情
    private UserInfo userInfo;//用户详情

    public Route getRoute() {
        return route;
    }

    public void setRoute(Route route) {
        this.route = route;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRouteId() {
        return routeId;
    }

    public void setRouteId(Integer routeId) {
        this.routeId = routeId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getTxt() {
        return txt;
    }

    public void setTxt(String txt) {
        this.txt = txt;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }
}
