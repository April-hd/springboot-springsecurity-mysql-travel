package com.hut.travel.pojo;

import java.util.List;

/**
 * 类说明
 * 旅游路线
 * @author 茶茶
 * @date 2020-02-25 13:02 新建
 */
public class Route {

    private Integer id;//路线id
    private String num;//路线编号
    private String name;//路线名称
    private Double price;//路线价格
    private Integer time;//路线持续时间
    private String season;//路线季节
    private String routeDesc;//路线描述
    private Integer heat;//路线热度
    private Integer status;//路线是否开启，1为开启，0为关闭
    private String url;//热门排行耪
    private String href;//路线链接

    private List<RoutePhoto> routePhotoList;//路线图片资源

    public List<RoutePhoto> getRoutePhotoList() {
        return routePhotoList;
    }

    public void setRoutePhotoList(List<RoutePhoto> routePhotoList) {
        this.routePhotoList = routePhotoList;
    }

    public Integer getHeat() {
        return heat;
    }

    public void setHeat(Integer heat) {
        this.heat = heat;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Integer getTime() {
        return time;
    }

    public void setTime(Integer time) {
        this.time = time;
    }

    public String getSeason() {
        return season;
    }

    public void setSeason(String season) {
        this.season = season;
    }

    public String getRouteDesc() {
        return routeDesc;
    }

    public void setRouteDesc(String routeDesc) {
        this.routeDesc = routeDesc;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Route{" +
                "id=" + id +
                ", num='" + num + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", time=" + time +
                ", season='" + season + '\'' +
                ", routeDesc='" + routeDesc + '\'' +
                ", status=" + status +
                '}';
    }

}
