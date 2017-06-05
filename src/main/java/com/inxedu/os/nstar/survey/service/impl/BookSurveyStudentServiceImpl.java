package com.inxedu.os.nstar.survey.service.impl;

import com.inxedu.os.common.dao.GenericDaoImpl;
import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.nstar.survey.entity.BookSurvey;
import com.inxedu.os.nstar.survey.entity.BookSurveyStudent;
import com.inxedu.os.nstar.survey.entity.QueryBookSurveyStudent;
import com.inxedu.os.nstar.survey.service.BookSurveyStudentService;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by lzq on 2017/4/27.
 */
@Repository("bookSurveyStudentService")
public class BookSurveyStudentServiceImpl extends GenericDaoImpl implements BookSurveyStudentService {
    @Override
    public int deleteByPrimaryKey(Long id) {
        return 0;
    }

    @Override
    public int save(BookSurveyStudent surveyStudent) {
        BookSurvey bookSurvey= this.selectOne("BookSurveyMapper.selectByPrimaryKey",surveyStudent.getBookSurveyId());
        bookSurvey.setSum(bookSurvey.getSum()+surveyStudent.getScore());
        bookSurvey.setNumber(bookSurvey.getNumber()+1);
        bookSurvey.setAverage((float)bookSurvey.getSum()/bookSurvey.getNumber());
        this.insert("BookSurveyMapper.updateByPrimaryKey",bookSurvey);
        this.insert("BookSurveyStudentMapper.insert",surveyStudent);
        return 0;
    }

    @Override
    public int insertSelective(BookSurveyStudent record) {
        return 0;
    }

    @Override
    public BookSurveyStudent selectByPrimaryKey(Long id) {
        return this.selectOne("BookSurveyStudentMapper.selectByPrimaryKey",id);
    }

    @Override
    public int updateByPrimaryKeySelective(BookSurveyStudent record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(BookSurveyStudent record) {
        return 0;
    }

    @Override
    public List<BookSurveyStudent> findBookStudentByStudentNo(String no) {

        return this.selectList("BookSurveyStudentMapper.findBookStudentByStudentNo",no);
    }

    @Override
    public List<BookSurveyStudent> findBookStudentByBookSurveyId(long id, PageEntity page) {
        QueryBookSurveyStudent queryBookSurveyStudent=new QueryBookSurveyStudent();
        queryBookSurveyStudent.setBookSurveyId(id);
        return this.queryForListPage("BookSurveyStudentMapper.findBookStudentByBookSurveyId",queryBookSurveyStudent,page);
    }
}
