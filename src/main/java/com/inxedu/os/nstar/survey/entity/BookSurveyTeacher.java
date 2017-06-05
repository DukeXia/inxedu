package com.inxedu.os.nstar.survey.entity;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by lianzuozheng on 2017/4/6 14:55
 * CopyRight(c) 2017 NStar Studio. All Rights Reserved.
 */
@Data
public class BookSurveyTeacher implements Serializable{
    /**
     * @description 教师教材评价类
     * @author lianzuozheng
     * @date 2017/4/6 14:55
     * @memo
     */
    private Long id;

    private Long bookSurveyId; // 教材评价问卷id

    private String jobTitle; // 教师职称
    private String position; // 教师职务
    private String teacherNo; // 工号
    private String teacherName; // 教师姓名
    private Date createDate; // 填表时间

    private Integer score1_1; // 教学适应性 得分
    private Integer score1_2; // 认识规律性 得分
    private Integer score1_3; // 结构完整性 得分
    private Integer score2_1; // 先进性 得分
    private Integer score2_2; // 系统性 得分
    private Integer score2_3; // 理论性 得分
    private Integer score3_1; // 思想性 得分
    private Integer score3_2; // 逻辑性 得分
    private Integer score4_1; // 语言文字 得分
    private Integer score4_2; // 图表 得分
    private Integer score5; // 编辑印刷质量 得分
    private Integer score6; // 特色 得分
    private Integer score7; // 学生反馈 得分
    private Integer score; // 总体得分，score1_1 +...+score7=score
    private String memo; // 针对教材的意见和建议

}
