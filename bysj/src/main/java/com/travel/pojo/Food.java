package com.travel.pojo;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-02-03 13:00 新建
 */
public class Food {

    private Integer id;//云南美食id自增
    private String name;//美食名字
    private Float price;//美食价格
    private String foodDesc;//美食描述
    private String url;//美食图片地址

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

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public String getFoodDesc() {
        return foodDesc;
    }

    public void setFoodDesc(String foodDesc) {
        this.foodDesc = foodDesc;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "Food{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", foodDesc='" + foodDesc + '\'' +
                ", url='" + url + '\'' +
                '}';
    }

}
