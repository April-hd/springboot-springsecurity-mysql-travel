package com.travel.pojo;

/**
 * 类说明
 * 订单表
 * @author 茶茶
 * @date 2020-03-03 19:49 新建
 */
public class Orders {

    private Integer id;//订单id
    private String orderNum;//订单编号
    private Integer routeId;//路线id
    private Integer userId;//用户id
    private String orderTime;//下单时间
    private String reserveTime;//预定时间
    private Integer adult;//成年人数
    private Integer child;//儿童人数
    private Double totalPrice;//订单总价
    private Integer orderStatus;//订单状态，0为未支付，1为支付
    private Integer payType;//支付方式，0为微信支付，1为支付宝支付

    private UserInfo userInfo;//下单人详情
    private Route route;//路线详情

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public Route getRoute() {
        return route;
    }

    public void setRoute(Route route) {
        this.route = route;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
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

    public String getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(String orderTime) {
        this.orderTime = orderTime;
    }

    public String getReserveTime() {
        return reserveTime;
    }

    public void setReserveTime(String reserveTime) {
        this.reserveTime = reserveTime;
    }

    public Integer getAdult() {
        return adult;
    }

    public void setAdult(Integer adult) {
        this.adult = adult;
    }

    public Integer getChild() {
        return child;
    }

    public void setChild(Integer child) {
        this.child = child;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }

    @Override
    public String toString() {
        return "Orders{" +
                "id=" + id +
                ", orderNum='" + orderNum + '\'' +
                ", routeId=" + routeId +
                ", userId=" + userId +
                ", orderTime='" + orderTime + '\'' +
                ", reserveTime='" + reserveTime + '\'' +
                ", adult=" + adult +
                ", child=" + child +
                ", totalPrice=" + totalPrice +
                ", orderStatus=" + orderStatus +
                ", payType=" + payType +
                ", route=" + route +
                '}';
    }

}
