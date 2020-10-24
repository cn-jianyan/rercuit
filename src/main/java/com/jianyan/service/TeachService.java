package com.jianyan.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.jianyan.entity.Teach;
import java.util.List;

/**
 * (Teach)表服务接口
 *
 * @author makejava
 * @since 2020-06-01 15:42:52
 */
public interface TeachService {

    /**
     * 通过ID查询单条数据
     *
     * @param tid 主键
     * @return 实例对象
     */
    Teach queryById(Integer tid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    PageInfo queryAllByLimit(Page p,Teach t);

    /**
     * 新增数据
     *
     * @param teach 实例对象
     * @return 实例对象
     */
    Teach insert(Teach teach);
    Integer insertAll(List<Teach> li);
    /**
     * 修改数据
     *
     * @param teach 实例对象
     * @return 实例对象
     */
    Teach update(Teach teach);

    /**
     * 通过主键删除数据
     *
     * @param tid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer tid);

}