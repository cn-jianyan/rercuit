package com.jianyan.service;

import com.jianyan.entity.Admin;
import java.util.List;

/**
 * (Admin)表服务接口
 *
 * @author makejava
 * @since 2020-06-01 15:42:52
 */
public interface AdminService {

    /**
     * 通过ID查询单条数据
     *
     * @param aid 主键
     * @return 实例对象
     */
    Admin queryById(Integer aid);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Admin> queryAllByLimit(int offset, int limit);
    List<Admin> queryAll(Admin admin);
    /**
     * 新增数据
     *
     * @param admin 实例对象
     * @return 实例对象
     */
    Admin insert(Admin admin);

    /**
     * 修改数据
     *
     * @param admin 实例对象
     * @return 实例对象
     */
    Admin update(Admin admin);

    /**
     * 通过主键删除数据
     *
     * @param aid 主键
     * @return 是否成功
     */
    boolean deleteById(Integer aid);

}