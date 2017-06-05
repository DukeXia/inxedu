package com.inxedu.os.nstar.survey.controller.web;

import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.common.util.SingletonLoginUtils;
import com.inxedu.os.edu.entity.teacher.Teacher;
import com.inxedu.os.nstar.survey.entity.BookSurvey;
import com.inxedu.os.nstar.survey.entity.BookSurveyTeacher;
import com.inxedu.os.nstar.survey.service.BookSurveyService;
import com.inxedu.os.nstar.survey.service.BookSurveyTeacherService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by lzq on 2017/5/13.
 */
@Controller
@RequestMapping("/teacher/bookSurvey")
public class BookSurveyTeacherContoller extends BaseController{
    @Autowired
    private BookSurveyService bookSurveyService;
    @Autowired
    private BookSurveyTeacherService bookSurveyTeacherService;

    @RequestMapping("/bookSurveyList")
    public String bookSurveyList(HttpServletRequest request, PageEntity page){
        request.setAttribute("teacher", SingletonLoginUtils.getLoginTeacher(request));

        List<BookSurvey> list = bookSurveyService.selectBookSurveyListByState(page, 1);
        request.setAttribute("date",new Date());
        request.setAttribute("page", page);

        request.setAttribute("list", list);
        return "/inxedu/teacher/main/bookSurveyInfo";
    }

    @RequestMapping("/list")
    public String selectList(HttpServletRequest request,PageEntity page){
        List<BookSurvey> list = bookSurveyService.selectBookSurveyListByState(page,1);
        request.setAttribute("list",list);
        request.setAttribute("page",page);
        return "/survey/booksurvey/select_booksurvey_list";
    }
    @RequestMapping("/selectByName")
    public String selectByName(HttpServletRequest request,PageEntity page){

        String surveyTitle = request.getParameter("surveyTitle");
        List<BookSurvey> list = bookSurveyService.findbookSurveyByName(page,1, surveyTitle);
        request.setAttribute("list",list);
        request.setAttribute("page",page);
        return "/survey/booksurvey/select_booksurvey_list";
    }
    @RequestMapping("/saveBookSurveyStudent")
    @ResponseBody
    public Map<String,Object> saveBookSurveyStudent(HttpServletRequest request, BookSurveyTeacher bookSurveyTeacher){
        Map<String,Object> json=new HashedMap(6);
        Teacher loginTeacher = SingletonLoginUtils.getLoginTeacher(request);
        List<BookSurveyTeacher> list=bookSurveyTeacherService.findBookSurveyTeacherByNo(loginTeacher.getUsername(),bookSurveyTeacher.getBookSurveyId());
        if(list!=null&&list.size()>0){
            json=this.setJson(false,"您已经评价",null);
            return json;
        }
        bookSurveyTeacherService.save(bookSurveyTeacher);
        json=this.setJson(true,"评价成功",null);
        return json;
    }


}
