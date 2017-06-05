package com.inxedu.os.nstar.experiment.service;

import com.inxedu.os.nstar.experiment.entity.ExperimentTerm;

public interface ExperimentTermService {
    int deleteByPrimaryKey(Long id);

    int insert(ExperimentTerm record);

    int insertSelective(ExperimentTerm record);

    ExperimentTerm selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(ExperimentTerm record);

    int updateByPrimaryKey(ExperimentTerm record);
}