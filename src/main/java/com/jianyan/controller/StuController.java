package com.jianyan.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.jianyan.entity.Stu;
import com.jianyan.service.StuService;
import com.jianyan.util.Xlsx;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import   java.net.URLEncoder;
/**
 * (Stu)表控制层
 *
 * @author makejava
 * @since 2020-06-01 15:42:52
 */
@Controller
@RequestMapping("/stu")
public class StuController {
    /**
     * 服务对象
     */
    @Resource
    private StuService stuService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @RequestMapping("/selectOne/{id}")
    public ModelAndView selectOne(@PathVariable("id") Integer id) {
        ModelAndView md=new ModelAndView("stuUpdate");
        md.addObject("stu",stuService.queryById(id));
        return md;
    }

    @RequestMapping("/selectLimit/{pageNum}")
    @ResponseBody
    public PageInfo selectLimit(@PathVariable("pageNum") Integer pageNum,Stu s){

        Page p=new Page();
        p.setPageNum(pageNum); p.setPageSize(4);
        System.out.println(p);

        return   stuService.queryAllByLimit(p,s);
    }

    @RequestMapping("/add")
    public String add(Stu stu){
//        System.out.println(stu);
        stu.setStatus(1);
        stuService.insert(stu);

        return "stu";
    }

    @RequestMapping("/update")
    public String update(Stu stu){
//        System.out.println(stu);
        stuService.update(stu);

        return "stu";
    }

    @RequestMapping("/delete/{id}")
    @ResponseBody
    public String delete(@PathVariable("id") Integer id){
        if (stuService.deleteById(id)){
            return  "1";
        }
        return  "0";
    }

    @RequestMapping("/view/{str}")
    @ResponseBody
    public Map<String, Integer> view(@PathVariable("str")String str){
        return stuService.stuview(str);
    }


    /*下载*/
    @RequestMapping("/down")
    public void down(HttpServletRequest request, HttpServletResponse response,Stu stu) throws Exception {
        System.out.println("开始下载");
        //查询要导出的学生集合
        List<Stu> students=  stuService.queryAllByLimit(new Page(),stu).getList();
        if(students==null||students.isEmpty()){
            return;
        }
        response.setHeader("content-disposition", "attachment;filename="+ URLEncoder.encode("招生统计.xlsx","utf-8"));
        Xlsx.write(students,response.getOutputStream());



    }
    /*查询身份证是否存在*/
    @RequestMapping("/idnum/{idnumber}")
    @ResponseBody
    public String idnumber(@PathVariable("idnumber") String idnumber){
        Stu s=new Stu() ; s.setIdnumber(idnumber);

        List li=stuService.queryAllByLimit(new Page(0,0),s).getList();
        System.out.println("-------------"+li);
        if(li.size()>0)return "0";
        else return "1";
    }
}