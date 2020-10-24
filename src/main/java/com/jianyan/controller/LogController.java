package com.jianyan.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.jianyan.entity.Log;
import com.jianyan.entity.Teach;
import com.jianyan.service.LogService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.time.LocalDateTime;

/**
 * (Log)表控制层
 *
 * @author makejava
 * @since 2020-06-01 15:42:52
 */
@Controller
@RequestMapping("log")
public class LogController {
    /**
     * 服务对象
     */
    @Resource
    private LogService logService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @RequestMapping ("/selectOne/{id}")
    public ModelAndView selectOne(@PathVariable("id") Integer id) {
        ModelAndView md=new ModelAndView("logAdd");
        md.addObject("log",logService.queryById(id));
        return md;
    }

    @RequestMapping("/selectLimit/{pageNum}")
    @ResponseBody
    public PageInfo selectLimit(@PathVariable("pageNum") Integer pageNum, Log l){
        return logService.queryAllByLimit(new Page(pageNum,4),l);
    }
    @RequestMapping("/add")
    @ResponseBody
    public String add(Log log){
        if(logService.insert(log)!=null){
            return "1";
        }
        return "0";
    }
    @RequestMapping("/update")
    @ResponseBody
    public String update(Log log){
        if(logService.update(log)!=null){
            return "1";
        }
        return "0";
    }
    @RequestMapping("/delete/{id}")
    @ResponseBody
    public String delete(@PathVariable("id")Integer id){
        if(logService.deleteById(id)){
            return "1";
        }
        return "0";
    }
}