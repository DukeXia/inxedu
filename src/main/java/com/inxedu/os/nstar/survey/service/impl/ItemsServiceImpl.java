package com.inxedu.os.nstar.survey.service.impl;

import com.inxedu.os.common.dao.GenericDaoImpl;
import com.inxedu.os.nstar.survey.entity.Items;
import com.inxedu.os.nstar.survey.service.ItemsService;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Created by lzq on 2017/4/27.
 */
@Repository("itemsService")
public class ItemsServiceImpl extends GenericDaoImpl implements ItemsService {
    @Override
    public int deleteByPrimaryKey(Long id) {
        return 0;
    }

    @Override
    public int save(Items record) {
        this.insert("SurveyItemsMapper.insert",record);
        return 0;
    }
    @Override
    public int insertSelective(Items record) {
        return 0;
    }

    @Override
    public Items selectByPrimaryKey(Long id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Items record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Items record) {
        return 0;
    }

    @Override
    public void saveItem(long questionId, String item, int i) {
        Items items=new Items();
        items.setState(true);
        items.setStatistics(0);
        items.setItem(item);
        items.setSortNum(i);
        items.setQuestionId(questionId);
        this.save(items);
    }

    @Override
    public void updateStatics(Long itmeId) {
        this.update("SurveyItemsMapper.updateStatics",itmeId);
    }

    @Override
    public List<Items> findItemsByquestionId(long questionId) {
        List<Items> list=this.selectList("SurveyItemsMapper.findItemsByquestionId",questionId);
        return list;
    }

    @Override
    public List<String> findContentByQuestionId(Long id) {
      List<String> list= this.selectList("SurveyItemsMapper.findContentByQuestionId",id);
        return list;
    }

    @Override
    public void deleteItermsByQuestionId(Long aLong) {
        this.delete("SurveyItemsMapper.deleteItermsByQuestionId",aLong);
    }
}
