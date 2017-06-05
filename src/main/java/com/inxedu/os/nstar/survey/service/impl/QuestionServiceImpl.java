package com.inxedu.os.nstar.survey.service.impl;

import com.inxedu.os.common.dao.GenericDaoImpl;
import com.inxedu.os.nstar.survey.entity.Question;
import com.inxedu.os.nstar.survey.service.QuestionService;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by lzq on 2017/4/27.
 */
@Repository("questionService")
public class QuestionServiceImpl extends GenericDaoImpl implements QuestionService {
    @Override
    public int deleteByPrimaryKey(Long id) {
        return 0;
    }
    @Override
    public long save(Question record) {
        Long id = this.insert("SurveyQuestionMapper.insert", record);
        return id;
    }
    @Override
    public int insertSelective(Question record) {
        return 0;
    }
    @Override
    public Question selectByPrimaryKey(Long id) {
        Question question=this.selectOne("SurveyQuestionMapper.selectByPrimaryKey",id);
        return question;
    }
    @Override
    public int updateByPrimaryKeySelective(Question record) {
        this.update("SurveyQuestionMapper.updateByPrimaryKeySelective",record);
        return 0;
    }
    @Override
    public int updateByPrimaryKey(Question record) {
        return 0;
    }

    @Override
    public List<Question> findQuestionByQuestionareId(long id) {
        List<Question> list=   this.selectList("SurveyQuestionMapper.findQuestionByQuestionareId",id);
        return list;
    }

    @Override
    public int findCountByQuestionareId(long id) {
       int count= this.selectOne("SurveyQuestionMapper.findCountByQuestionareId",id);
        return count;
    }
}
