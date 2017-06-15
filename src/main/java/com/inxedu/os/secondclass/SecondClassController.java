package com.inxedu.os.secondclass;

import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.secondclass.entity.Student;
import com.inxedu.os.secondclass.service.StudentService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lzq on 2017/6/13.
 */
@Controller
public class SecondClassController extends BaseController{
    @Autowired
    private StudentService studentService;


    @RequestMapping("/secondclass/user/toRegist")
    public String toRegist() {
        return "secondclass/regist";
    }

    @RequestMapping("/secondclass/user/regist")
    @ResponseBody
    public Map<String, Object> regist(HttpServletRequest request,Student student) {
        Map<String,Object> json=new HashMap();
        List<Student> studentByNo=studentService.selectByStudentNo(student.getStudentNo());
        if (studentByNo != null&&studentByNo.size()>0) {
            json=this.setJson(false,"您已经注册过了！",null);
            return json;
        }
        studentService.insert(student);
        json=this.setJson(true,"注册成功！",null);
        System.out.println(student);
        return json;
    }


}
