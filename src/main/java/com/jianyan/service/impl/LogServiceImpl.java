package com.jianyan.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jianyan.entity.Log;
import com.jianyan.dao.LogDao;
import com.jianyan.service.LogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (Log)表服务实现类
 *
 * @author makejava
 * @since 2020-06-01 15:42:52
 */
@Service("logService")
public class LogServiceImpl implements LogService {
    @Resource
    private LogDao logDao;

    /**
     * 通过ID查询单条数据
     *
     * @param lid 主键
     * @return 实例对象
     */
    @Override
    public Log queryById(Integer lid) {
        return this.logDao.queryById(lid);
    }

    @Override
    public PageInfo queryAllByLimit(Page page, Log log) {
        PageHelper.startPage(page.getPageNum(),page.getPageSize());
        List list= logDao.queryAll(log);
        PageInfo pageInfo=new PageInfo(list);
        return  pageInfo;
    }

    @Override
    public List<Log> queryAll(Log log) {
        return logDao.queryAll(log);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */

    /**
     * 新增数据
     *
     * @param log 实例对象
     * @return 实例对象
     */
    @Override
    public Log insert(Log log) {
        this.logDao.insert(log);
        return log;
    }

    /**
     * 修改数据
     *
     * @param log 实例对象
     * @return 实例对象
     */
    @Override
    public Log update(Log log) {
        this.logDao.update(log);
        return this.queryById(log.getLid());
    }

    /**
     * 通过主键删除数据
     *
     * @param lid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer lid) {
        return this.logDao.deleteById(lid) > 0;
    }
}