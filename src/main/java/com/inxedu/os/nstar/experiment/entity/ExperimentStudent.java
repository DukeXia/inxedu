package com.inxedu.os.nstar.experiment.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by lzq on 2017/5/11.
 * 实验室课教材评价
 */
@Data
public class ExperimentStudent implements Serializable{
    /**
     * 分组统计：课程名称：；开课单位；指导教师
     * 统计平均值，从高到低排序
     */
    private  Long id;
    private String studentNo;
    private Long experimentId;
    private  String courseName;
    private String school;
    private String labClassName;
    private String teacher;
    private String labAddress;
    private Date createDate;
    private Integer score1;
    private Integer score2;
    private Integer score3;
    private Integer score4;
    private Integer score5;
    private Integer score6;
    private Integer score7;
    private Integer score8;
    private Integer score9;
    private Integer score10;

    private Integer sum;
    private String memo;


}
