package com.jianyan.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * (Admin)实体类
 *
 * @author makejava
 * @since 2020-06-01 15:42:52
 */
@Data
public class Admin implements Serializable {
    private static final long serialVersionUID = 695139378053929771L;
    /**
    * 主键
    */
    private Integer aid;
    /**
    * 登录账户
    */
    private String loginname;
    /**
    * 密码
    */
    private String loginpwd;
    /**
    * 管理员姓名
    */
    private String name;
    /**
    * 管理员所在部门
    */
    private String dept;


}