package com.jianyan.dao;

import com.jianyan.entity.Teach;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * (Teach)表数据库访问层
 *
 * @author makejava
 * @since 2020-06-01 15:42:52
 */
public interface TeachDao {

    /**
     * 通过ID查询单条数据
     *
     * @param tid 主键
     * @return 实例对象
     */
    Teach queryById(Integer tid);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Teach> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param teach 实例对象
     * @return 对象列表
     */
    List<Teach> queryAll(Teach teach);

    Integer insertList(@Param("teaches") List<Teach> teaches);

    /**
     * 新增数据
     *
     * @param teach 实例对象
     * @return 影响行数
     */
    int insert(Teach teach);

    /**
     * 修改数据
     *
     * @param teach 实例对象
     * @return 影响行数
     */
    int update(Teach teach);

    /**
     * 通过主键删除数据
     *
     * @param tid 主键
     * @return 影响行数
     */
    int deleteById(Integer tid);

}