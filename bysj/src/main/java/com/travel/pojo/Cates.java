package com.travel.pojo;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-02-01 13:50 新建
 */
public class Cates {

    private Integer id;//美食店主键id自增
    private String name;//美食店名称
    private String url;//美食店图片地址
    private String location;//美食店地址
    private String catesDesc;//美食店描述
    private Integer destId;//美食店所属景点id

    private Destination destination;//美食店所属景点

    public Destination getDestination() {
        return destination;
    }

    public void setDestination(Destination destination) {
        this.destination = destination;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getCatesDesc() {
        return catesDesc;
    }

    public void setCatesDesc(String catesDesc) {
        this.catesDesc = catesDesc;
    }

    public Integer getDestId() {
        return destId;
    }

    public void setDestId(Integer destId) {
        this.destId = destId;
    }

    @Override
    public String toString() {
        return "Cates{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", location='" + location + '\'' +
                ", catesDesc='" + catesDesc + '\'' +
                ", destId=" + destId +
                '}';
    }

}
