package com.inxedu.os.nstar.survey.service.impl;

import com.inxedu.os.common.dao.GenericDaoImpl;
import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.nstar.survey.entity.Questionare;
import com.inxedu.os.nstar.survey.service.QuestionareService;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by lzq on 2017/5/1.
 */
@Repository("questionareService")
public class QuestionareServiceImpl extends GenericDaoImpl implements QuestionareService {
    @Override
    public int deleteByPrimaryKey(Long id) {
        List<Long> objects = this.selectList("SurveyQuestionMapper.findQuestionIdByQuestionareId", id);
        for (long i:objects
             ) {

            this.delete("SurveyItemsMapper.deleteItermsByQuestionId",i);
        }
        this.delete("SurveyQuestionMapper.dequestionByQuestionareId",id);
        this.delete("QuestionareMapper.deleteByPrimaryKey",id);
        return 0;
    }

    @Override
    public int save(Questionare record) {
        this.insert("QuestionareMapper.insert",record);
        return 0;
    }
    @Override
    public int insertSelective(Questionare record) {
        return 0;
    }

    @Override
    public Questionare selectByPrimaryKey(Long id) {


        return  this.selectOne("QuestionareMapper.selectByPrimaryKey",id);
    }

    @Override
    public int updateByPrimaryKeySelective(Questionare record) {
        this.update("QuestionareMapper.updateByPrimaryKeySelective",record);
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Questionare record) {
        return 0;
    }

    @Override
    public List<Questionare> findQuestionare(PageEntity page) {
       return this.queryForListPage("QuestionareMapper.findQuestionare",null,page);
    }

    @Override
    public List<Questionare> findQuestionareFront(PageEntity page) {
        return this.queryForListPage("QuestionareMapper.findQuestionareFront",null,page);
    }

    @Override
    public long updateStateByPrimaryKey(Long id, int satte) {
        Questionare questionare=new Questionare();
        questionare.setId(id);
        questionare.setState(satte);
        long update = this.update("QuestionareMapper.updateStateByPrimaryKey", questionare);
        return  update;
    }

    @Override
    public Questionare findQuestionareAndQuestion(long id) {
        return  this.selectOne("QuestionareMapper.selectByPrimaryKeyOne",id);
    }


}
