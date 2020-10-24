package com.jianyan.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.jianyan.entity.Admin;
import com.jianyan.entity.Teach;
import com.jianyan.service.AdminService;
import com.jianyan.service.TeachService;
import com.jianyan.util.TeachExcel;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.mail.Multipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * (Teach)表控制层
 *
 * @author makejava
 * @since 2020-06-01 15:42:52
 */
@Controller
@RequestMapping("teach")
public class TeachController {
    /**
     * 服务对象
     */
    @Resource
    private TeachService teachService;
    @Resource
    private AdminService adminService;

    /*退出*/
    @RequestMapping("/exit")
    public String exit(HttpSession session){
        session.removeAttribute("admin");
        session.removeAttribute("token");
        return "redirect:/sign.jsp";
    }

    /**
     * 登录验证
     */
    @RequestMapping("/sign")
    public String sign(String loginname, String loginpwd, String root, HttpSession session){
       if(loginname==null || loginpwd==null){
           return "redirect:/sign.jsp";
       }
        if(loginname=="" || loginpwd==""){
            return "redirect:/sign.jsp";
        }

        if(root!=null &&!"".equals(root)){
            Admin a=new Admin();
            a.setLoginname(loginname);
            a.setLoginpwd(loginpwd);
            System.out.println(a);
            Admin admin=null;
            try{
                System.out.println(adminService.queryAll(a));
                admin= adminService.queryAll(a).get(0);

            }catch (Exception e){}
            if(admin!=null){
                session.setAttribute("admin",admin);
                session.setAttribute("token","r");
                return "index";
            }

        }
        else{
            Teach a=new Teach();
            a.setLoginname(loginname);
            a.setLoginpwd(loginpwd);
            Teach teach= null;
            try{teach=(Teach) teachService.queryAllByLimit(new Page(0,1),a).getList().get(0);}
            catch (Exception e){

            }
            if(teach!=null){
                session.setAttribute("teach",teach);
                session.setAttribute("token","t");
                return "index";
            }
        }
        return "redirect:/sign.jsp";
    }

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @RequestMapping ("/selectOne/{id}")
    public ModelAndView selectOne(@PathVariable("id") Integer id) {
        System.out.println("xxxxxxxxxxxxxxxxxxxxx");
      ModelAndView modelAndView=new ModelAndView("teachUpdate");
      modelAndView.addObject("teach", teachService.queryById(id));
      return  modelAndView;

    }

    @RequestMapping("/selectLimit/{pageNum}")
    @ResponseBody
    public PageInfo selectLimit(@PathVariable("pageNum") Integer pageNum, Teach t){
        return teachService.queryAllByLimit(new Page(pageNum,0),t);
    }

    @RequestMapping("/add")
    public String add(Teach teach){
        teachService.insert(teach);

        return "teach";

    }
    @RequestMapping("/update")
    public String update(Teach teach){
        System.out.println(teach);
        teachService.update(teach);

        return "teach";

    }

    @RequestMapping("/delete/{id}")
    @ResponseBody
    public String add(@PathVariable("id") Integer id){
        if(teachService.deleteById(id)){
            return "1";
        }
        return "0";
    }

    /*表格导入学生数据*/
    @RequestMapping("excel")
    public String excel(MultipartFile file, HttpServletRequest request){
        if(file==null||file.isEmpty()){
            return "teach";
        };

        try{
          List<Teach> list= TeachExcel.upload(file.getInputStream());
          teachService.insertAll(list);

        } catch (IOException e) {
            e.printStackTrace();

        }
        return "teach";










    }
}