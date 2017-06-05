package com.inxedu.os.nstar.survey.service;


import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.nstar.survey.entity.BookSurveyTeacher;

import java.util.List;

public interface BookSurveyTeacherService {
    int deleteByPrimaryKey(Long id);

    int save(BookSurveyTeacher record);

    int insertSelective(BookSurveyTeacher record);

    BookSurveyTeacher selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(BookSurveyTeacher record);

    int updateByPrimaryKey(BookSurveyTeacher record);

    List<BookSurveyTeacher> findBookSurveyTeacherByNo(String username,Long bookSurveyId);

    List<BookSurveyTeacher> findBookSurveyBySurveyId(long id, PageEntity page);
}