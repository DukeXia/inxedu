package com.inxedu.os.secondclass.service;


import com.inxedu.os.secondclass.entity.Student;

import java.util.List;

public interface StudentService {
    int deleteByPrimaryKey(Integer id);

    int insert(Student record);

    int insertSelective(Student record);

    Student selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);

    List<Student> selectByStudentNo(String studentNo);
}