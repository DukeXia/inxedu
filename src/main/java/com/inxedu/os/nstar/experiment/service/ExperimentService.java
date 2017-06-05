package com.inxedu.os.nstar.experiment.service;

import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.nstar.experiment.entity.Experiment;

import java.util.List;

public interface ExperimentService {
    int deleteByPrimaryKey(Long id);

    int save(Experiment record);

    int insertSelective(Experiment record);

    Experiment selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Experiment record);

    int updateByPrimaryKey(Experiment record);

    List<Experiment> findExperimentList(PageEntity page);

    List<Experiment>    findByCourseName(String courseName,PageEntity page);

    void deleteAllExperiment();
}