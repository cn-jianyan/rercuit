package com.jianyan.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.jianyan.entity.Stu;
import com.jianyan.entity.View;

import java.util.List;
import java.util.Map;

/**
 * (Stu)表服务接口
 *
 * @author makejava
 * @since 2020-06-01 15:42:52
 */
public interface StuService {

    /**
     * 通过ID查询单条数据
     *
     * @param sid 主键
     * @return 实例对象
     */
    Stu queryById(Integer sid);

    /**
     * 查询多条数据
     *
     * @param p 查询起始位置
     * @param s 查询条数
     * @return 对象列表
     */

    PageInfo queryAllByLimit(Page p,Stu  s);
    /**
     * 新增数据
     *
     * @param stu 实例对象
     * @return 实例对象
     */
    Stu insert(Stu stu);

    /**
     * 修改数据
     *
     * @param stu 实例对象
     * @return 实例对象
     */
    Stu update(Stu stu);

    /*图表数据查询*/
    List<View> queryView();
    public Map<String,Integer> stuview(String str);
    /**
     * 通过主键删除数据
     *
     * @param sid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer sid);

    /**
     * 数据导出
     */


}