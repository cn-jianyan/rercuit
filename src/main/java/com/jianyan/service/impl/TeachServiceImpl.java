package com.jianyan.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jianyan.entity.Teach;
import com.jianyan.dao.TeachDao;
import com.jianyan.service.TeachService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Teach)表服务实现类
 *
 * @author makejava
 * @since 2020-06-01 15:42:52
 */
@Service("teachService")
public class TeachServiceImpl implements TeachService {
    @Resource
    private TeachDao teachDao;

    /**
     * 通过ID查询单条数据
     *
     * @param tid 主键
     * @return 实例对象
     */
    @Override
    public Teach queryById(Integer tid) {
        return this.teachDao.queryById(tid);
    }

    @Override
    public PageInfo queryAllByLimit(Page p, Teach t) {
        PageHelper.startPage(p.getPageNum(),p.getPageSize());
        List list= teachDao.queryAll(t);
        PageInfo pageInfo=new PageInfo(list);
        return  pageInfo;
    }



    /**
     * 新增数据
     *
     * @param teach 实例对象
     * @return 实例对象
     */
    @Override
    public Teach insert(Teach teach) {
        this.teachDao.insert(teach);
        return teach;
    }

    @Override
    public Integer insertAll(List<Teach> li) {
        return teachDao.insertList(li);
    }

    /**
     * 修改数据
     *
     * @param teach 实例对象
     * @return 实例对象
     */
    @Override
    public Teach update(Teach teach) {
        this.teachDao.update(teach);
        return this.queryById(teach.getTid());
    }

    /**
     * 通过主键删除数据
     *
     * @param tid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer tid) {
        return this.teachDao.deleteById(tid) > 0;
    }
}