package com.inxedu.os.nstar.survey.service.impl;

import com.inxedu.os.common.dao.GenericDaoImpl;
import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.nstar.survey.entity.BookSurvey;
import com.inxedu.os.nstar.survey.entity.BookSurveyTeacher;
import com.inxedu.os.nstar.survey.entity.QueryBookSurveyStudent;
import com.inxedu.os.nstar.survey.service.BookSurveyTeacherService;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by lzq on 2017/4/27.
 */
@Repository("bookSurveyTeacherService")
public class  BookSurveyTeacherServiceImpl extends GenericDaoImpl implements BookSurveyTeacherService {
    @Override
    public int deleteByPrimaryKey(Long id) {
        return 0;
    }

    @Override
    public int save(BookSurveyTeacher bookSurveyTeacher) {
        BookSurvey bookSurvey=this.selectOne("BookSurveyMapper.selectByPrimaryKey",bookSurveyTeacher.getBookSurveyId());
        bookSurvey.setSum(bookSurvey.getSum()+bookSurveyTeacher.getScore());
        bookSurvey.setNumber(bookSurvey.getNumber()+1);
        bookSurvey.setAverage((float)bookSurvey.getSum()/bookSurvey.getNumber());
        this.update("BookSurveyMapper.updateByPrimaryKeySelective",bookSurvey);
        this.insert("BookSurveyTeacherMapper.insert",bookSurveyTeacher);
        return 0;
    }

    @Override
    public int insertSelective(BookSurveyTeacher record) {
        return 0;
    }

    @Override
    public BookSurveyTeacher selectByPrimaryKey(Long id) {
        return this.selectOne("BookSurveyTeacherMapper.selectByPrimaryKey",id);
    }

    @Override
    public int updateByPrimaryKeySelective(BookSurveyTeacher record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(BookSurveyTeacher record) {
        return 0;
    }

    @Override
    public List<BookSurveyTeacher> findBookSurveyTeacherByNo(String teacherNO,Long bookSurveyId) {
        BookSurveyTeacher bookSurvey=new BookSurveyTeacher();
        bookSurvey.setBookSurveyId(bookSurveyId);
        bookSurvey.setTeacherNo(teacherNO);
        return this.selectList("BookSurveyTeacherMapper.findBookSurveyTeacherByNo",bookSurvey);
    }

    @Override
    public List<BookSurveyTeacher> findBookSurveyBySurveyId(long id, PageEntity page) {
        QueryBookSurveyStudent queryBookSurveyStudent=new QueryBookSurveyStudent();
        queryBookSurveyStudent.setBookSurveyId(id);
        return this.queryForListPage("BookSurveyTeacherMapper.findBookSurveyBySurveyId",queryBookSurveyStudent,page);
    }
}
