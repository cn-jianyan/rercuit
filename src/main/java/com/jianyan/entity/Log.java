package com.jianyan.entity;

import lombok.Data;

import java.util.Date;
import java.io.Serializable;

/**
 * (Log)实体类
 *
 * @author makejava
 * @since 2020-06-01 15:42:52
 */
@Data
public class Log implements Serializable {
    private static final long serialVersionUID = -36005385442481462L;
    /**
    * 主键
    */
    private Integer lid;
    /**
    * 操作记录
    */
    private String operatingrecord;
    /**
    * 外键
    */
    private Admin admin;
    /**
    * 操作时间
    */
    private Date operatingdate;



}