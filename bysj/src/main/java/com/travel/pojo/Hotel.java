package com.travel.pojo;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-24 17:58 新建
 */
public class Hotel {

    private Integer id;
    private String name;
    private String english;
    private String hotelDesc;
    private String location;
    private Double price;
    private String url;
    private Integer destId;

    private Destination destination;

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

    public String getEnglish() {
        return english;
    }

    public void setEnglish(String english) {
        this.english = english;
    }

    public String getHotelDesc() {
        return hotelDesc;
    }

    public void setHotelDesc(String hotelDesc) {
        this.hotelDesc = hotelDesc;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
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

    @Override
    public String toString() {
        return "Hotel{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", english='" + english + '\'' +
                ", hotelDesc='" + hotelDesc + '\'' +
                ", location='" + location + '\'' +
                ", price=" + price +
                ", url='" + url + '\'' +
                ", destId=" + destId +
                ", destination=" + destination +
                '}';
    }

}
