package com.inxedu.os.nstar.survey.service.impl;

import com.inxedu.os.common.dao.GenericDaoImpl;
import com.inxedu.os.nstar.survey.entity.Result;
import com.inxedu.os.nstar.survey.service.ResultService;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by lzq on 2017/4/27.
 */
@Repository("resultService")
public class ResultServiceImpl extends GenericDaoImpl implements ResultService {
    @Override
    public List<Result> findReslultList() {
        this.selectList("namesapce.id",null);
        return null;
    }
}
