package com.travel.config;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-10 8:46 新建
 */
@Component
public class MyAuthenticationFailureHandler implements AuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AuthenticationException e) throws IOException, ServletException {
        String message = "用户名或密码错误";
        //重定向到失败页面
        httpServletRequest.getRequestDispatcher("/loginManage/error?message="+message).forward(httpServletRequest,httpServletResponse);
    }

}
