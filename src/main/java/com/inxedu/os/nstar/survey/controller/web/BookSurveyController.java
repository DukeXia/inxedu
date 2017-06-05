package com.inxedu.os.nstar.survey.controller.web;

import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.common.util.SingletonLoginUtils;
import com.inxedu.os.edu.entity.user.User;
import com.inxedu.os.nstar.selectCourse.service.StuClassService;
import com.inxedu.os.nstar.survey.entity.BookSurveyStudent;
import com.inxedu.os.nstar.survey.service.BookSurveyService;
import com.inxedu.os.nstar.survey.service.BookSurveyStudentService;
import net.spy.memcached.compat.log.Logger;
import net.spy.memcached.compat.log.LoggerFactory;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by lzq on 2017/5/12.
 */
@Controller
public class BookSurveyController extends BaseController{
   private static final Logger log= LoggerFactory.getLogger(BookSurveyController.class);
    @Autowired
    private BookSurveyService bookSurveyService;
    @Autowired
    private StuClassService stuClassService;
    @Autowired
    private BookSurveyStudentService bookSurveyStudentService;
    @RequestMapping("/bookSurvey/showBookSurveyList")
    public String bookSurveyList(HttpServletRequest request, PageEntity page){
        log.info("BookSurveyController.bookSurveyList()",request);

        request.setAttribute("list",bookSurveyService.selectBookSurveyListByState(page,0));
        request.setAttribute("page",page);
        return "/survey/booksurvey/front/bookSurvey-list";
    }
    @RequestMapping("/bookSurvey/bookSurveyInfo/{id}")
    public String bookSurveyInfo(HttpServletRequest request, @PathVariable("id") Long id){
        User loginUser = SingletonLoginUtils.getLoginUser(request);
        request.setAttribute("stuClass",stuClassService.getStuClassById(loginUser.getClassId()));
        request.setAttribute("bookSurvey",bookSurveyService.selectByPrimaryKey(id));
        request.setAttribute("user",loginUser);
        request.setAttribute("date",new Date());
        return "/survey/booksurvey/front/bookSurveyInfo";
    }
    @RequestMapping("/bookSurvey/saveBookSurveyStudent")
    @ResponseBody
    public Map<String,Object> saveBookSurvey(HttpServletRequest request, BookSurveyStudent bookSurveyStudent){
        Map<String,Object> json=new HashedMap(6);
        User loginUser = SingletonLoginUtils.getLoginUser(request);
        List<BookSurveyStudent> list=bookSurveyStudentService.findBookStudentByStudentNo(loginUser.getNo());
        if(list!=null&&list.size()>0){
            json=this.setJson(false,"您已经评价",null);
            return json;
        }
        log.info("BookSurveyController.saveBookSurvey()",bookSurveyStudent);
        bookSurveyStudentService.save(bookSurveyStudent);
        json=this.setJson(true,"评价成功",null);
        return json;
    }
}
