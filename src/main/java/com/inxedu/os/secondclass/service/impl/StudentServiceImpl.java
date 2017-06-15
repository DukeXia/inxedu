package com.inxedu.os.secondclass.service.impl;

import com.inxedu.os.common.dao.GenericDaoImpl;
import com.inxedu.os.secondclass.entity.Student;
import com.inxedu.os.secondclass.service.StudentService;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by lzq on 2017/6/14.
 */
@Repository("studentService")
public class StudentServiceImpl extends GenericDaoImpl implements StudentService {

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return 0;
    }

    @Override
    public int insert(Student student) {
        this.insert("StudentMapper.insert", student);
        return 0;
    }

    @Override
    public int insertSelective(Student record) {
        return 0;
    }

    @Override
    public Student selectByPrimaryKey(Integer id) {
        return null;
    }

    @Override
    public int updateByPrimaryKeySelective(Student record) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Student record) {
        return 0;
    }

    @Override
    public List<Student> selectByStudentNo(String studentNo) {
        return this.selectList("StudentMapper.selectByStudentNo",studentNo);
    }
}
