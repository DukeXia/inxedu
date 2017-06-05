package com.inxedu.os.nstar.survey.entity;

import lombok.Data;

/**
 * Created by lianzuozheng on 2017/4/5 23:28
 * CopyRight(c) 2017 NStar Studio. All Rights Reserved.
 */
@Data
public class Result {
    /**
     * @description 问卷反馈结果类
     * @author lianzuozheng
     * @date 2017/4/5 23:28
     * @memo
     */

    private Long id;
    private Long questionareId; // 所属问卷id
    private Long questionId; // 所答问题id
    private Integer itemNum; // 所选选项顺序号
    private String itemValue; //选项值 如为数字转换后求和
}