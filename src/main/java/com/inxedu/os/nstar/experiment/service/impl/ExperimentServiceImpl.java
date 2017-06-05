package com.inxedu.os.nstar.experiment.service.impl;

import com.inxedu.os.common.dao.GenericDaoImpl;
import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.nstar.experiment.entity.Experiment;
import com.inxedu.os.nstar.experiment.service.ExperimentService;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by lzq on 2017/5/13.
 */
@Repository("experimentService")
public class ExperimentServiceImpl extends GenericDaoImpl implements ExperimentService {
    @Override
    public int deleteByPrimaryKey(Long id) {
        this.delete("ExperimentMapper.deleteByPrimaryKey",id);
        return 0;
    }

    @Override
    public int save(Experiment record) {
        this.insert("ExperimentMapper.insert",record);
        return 0;
    }

    @Override
    public int insertSelective(Experiment record) {
        return 0;
    }

    @Override
    public Experiment selectByPrimaryKey(Long id) {
        return this.selectOne("ExperimentMapper.selectByPrimaryKey",id);
    }

    @Override
    public int updateByPrimaryKeySelective(Experiment record) {
        this.update("ExperimentMapper.updateByPrimaryKeySelective",record);
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Experiment record) {
        return 0;
    }

    @Override
    public List<Experiment> findExperimentList(PageEntity page) {
        return this.queryForListPage("ExperimentMapper.findExperimentList",null,page);
    }

    @Override
    public List<Experiment> findByCourseName(String courseName,PageEntity page) {
        if ("".equals(courseName)){
            courseName=null;
        }
        Experiment experiment=new Experiment();
        experiment.setCourseName(courseName);
        return this.queryForListPage("ExperimentMapper.findByCourseName",experiment,page);
    }

    @Override
    public void deleteAllExperiment() {
        List<Experiment> list = this.selectList("ExperimentMapper.findAllExperiment", null);
        for (Experiment experiment :list) {
            this.deleteByPrimaryKey(experiment.getId());
        }
    }
}
