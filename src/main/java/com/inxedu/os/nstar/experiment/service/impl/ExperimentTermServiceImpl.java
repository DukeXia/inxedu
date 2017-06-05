package com.inxedu.os.nstar.experiment.service.impl;

import com.inxedu.os.common.dao.GenericDaoImpl;
import com.inxedu.os.nstar.experiment.entity.ExperimentTerm;
import com.inxedu.os.nstar.experiment.service.ExperimentTermService;
import org.springframework.stereotype.Repository;

/**
 * Created by lzq on 2017/5/26.
 */
@Repository("experimentTermService")
public class ExperimentTermServiceImpl extends GenericDaoImpl implements ExperimentTermService {
    @Override
    public int deleteByPrimaryKey(Long id) {
        return 0;
    }

    @Override
    public int insert(ExperimentTerm record) {
        return 0;
    }

    @Override
    public int insertSelective(ExperimentTerm record) {
        return 0;
    }

    @Override
    public ExperimentTerm selectByPrimaryKey(Long id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(ExperimentTerm record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(ExperimentTerm record) {
        return 0;
    }
}
