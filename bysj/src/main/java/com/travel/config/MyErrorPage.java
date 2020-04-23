package com.travel.config;

import org.springframework.boot.web.server.ErrorPage;
import org.springframework.boot.web.server.ErrorPageRegistrar;
import org.springframework.boot.web.server.ErrorPageRegistry;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-09 20:08 新建
 */
@Configuration
public class MyErrorPage implements ErrorPageRegistrar {

    @Override
    public void registerErrorPages(ErrorPageRegistry registry) {

        ErrorPage errorPage_400 = new ErrorPage(HttpStatus.BAD_REQUEST,"/error/400");
        ErrorPage errorPage_403 = new ErrorPage(HttpStatus.FORBIDDEN,"/error/403");
        ErrorPage errorPage_404 = new ErrorPage(HttpStatus.NOT_FOUND,"/error/404");
        ErrorPage errorPage_405 = new ErrorPage(HttpStatus.METHOD_NOT_ALLOWED,"/error/405");
        ErrorPage errorPage_500 = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR,"/error/500");

        registry.addErrorPages(errorPage_400,errorPage_403,errorPage_404,errorPage_405,errorPage_500);

    }

}
