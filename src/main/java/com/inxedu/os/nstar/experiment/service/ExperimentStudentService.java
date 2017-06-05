package com.inxedu.os.nstar.experiment.service;

import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.nstar.experiment.entity.Experiment;
import com.inxedu.os.nstar.experiment.entity.ExperimentStudent;

import java.util.List;

public interface ExperimentStudentService {
    int deleteByPrimaryKey(Long id);

    int save(ExperimentStudent record);

    int insertSelective(ExperimentStudent record);

    ExperimentStudent selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ExperimentStudent record);

    int updateByPrimaryKey(ExperimentStudent record);

    ExperimentStudent findResultBySutdentNo(String no,Long experimentId);

    List<Experiment> findExperimentByExperimentId(long id, PageEntity page);


}