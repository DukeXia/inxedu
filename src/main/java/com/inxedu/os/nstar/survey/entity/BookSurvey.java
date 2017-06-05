package com.inxedu.os.nstar.survey.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by lianzuozheng on 2017/4/6 14:36
 * CopyRight(c) 2017 NStar Studio. All Rights Reserved.
 */
@Data
public class BookSurvey implements Serializable{
    /**
     * 按教材分组，教材总分，评价人数，平均分，按平均分排序，
     * @description 教材评价类
     * @author lianzuozheng
     * @date 2017/4/6 14:36
     * @memo
     */

    private Long id;

    private String surveyTitle; // 问卷标题 ，如 齐齐哈尔大学教材质量评价表（教师用） 或 齐齐哈尔大学教材质量评价表（学生用）

    private String surveySchool; // 发起问卷评价的学院，现代教育技术中心

    private String beginYear; // 开始学年 ，如2016
    private String endYear; // 结束学年，如2017
    private String termNumber; // 学期序号，如2

    private String term; // 学期 组合：开始学年-结束学年-学期序号，如2016-2017-2

    private String title; // 教材名称
    private String author; // 教材主编
    private Date publicDate; // 出版时间
    private String publishingHouse; // 出版社

    private Integer sum; // 此教材得分总和
    private float average; // 教材得分平均分
    private Integer number; // 参与此教材调查总人数

    private Integer type; // 教材评价问卷类型 0学生教材评价问卷  1教师教材评价问卷  权限要求

    private Date createDate; // 创建时间
    private String createMan; // 创建人
    private String memo; // 备注
    private Long bookSurveyTermId;//学期Id
}
