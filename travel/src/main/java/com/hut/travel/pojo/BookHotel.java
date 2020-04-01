package com.hut.travel.pojo;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-26 14:49 新建
 */
public class BookHotel {

    private Integer id;
    private String num;
    private Integer userId;
    private Integer hotelId;
    private String liveTime;
    private String leaveTime;
    private Integer peopleCount;
    private Double price;
    private Integer status;
    private Integer payType;
    private String createTime;

    private UserInfo userInfo;
    private Hotel hotel;

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public Hotel getHotel() {
        return hotel;
    }

    public void setHotel(Hotel hotel) {
        this.hotel = hotel;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getHotelId() {
        return hotelId;
    }

    public void setHotelId(Integer hotelId) {
        this.hotelId = hotelId;
    }

    public String getLiveTime() {
        return liveTime;
    }

    public void setLiveTime(String liveTime) {
        this.liveTime = liveTime;
    }

    public String getLeaveTime() {
        return leaveTime;
    }

    public void setLeaveTime(String leaveTime) {
        this.leaveTime = leaveTime;
    }

    public Integer getPeopleCount() {
        return peopleCount;
    }

    public void setPeopleCount(Integer peopleCount) {
        this.peopleCount = peopleCount;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "BookHotel{" +
                "id=" + id +
                ", num='" + num + '\'' +
                ", userId=" + userId +
                ", hotelId=" + hotelId +
                ", liveTime='" + liveTime + '\'' +
                ", leaveTime='" + leaveTime + '\'' +
                ", peopleCount=" + peopleCount +
                ", price=" + price +
                ", status=" + status +
                ", payType=" + payType +
                ", createTime='" + createTime + '\'' +
                '}';
    }
}
