package com.inxedu.os.nstar.survey.entity;

import lombok.Data;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by lianzuozheng on 2017/4/6 14:55
 * CopyRight(c) 2017 NStar Studio. All Rights Reserved.
 */
@Data
public class BookSurveyStudent implements Serializable{
    /**
     * @description 学生教材评价类
     * @author lianzuozheng
     * @date 2017/4/6 14:55
     * @memo
     */
    private Long id;

    private Long bookSurveyId; // 教材评价问卷id

    private String majorName; // 学生专业
    private String className; // 学生班级
    private String studentNo; // 学生学号
    private String studentName; // 学生姓名，填表人
    private Date createDate; // 填表时间

    private Integer score1; // 教材内容的深度与广度 得分
    private Integer score2; // 教材内容的系统性与完整性 得分
    private Integer score3; // 教材内容的逻辑性与思想性 得分
    private Integer score4; // 教材内容的表达水平 得分
    private Integer score5; // 教材内容的正确性 得分
    private Integer score6; // 教材印刷装订质量 得分
    private Integer score7; // 教材价格 得分

    private Integer score; // 总体得分，score1+...+score7=score
    private String memo; // 针对教材的意见和建议
}
