package com.travel.pojo;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-01-30 19:45 新建
 */
public class Scenery {

    private Integer id;//景点id自增
    private String name;//景点名称
    private String location;//景点地点
    private String level;//景点等级
    private String openTime;//景点开放时间
    private Float price;//景点价格
    private String url;//景点图片
    private Integer destId;//景点所属目的地id

    private Destination destination;//景点所属目的地

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

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getOpenTime() {
        return openTime;
    }

    public void setOpenTime(String openTime) {
        this.openTime = openTime;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getDestId() {
        return destId;
    }

    public void setDestId(Integer destId) {
        this.destId = destId;
    }
}
