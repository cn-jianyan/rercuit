package com.jianyan.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.jianyan.entity.Log;
import java.util.List;

/**
 * (Log)表服务接口
 *
 * @author makejava
 * @since 2020-06-01 15:42:52
 */
public interface LogService {

    /**
     * 通过ID查询单条数据
     *
     * @param lid 主键
     * @return 实例对象
     */
    Log queryById(Integer lid);

    /**
     * 查询多条数据
     *
     * @param page 查询页数
     * @param log 查询条件
     * @return 对象列表
     */
    PageInfo queryAllByLimit(Page page,Log log);
    List<Log> queryAll(Log log);
    /**
     * 新增数据
     *
     * @param log 实例对象
     * @return 实例对象
     */
    Log insert(Log log);

    /**
     * 修改数据
     *
     * @param log 实例对象
     * @return 实例对象
     */
    Log update(Log log);

    /**
     * 通过主键删除数据
     *
     * @param lid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer lid);

}