package com.jianyan.util;

import com.jianyan.entity.Admin;
import com.jianyan.entity.Log;
import com.jianyan.service.LogService;
import lombok.extern.log4j.Log4j;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;

@Log4j
public class MyInterceptor implements HandlerInterceptor {
    @Resource
    LogService logService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {




        String token= (String) request.getSession().getAttribute("token");
        Admin admin= (Admin) request.getSession().getAttribute("admin");
        System.out.println(admin);
        String uri=request.getRequestURI();
//        if(uri.contains("js")||uri.contains("css"))return true;
        System.out.println("token"+token);
        System.out.println(uri);
       if(token==null && !uri.contains("sign")&&!"".equals(token)){
           response.sendRedirect("/404.html");
           return false;
       }


        log.info("客户端发送了"+request.getRequestURI()+"请求，传递的参数为："+request.getParameterMap()+",映射的方法为："+handler);
        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        // System.out.println("视图渲染后"+ex);
        LocalDateTime now=LocalDateTime.now();
        if(ex==null){

        }else{
            log.error("【"+now+"】:程序出现错误！再"+handler+"出现异常，异常信息为【"+ex.getMessage()+"】");
        }
    }

}
