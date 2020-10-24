package com.jianyan.controller;

import com.jianyan.entity.Admin;
import com.jianyan.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * (Admin)表控制层
 *
 * @author makejava
 * @since 2020-06-01 15:42:52
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    /**
     * 服务对象
     */
    @Resource
    private AdminService adminService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @RequestMapping ("/selectOne/{id}")
    public ModelAndView selectOne(@PathVariable("id") Integer id) {
        ModelAndView md=new ModelAndView("adminUpdate");
        md.addObject("admin",adminService.queryById(id));
       return md;
    }

    @RequestMapping("/selectAll")
    @ResponseBody
    public List<Admin> selectLimit(Admin a){
        return adminService.queryAll(a);
    }

    @RequestMapping("/sign")
    public String sign(Admin a, HttpSession session){
       try{
           Admin admin=adminService.queryAll(a).get(0);
           session.setAttribute("root",admin);
           return "index";
       }catch (Exception e){
           e.printStackTrace();
           return "sign";
       }


    }

    @RequestMapping("/add")
    @ResponseBody
    public String add(Admin a){
        if(adminService.insert(a)!=null){
            return  "1";
        }
        return "0";
    }

    @RequestMapping("/update")
    @ResponseBody
    public String update(Admin a){
        if(adminService.update(a)!=null){
            return  "1";
        }
        return "0";
    }

    @RequestMapping("/delete/{id}")
    @ResponseBody
    public String delete(@PathVariable("id") Integer id){
        if(adminService.deleteById(id)){
            return  "1";
        }
        return "0";
    }

}