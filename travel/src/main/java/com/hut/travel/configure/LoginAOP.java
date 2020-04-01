package com.hut.travel.configure;

import com.hut.travel.pojo.SysLog;
import com.hut.travel.pojo.UserInfo;
import com.hut.travel.service.SysLogService;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 类说明
 *
 * @author 茶茶
 * @date 2020-03-27 20:37 新建
 */
@Aspect
@Component
public class LoginAOP {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Resource
    private SysLogService sysLogService;

    //执行用户功能先进入登录切入点
    @Pointcut("execution(* com.hut.travel.controller.UserDoController.*(..))")
    public void loginPoint(){

    }

    @Around("loginPoint()")
    public Object doBefore(ProceedingJoinPoint joinPoint) throws Throwable {
        logger.debug("登录环绕通知");
        //1.拿到request请求体和response响应体
        ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = requestAttributes.getRequest();
        //2.获取session
        HttpSession session = request.getSession();
        //3.获取userInfo信息
        UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
        //4.判断是否登录
        if (userInfo == null){
            //1.未登录，返回json数据，前端接收数据
//            String loginResult = "{\"login\":\"false\"}";
//            return loginResult;
//            2.通过重定向到登录界面，记得前面要加/，不加的话可能就会报404，因为不加的话是在当前目录下进行转发，加了的话是在根目录下进行转发，最后发现居然还报了一个ClassCastException异常
//            response.sendRedirect("/login");
//            return response;
            //3.通过视图解析器返回登录界面，缺点是相当于转发，URL路径地址不改变
//            return "login";
            //最后决定用第二种方式，用ajax麻烦，用视图解析器，地址栏不会变，但最后发现这种处理方式不能处理ajax请求，所以要另外处理ajax的响应
            String requestType = request.getHeader("X-Requested-With");//获取请求头
            if ("XMLHttpRequest".equals(requestType)){
                logger.debug("ajax请求");
                //返回ajax数据
                String loginResult = "{\"loginResult\":\"false\"}";
                return loginResult;
            }else {
                logger.debug("非ajax请求");
                return "redirect:/login";
            }
        }else {
            //已登录
            String requestServletPath = request.getServletPath();//获取请求的相对路径
            String requestRemoteAddr = request.getRemoteAddr();//获取请求的IP地址
            String requestUsername = userInfo.getUsername();//获取当前操作的用户
            String requestMethod = request.getMethod();//获取请求方式
            String requestQueryString = request.getQueryString();//获取GET方式请求的参数
            if (requestQueryString == null){
                requestQueryString = "";
            }
            Object proceed = joinPoint.proceed();//执行被拦截的方法
            //保存日志信息
            String createTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
            SysLog sysLog = new SysLog(requestServletPath,requestRemoteAddr,requestUsername,requestMethod,requestQueryString,createTime);
            try {
                sysLogService.addLog(sysLog);
            }catch (Exception e){
                System.out.println(e.getMessage());
                logger.debug("保存日志异常");
            }
            return proceed;
        }
    }

}
