package com.inxedu.os.nstar.survey.service;


import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.nstar.survey.entity.BookSurvey;

import java.util.List;

public interface BookSurveyService {
    int deleteByPrimaryKey(Long id);

    int save(BookSurvey record);

    int insertSelective(BookSurvey record);

    BookSurvey selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(BookSurvey record);

    int updateByPrimaryKey(BookSurvey record);

    public List<BookSurvey> selectBookSurvey(PageEntity page);

    public  List<BookSurvey> findbookSurvey(PageEntity page,String surveySchool, String surveyTitle);
    public List<BookSurvey> findBookSurvey();

    List<BookSurvey> selectBookSurveyListByState(PageEntity page, int state);

    List<BookSurvey> findbookSurveyByName(PageEntity page, int i, String surveyTitle);

    List<BookSurvey> findBookSurveyByTermId(Long bookSurveyTermId,PageEntity page);
}