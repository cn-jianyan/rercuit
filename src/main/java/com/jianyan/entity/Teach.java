package com.jianyan.entity;

import lombok.Data;

import java.io.Serializable;

/**
 * (Teach)实体类
 *
 * @author makejava
 * @since 2020-06-01 15:42:52
 */
@Data
public class Teach implements Serializable {
    private static final long serialVersionUID = 719011753538344618L;
    /**
    * id
    */
    private Integer tid;
    /**
    * 登录账号
    */
    private String loginname;
    /**
    * 登录密码
    */
    private String loginpwd;
    /**
    * 老师姓名
    */
    private String name;
    /**
    * 招生地区
    */
    private String area;
    /**
    * 性别
    */
    private String sex;
    /**
    * 手机号码
    */
    private String phonenum;
    /**
    * qq
    */
    private String qqnum;


}