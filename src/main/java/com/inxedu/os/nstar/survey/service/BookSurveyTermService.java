package com.inxedu.os.nstar.survey.service;


import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.nstar.survey.entity.BookSurveyTerm;

import java.util.List;

public interface BookSurveyTermService {
    int deleteByPrimaryKey(Long id);

    int insert(BookSurveyTerm record);

    int insertSelective(BookSurveyTerm record);

    BookSurveyTerm selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(BookSurveyTerm record);

    int updateByPrimaryKey(BookSurveyTerm record);

    List<BookSurveyTerm> findBookTermList(PageEntity page);

    List<BookSurveyTerm> findBookTermListByTitle(String title,PageEntity page);
}