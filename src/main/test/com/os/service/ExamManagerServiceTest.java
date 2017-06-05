package com.os.service;

import com.BaseSpringCase;
import com.inxedu.os.nstar.appointment.service.ExamManagerService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;

/**
 * Created by 3 on 2016/10/6.
 */
public class ExamManagerServiceTest  {
    @Autowired
    ExamManagerService examManagerService;
    @Test
    @Rollback(true)
    public  void deleteTest(){

       String name="radio31_15";
//
        System.out.println(name.substring(name.indexOf("_") + 1, name.length()));
    }

}
