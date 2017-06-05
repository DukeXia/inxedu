package com.inxedu.os.nstar.survey.service.impl;

import com.inxedu.os.common.dao.GenericDaoImpl;
import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.nstar.survey.entity.BookSurvey;
import com.inxedu.os.nstar.survey.service.BookSurveyService;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by lzq on 2017/4/27.
 */
@Repository("bookSurveyService")
public class BookSurveyServiceImpl extends GenericDaoImpl implements BookSurveyService {
    @Override
    public int deleteByPrimaryKey(Long id) {
        this.delete("BookSurveyMapper.deleteByPrimaryKey",id);
        return 0;
    }
    @Override
    public int save(BookSurvey record) {
        this.insert("BookSurveyMapper.insert",record);
        return 0;
    }

    @Override
    public int insertSelective(BookSurvey record) {
        return 0;
    }

    @Override
    public BookSurvey selectByPrimaryKey(Long id) {
        BookSurvey bookSurvey=this.selectOne("BookSurveyMapper.selectByPrimaryKey",id);
        return bookSurvey;
    }

    @Override
    public int updateByPrimaryKeySelective(BookSurvey record) {

        this.update("BookSurveyMapper.updateByPrimaryKeySelective",record);
        return 0;
    }

    @Override
    public int updateByPrimaryKey(BookSurvey record) {
        return 0;
    }

    @Override
    public List<BookSurvey> selectBookSurvey(PageEntity page) {
        return this.queryForListPage("BookSurveyMapper.selectBookSurvey",null,page);
    }
    public List<BookSurvey> findbookSurvey(PageEntity page,String surveySchool, String surveyTitle){
        BookSurvey bookSurvey=new BookSurvey();
        if("".equals(surveySchool)){
            surveySchool=null;
        }
        if("".equals(surveyTitle)){
            surveyTitle=null;
        }
        bookSurvey.setSurveySchool(surveySchool);
        bookSurvey.setSurveyTitle(surveyTitle);
        return this.queryForListPage("BookSurveyMapper.findbookSurvey",bookSurvey,page);
    }

    @Override
    public List<BookSurvey> findBookSurvey() {

        return this.selectList("BookSurveyMapper.findBookSurveyList",null);
    }

    @Override
    public List<BookSurvey> selectBookSurveyListByState(PageEntity page, int state) {
        BookSurvey bookSurvey=new BookSurvey();
        bookSurvey.setType(state);
            return this.queryForListPage("BookSurveyMapper.selectBookSurveyListByState",bookSurvey,page);
    }

    @Override
    public List<BookSurvey> findbookSurveyByName(PageEntity page, int state, String surveyTitle) {
        BookSurvey bookSurvey=new BookSurvey();
        bookSurvey.setType(state);
        bookSurvey.setSurveyTitle(surveyTitle);
        return this.queryForListPage("BookSurveyMapper.findbookSurveyByName",bookSurvey,page);
    }

    @Override
    public List<BookSurvey> findBookSurveyByTermId(Long bookSurveyTermId,PageEntity page) {
        return  this.queryForListPage("BookSurveyMapper.findBookSurveyByTermId",bookSurveyTermId,page);
    }
}
