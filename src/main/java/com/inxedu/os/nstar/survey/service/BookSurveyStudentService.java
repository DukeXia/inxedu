package com.inxedu.os.nstar.survey.service;


import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.nstar.survey.entity.BookSurveyStudent;

import java.util.List;

public interface BookSurveyStudentService {
    int deleteByPrimaryKey(Long id);

    int save(BookSurveyStudent record);

    int insertSelective(BookSurveyStudent record);

    BookSurveyStudent selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(BookSurveyStudent record);

    int updateByPrimaryKey(BookSurveyStudent record);

    List<BookSurveyStudent> findBookStudentByStudentNo(String no);

    List<BookSurveyStudent> findBookStudentByBookSurveyId(long id, PageEntity page);
}