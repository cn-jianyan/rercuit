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
public class TableLog implements HandlerInterceptor {
    @Resource
    LogService logService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {


        String uri=request.getRequestURI();
        String token= (String) request.getSession().getAttribute("token");
        Admin admin= (Admin) request.getSession().getAttribute("admin");
//        System.out.println(request.getRequestURI()+":查询操作："+request.getRequestURI().contains("select"));
        if("r".equals(token)){

            StringBuffer str=new StringBuffer("");
            if(uri.contains("add")){
                int a=uri.indexOf("/add");
                String path=request.getContextPath()+"/";
                String table=uri.substring(path.length(),a);
                Log log=new Log();
                log.setOperatingrecord("对"+table+"表执行：添加操作");

                log.setAdmin(admin);
                logService.insert(log);

            }else if(uri.contains("update")){
                int a=uri.indexOf("/update");
                String path=request.getContextPath()+"/";
                String table=uri.substring(path.length(),a);
                Log log=new Log();
                log.setOperatingrecord("对"+table+"表执行：修改操作");

                log.setAdmin(admin);
                System.out.println(log);
                logService.insert(log);
            }else if(uri.contains("delete")){
                int a=uri.indexOf("/delete");
                String path=request.getContextPath()+"/";
                String table=uri.substring(path.length(),a);
                Log log=new Log();
                log.setOperatingrecord("对"+table+"表执行：删除操作");

                log.setAdmin(admin);
                logService.insert(log);
            }
        }

        return true;
    }



}
