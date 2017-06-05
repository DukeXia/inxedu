package com.inxedu.os.nstar.experiment.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by lzq on 2017/5/11.
 * 实验室课教材评价
 */
@Data
public class Experiment implements Serializable{
    /**
     * 分组统计：课程名称：；开课单位；指导教师
     * 统计平均值，从高到低排序
     */
    private Long id;
    private String courseName;//实验课名称
    private String school;//开课单位
    private String labClassName;//实验班级
    private String teacher;//指导教师
    private String labAddress;//实验地址
    private Date createDate;//创建时间

    private Integer sum;//总数
    private Integer number;//个数
    private double average;//平均值
    private String memo;//描述
}
