package com.inxedu.os.nstar.experiment.service.impl;

import com.inxedu.os.common.dao.GenericDaoImpl;
import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.nstar.experiment.entity.Experiment;
import com.inxedu.os.nstar.experiment.entity.ExperimentStudent;
import com.inxedu.os.nstar.experiment.service.ExperimentStudentService;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by lzq on 2017/5/13.
 */
@Repository("experimentStudentService")
public class ExperimentStudentServiceImpl extends GenericDaoImpl implements ExperimentStudentService {
    @Override
    public int deleteByPrimaryKey(Long id) {
        return 0;
    }

    @Override
    public int save(ExperimentStudent record) {
      Experiment experiment= this.selectOne("ExperimentMapper.selectByPrimaryKey",record.getExperimentId());
        Experiment experiment1=new Experiment();

        experiment1.setAverage( (double)( experiment.getSum() + record.getSum()) / (experiment.getNumber() + 1));
        experiment1.setSum(record.getSum());
        experiment1.setId(record.getExperimentId());
        this.update("ExperimentMapper.updateSumAnNumber",experiment1);
        this.insert("ExperimentStudentMapper.insert",record);
        return 0;
    }

    @Override
    public int insertSelective(ExperimentStudent record) {
        return 0;
    }

    @Override
    public ExperimentStudent selectByPrimaryKey(Long id) {
        return this.selectOne("ExperimentStudentMapper.selectByPrimaryKey",id);
    }

    @Override
    public int updateByPrimaryKeySelective(ExperimentStudent record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(ExperimentStudent record) {
        return 0;
    }

    @Override
    public ExperimentStudent findResultBySutdentNo(String no,Long experimentId) {
        ExperimentStudent experiment=new ExperimentStudent();

        experiment.setStudentNo(no);
        experiment.setExperimentId(experimentId);
        return this.selectOne("ExperimentStudentMapper.findResultBySutdentNo",experiment);
    }

    @Override
    public List<Experiment> findExperimentByExperimentId(long id,PageEntity page) {
        ExperimentStudent experimentStudent=new ExperimentStudent();
        experimentStudent.setExperimentId(id);
        return this.queryForListPage("ExperimentStudentMapper.findExperimentByExperimentId",experimentStudent,page);
    }
}
