package com.hut.travel.pojo;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-02-01 12:53 新建
 */
public class Destination {

    private Integer id;//目的地id自增
    private String name;//目的地名称
    private String href;//目的地链接
    private String url;//目的地图片地址
    private String destiDesc;//目的地详细描述
    private Integer status;//目的地状态，1为开启，0为关闭

    public String getDestiDesc() {
        return destiDesc;
    }

    public void setDestiDesc(String destiDesc) {
        this.destiDesc = destiDesc;
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Destination{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", href='" + href + '\'' +
                ", url='" + url + '\'' +
                ", destiDesc='" + destiDesc + '\'' +
                ", status=" + status +
                '}';
    }

}
