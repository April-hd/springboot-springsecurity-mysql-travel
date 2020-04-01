package com.hut.travel.pojo;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-28 14:42 新建
 */
public class SysLog {

    private Integer id;
    private String requestServletPath;//请求相对路径
    private String requestRemoteAddr;//请求IP地址
    private String requestUsername;//请求的用户
    private String requestMethod;//请求的方式
    private String requestQueryString;//请求的参数
    private String createTime;//保存日志时间

    public SysLog(String requestServletPath, String requestRemoteAddr, String requestUsername, String requestMethod, String requestQueryString, String createTime) {
        this.requestServletPath = requestServletPath;
        this.requestRemoteAddr = requestRemoteAddr;
        this.requestUsername = requestUsername;
        this.requestMethod = requestMethod;
        this.requestQueryString = requestQueryString;
        this.createTime = createTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRequestServletPath() {
        return requestServletPath;
    }

    public void setRequestServletPath(String requestServletPath) {
        this.requestServletPath = requestServletPath;
    }

    public String getRequestRemoteAddr() {
        return requestRemoteAddr;
    }

    public void setRequestRemoteAddr(String requestRemoteAddr) {
        this.requestRemoteAddr = requestRemoteAddr;
    }

    public String getRequestUsername() {
        return requestUsername;
    }

    public void setRequestUsername(String requestUsername) {
        this.requestUsername = requestUsername;
    }

    public String getRequestMethod() {
        return requestMethod;
    }

    public void setRequestMethod(String requestMethod) {
        this.requestMethod = requestMethod;
    }

    public String getRequestQueryString() {
        return requestQueryString;
    }

    public void setRequestQueryString(String requestQueryString) {
        this.requestQueryString = requestQueryString;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

}
