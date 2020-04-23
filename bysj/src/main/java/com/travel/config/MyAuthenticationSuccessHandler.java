package com.travel.config;

import com.travel.pojo.UserInfo;
import com.travel.service.UserInfoService;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-10 8:15 新建
 */
@Component
public class MyAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Resource
    private UserInfoService userInfoService;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        UserInfo userInfo = userInfoService.findByUsername(authentication.getName());
        httpServletRequest.getSession().setAttribute("ADMINSESSION",userInfo);
        new DefaultRedirectStrategy().sendRedirect(httpServletRequest,httpServletResponse,"/manage");
    }

}
