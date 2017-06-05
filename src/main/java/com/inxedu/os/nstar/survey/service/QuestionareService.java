package com.inxedu.os.nstar.survey.service;


import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.nstar.survey.entity.Questionare;

import java.util.List;

public interface QuestionareService {
    int deleteByPrimaryKey(Long id);

    int save(Questionare record);

    int insertSelective(Questionare record);

    Questionare selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Questionare record);

    int updateByPrimaryKey(Questionare record);

    public List<Questionare> findQuestionare(PageEntity page);
    public List<Questionare> findQuestionareFront(PageEntity page);
    long updateStateByPrimaryKey(Long aLong, int state);
    Questionare findQuestionareAndQuestion(long id);

}