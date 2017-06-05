package com.inxedu.os.nstar.survey.entity;

import lombok.Data;

import java.util.List;

/**
 * Created by lianzuozheng on 2017/4/5 22:47
 * CopyRight(c) 2017 NStar Studio. All Rights Reserved.
 */
@Data
public class Question {
    /**
     * @description 问卷题目类
     * @author lianzuozheng
     * @date 2017/4/5 22:47
     * @memo
     */

    private Long id;
    private Integer sortNum; // 题目顺序号 从1开始，2，3，...，隐藏状态时，顺序号都为0 注：数据库中建立索引
    private String topic; // 问卷题目
    private Integer type; // 题目类型  0单选-计数  1多选-计数  2打分-求和  3文本  统计时，根据类型进行计数或求和统计
    private Boolean state; // 状态 0隐藏 1显示，默认为显示
    private Long questionareId; // 所属问卷的id
    private List<Items> items;
}
