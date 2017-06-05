package com.inxedu.os.nstar.survey.service.impl;

import com.inxedu.os.common.dao.GenericDaoImpl;
import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.nstar.survey.entity.BookSurveyTerm;
import com.inxedu.os.nstar.survey.service.BookSurveyTermService;
import org.springframework.stereotype.Repository;

import java.util.List;
/**
 * Created by 梁自强 on 2017/5/26.
 */
@Repository("bookSurveyTermServiceImpl")
public class BookSurveyTermServiceImpl extends GenericDaoImpl implements BookSurveyTermService {
    @Override
    public int deleteByPrimaryKey(Long id) {
        List<BookSurveyTerm> list=this.selectList("BookSurveyMapper.findBookSurveyListByTermIdWithoutPage",id);
        for (BookSurveyTerm bookSurveyTerm :list) {
            this.delete("BookSurveyMapper.deleteByPrimaryKey",bookSurveyTerm.getId());
        }
        this.delete("BookSurveyTermMapper.deleteByPrimaryKey",id);
        return 0;
    }

    @Override
    public int insert(BookSurveyTerm record) {
       this.insert("BookSurveyTermMapper.insert", record);
        return 0;
    }

    @Override
    public int insertSelective(BookSurveyTerm record) {
        return 0;
    }

    @Override
    public BookSurveyTerm selectByPrimaryKey(Long id) {
        return this.selectOne("BookSurveyTermMapper.selectByPrimaryKey",id);
    }

    @Override
    public int updateByPrimaryKeySelective(BookSurveyTerm record) {
         this.update("BookSurveyTermMapper.updateByPrimaryKeySelective",record);
        return 0;
    }

    @Override
    public int updateByPrimaryKey(BookSurveyTerm record) {
        return 0;
    }

    @Override
    public List<BookSurveyTerm> findBookTermList(PageEntity page) {
        return this.queryForListPage("BookSurveyTermMapper.findBookTermList",null,page);
    }

    @Override
    public List<BookSurveyTerm> findBookTermListByTitle(String title,PageEntity page) {
        BookSurveyTerm bookSurveyTerm=new BookSurveyTerm();
        if(title==""){
            title=null;
        }
        bookSurveyTerm.setTitle(title);
        return this.queryForListPage("BookSurveyTermMapper.findBookTermListByTitle",bookSurveyTerm,page);
    }
}
