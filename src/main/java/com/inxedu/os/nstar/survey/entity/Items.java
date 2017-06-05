package com.inxedu.os.nstar.survey.entity;

import lombok.Data;

/**
 * Created by lianzuozheng on 2017/4/5 23:11
 * CopyRight(c) 2017 NStar Studio. All Rights Reserved.
 */
@Data
public class Items {
    /**
     * @description 问卷题目选项类
     * @author lianzuozheng
     * @date 2017/4/5 23:11
     * @memo
     */

    private Long id;
    private Integer sortNum; // 选项顺序号 从1开始，2，3，...，隐藏状态时，顺序号都为0
    private String item; // 选项内容
    private Integer statistics; // 统计值，如果 题目类型 为 0单选-计数;1多选-计数;2打分-求和;3文本-不计算 默认为0
    private Boolean state; // 状态  0隐藏  1显示
    private Long questionId; // 所属题目id
}
