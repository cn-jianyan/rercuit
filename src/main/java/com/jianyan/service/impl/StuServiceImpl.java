package com.jianyan.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jianyan.entity.Stu;
import com.jianyan.dao.StuDao;
import com.jianyan.entity.View;
import com.jianyan.service.StuService;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * (Stu)表服务实现类
 *
 * @author makejava
 * @since 2020-06-01 15:42:52
 */
@Service("stuService")
public class StuServiceImpl implements StuService {
    @Resource
    private StuDao stuDao;

    /**
     * 通过ID查询单条数据
     *
     * @param sid 主键
     * @return 实例对象
     */
    @Override
    public Stu queryById(Integer sid) {
        return this.stuDao.queryById(sid);
    }

    @Override
    public PageInfo queryAllByLimit(Page p, Stu s) {
        PageHelper.startPage(p.getPageNum(),p.getPageSize());
        List list= stuDao.queryAll(s);
        PageInfo pageInfo=new PageInfo(list);
        return  pageInfo;
    }

    /*
    * 数据图筛选
    * */
    @Override
    public Map<String,Integer> stuview(String str){
        Map m=new HashMap();
        if("school".equals(str)){

            List<Stu> list= stuDao.queryAll(new Stu());
            list.forEach((i)->{
               if(m.get(i.getSchool())==null){
                   m.put(i.getSchool(),1);
               }else{
                   Integer x=(Integer) m.get(i.getSchool());
                   m.put(i.getSchool(),x+1);
               }
            });
        }
        else if("area".equals(str)){

            List<Stu> list= stuDao.queryAll(new Stu());
            list.forEach((i)->{
                if(m.get(i.getArea())==null){
                    m.put(i.getArea(),1);
                }else{
                    Integer x=(Integer) m.get(i.getArea());
                    m.put(i.getArea(),x+1);
                }
            });
        }
        else if("sex".equals(str)){

            List<Stu> list= stuDao.queryAll(new Stu());
            list.forEach((i)->{
                if(m.get(i.getSex())==null){
                    m.put(i.getSex(),1);
                }else{
                    Integer x=(Integer) m.get(i.getSex());

                    m.put(i.getSex(),x+1);
                }
            });


        }
        return  m;
    }



    /**
     * 新增数据
     *
     * @param stu 实例对象
     * @return 实例对象
     */
    @Override
    public Stu insert(Stu stu) {
        System.out.println(stu);
        this.stuDao.insert(stu);
        return stu;
    }

    /**
     * 修改数据
     *
     * @param stu 实例对象
     * @return 实例对象
     */
    @Override
    public Stu update(Stu stu) {
        this.stuDao.update(stu);
        return this.queryById(stu.getSid());
    }

    @Override
    public List<View> queryView() {
        return stuDao.queryView();
    }

    /**
     * 通过主键删除数据
     *
     * @param sid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer sid) {
        return this.stuDao.deleteById(sid) > 0;
    }
}