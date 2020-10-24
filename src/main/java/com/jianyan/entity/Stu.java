package com.jianyan.entity;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.io.Serializable;

/**
 * (Stu)实体类
 *
 * @author makejava
 * @since 2020-06-01 15:42:52
 */
@Data
public class Stu implements Serializable {

    /**
    * 学生id
    */
    private Integer sid;
    /**
    * 学生名称
    */
    private String name;
    /**
    * 性别
    */
    private String sex;
    /**
    * 年龄
    */
    private Integer age;
    /**
    * 籍贯
    */
    private String origin;
    /**
    * 名族
    */
    private String national;
    /**
    * 高考准考证号
    */
    private String ticket;
    /**
    * 班主任姓名
    */
    private String headteacher;
    /**
    * 身份证号码
    */
    private String idnumber;
    /**
    * 报考专业
    */
    private String major;
    /**
    * 手机号码
    */
    private String phonenum;
    /**
    * qq
    */
    private String qqnum;
    /**
    * 家庭住址
    */
    private String address;
    /**
    * 紧急联系人
    */
    private String emergencycontact;
    /**
    * 紧急联系人电话
    */
    private String emergencycontacnumber;
    /**
    * 学校名称
    */
    private String school;
    /**
    * 地区
    */
    private String area;
    /**
    * 招生老师id
    */
    private Teach teach;
    /**
    * 填报日期
    */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdate;
    /**
    * 最后修改时间
    */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date modifydate;
    /**
    * 状态1表示正常
    */
    private Integer status;
    /**
    * 备注信息
    */
    private String remark;



}