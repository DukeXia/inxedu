package com.inxedu.os.nstar.survey.controller.systerm;

import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.nstar.survey.entity.BookSurvey;
import com.inxedu.os.nstar.survey.entity.BookSurveyStudent;
import com.inxedu.os.nstar.survey.entity.BookSurveyTeacher;
import com.inxedu.os.nstar.survey.service.BookSurveyService;
import com.inxedu.os.nstar.survey.service.BookSurveyStudentService;
import com.inxedu.os.nstar.survey.service.BookSurveyTeacherService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * Created by lzq on 2017/4/27.
 */
@Controller
@RequestMapping("/admin/bookSurvey")
public class   AdminBookSurveyController extends BaseController{
    private  static final Logger log= LoggerFactory.getLogger(AdminBookSurveyController.class);
    @Autowired
    private BookSurveyService bookSurveyService;
    @Autowired
    private BookSurveyTeacherService bookSurveyTeacherService;
    @Autowired
    private BookSurveyStudentService bookSurveyStudentService;
    @RequestMapping("/list")
    public  String list(HttpServletRequest request, PageEntity page){
        log.info("list",request);
        List<BookSurvey> list= bookSurveyService.selectBookSurvey(page);//
        request.setAttribute("page",page);
        request.setAttribute("list",list);
        return "/survey/booksurvey/list";
    }
/*    @RequestMapping("list")
    public String bookSurveyList(HttpServletRequest request,PageEntity page){
        List<BookSurvey> list= bookSurveyService.selectBookSurvey(page);//
        return "";
    }*/

    @RequestMapping("/edit")
    public String edit(HttpServletRequest request, BookSurvey bookSurvey) throws Exception {
        String type = request.getParameter("type1");
        bookSurvey.setTerm(bookSurvey.getBeginYear()+"-"+bookSurvey.getEndYear()+"-"+bookSurvey.getTermNumber());
        if("false".equals(type)){
            bookSurvey.setSum(0);
            bookSurvey.setAverage(0f);
            bookSurvey.setAverage(0);
            bookSurvey.setNumber(0);
            bookSurvey.setCreateDate(new Date());
            int insert = bookSurveyService.save(bookSurvey);
        }else if("true".equals(type)){
                bookSurveyService.updateByPrimaryKeySelective(bookSurvey);
        }
        return "redirect:/admin/bookSurvey/list";
    }
    @RequestMapping("/toEdit/{id}")
    public String toEdit(HttpServletRequest request,@PathVariable("id") long id) {
        request.setAttribute("id",id);
//        request.setAttribute("bookSurveyTermId",bookSurveyTermId);
        if (id>0l){
            BookSurvey bookSurvey = bookSurveyService.selectByPrimaryKey(id);
            request.setAttribute("bookSurvey",bookSurvey);
        }
        return "/survey/booksurvey/editBookSurvey";
    }
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request){
        String id = request.getParameter("id");
        bookSurveyService.deleteByPrimaryKey(Long.valueOf(id));
        return "redirect:/admin/bookSurvey/list";
    }
    @RequestMapping("/select")
    public String select(HttpServletRequest request,PageEntity page){
        String currentPage = request.getParameter("page.currentPage");
        page.setCurrentPage(Integer.valueOf(currentPage));
        String surveyTitle = request.getParameter("surveyTitle");
        String surveySchool = request.getParameter("surveySchool");
        List<BookSurvey> list=bookSurveyService.findbookSurvey(page,surveySchool,surveyTitle);
        request.setAttribute("list",list);
        request.setAttribute("page",page);
        request.setAttribute("surveyTitle",surveyTitle);
        request.setAttribute("surveySchool",surveySchool);
        return "/survey/booksurvey/list";
    }
    @RequestMapping("/voteInfo/{id}/{type}")
    public String voteInfo(HttpServletRequest request,@PathVariable("id") long id,@PathVariable("type") int type,@ModelAttribute("page") PageEntity page){
            request.setAttribute("id",id);
            if(type==0){
                List<BookSurveyStudent> list=bookSurveyStudentService.findBookStudentByBookSurveyId(id,page);
                request.setAttribute("list",list);
                request.setAttribute("page",page);
                return "/survey/booksurvey/bookSurveyPerson/studentList";
            }else {
                 List<BookSurveyTeacher> list=   bookSurveyTeacherService.findBookSurveyBySurveyId(id,page);
                 request.setAttribute("list",list);
                 request.setAttribute("page",page);
                return "/survey/booksurvey/bookSurveyPerson/teacherList";
            }

    }
    @RequestMapping("/searchInfo/{type}")
    public String searchInfo(HttpServletRequest request,@PathVariable("type") int type){
        String bookSurveryId = request.getParameter("id");
        request.setAttribute("id",bookSurveryId);
        if(type==0){
            BookSurveyStudent bookSurveyStudent = bookSurveyStudentService.selectByPrimaryKey(Long.valueOf(bookSurveryId));
            request.setAttribute("bookSurveyStudent",bookSurveyStudent);
            BookSurvey bookSurvey = bookSurveyService.selectByPrimaryKey(bookSurveyStudent.getBookSurveyId());
            request.setAttribute("bookSurvey",bookSurvey);
            return "/survey/booksurvey/bookSurveyPerson/studentSurveyInfo";
        }else {
            BookSurveyTeacher bookSurveyTeacher = bookSurveyTeacherService.selectByPrimaryKey(Long.valueOf(bookSurveryId));
            BookSurvey bookSurvey = bookSurveyService.selectByPrimaryKey(Long.valueOf(bookSurveyTeacher.getBookSurveyId()));
            request.setAttribute("bookSurveyTeacher",bookSurveyTeacher);
            request.setAttribute("bookSurvey",bookSurvey);
            return "/survey/booksurvey/bookSurveyPerson/teacherSurveyInfo";
        }
    }
}
