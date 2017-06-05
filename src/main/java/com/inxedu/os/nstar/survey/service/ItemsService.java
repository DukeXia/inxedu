package com.inxedu.os.nstar.survey.service;


import com.inxedu.os.nstar.survey.entity.Items;

import java.util.List;

public interface ItemsService {
    int deleteByPrimaryKey(Long id);

    int save(Items record);

    int insertSelective(Items record);

    Items selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Items record);

    int updateByPrimaryKey(Items record);

    void saveItem(long questionId, String item, int i);

    void updateStatics(Long itmeId);

    List<Items> findItemsByquestionId(long id);

    List<String> findContentByQuestionId(Long id);

    void deleteItermsByQuestionId(Long aLong);
}