package com.inxedu.os.nstar.survey.service;


import com.inxedu.os.nstar.survey.entity.Question;

import java.util.List;

public interface QuestionService {
    int deleteByPrimaryKey(Long id);

     long  save(Question record);

    int insertSelective(Question record);

    Question selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Question record);

    int updateByPrimaryKey(Question record);

    List<Question> findQuestionByQuestionareId(long id);

    int findCountByQuestionareId(long id);
}