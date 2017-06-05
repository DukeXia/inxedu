package com.inxedu.os.nstar.survey.entity;

import java.util.Date;
import java.util.List;

/**
 * Created by lianzuozheng on 2017/4/5 21:56
 * CopyRight(c) 2017 NStar Studio. All Rights Reserved.
 */
public class Questionare {
    /**
     * @description 问卷类，描述问卷主题
     * @author lianzuozheng
     * @date 2017/4/5 21:56
     * @memo
     */
    private Long id;
    private String title; // 问卷标题
    private String description; // 问卷说明
    private Integer state; // 状态：0 草稿，可以编辑修改；1 发布，不可编辑修改；2 关闭，可以查看问卷结果
    private Integer flag; // 标记：0 匿名问卷  1 实名问卷
    private Date createTime; // 创建时间
    private String createMan; // 创建人
    private Date updateTime; // 修改时间
    private String updateMan; // 修改人
    private List<Question> questions;
    public List<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreateMan() {
        return createMan;
    }

    public void setCreateMan(String createMan) {
        this.createMan = createMan;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getUpdateMan() {
        return updateMan;
    }

    public void setUpdateMan(String updateMan) {
        this.updateMan = updateMan;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
