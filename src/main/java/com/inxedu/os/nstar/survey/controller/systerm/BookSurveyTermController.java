package com.inxedu.os.nstar.survey.controller.systerm;

import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.nstar.survey.entity.BookSurvey;
import com.inxedu.os.nstar.survey.entity.BookSurveyTerm;
import com.inxedu.os.nstar.survey.service.BookSurveyService;
import com.inxedu.os.nstar.survey.service.BookSurveyTermService;
import org.apache.tools.ant.taskdefs.condition.Http;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * Created by lzq on 2017/5/26.
 */
@Controller
@RequestMapping("/admin/bookSurveyTerm")
public class BookSurveyTermController extends BaseController{
    @Autowired
    private BookSurveyTermService bookSurveyTermService;
    @Autowired
    private BookSurveyService bookSurveyService;
    @RequestMapping("/list")
    public String list(HttpServletRequest request, PageEntity page){
        List<BookSurveyTerm> list = bookSurveyTermService.findBookTermList(page);
        request.setAttribute("list",list);
        request.setAttribute("page", page);
        return "/survey/bookSurveyTern/list";
    }
    @RequestMapping("/toEdit")
    public String toEdit(HttpServletRequest request){
        String id = request.getParameter("id");
        Long bookSurveyTermId = Long.valueOf(id);
        if(bookSurveyTermId>0l){
            BookSurveyTerm bookSurveyTerm = bookSurveyTermService.selectByPrimaryKey(bookSurveyTermId);
            request.setAttribute("bookSurveyTerm",bookSurveyTerm);
        }
        return "/survey/bookSurveyTern/edit";
    }
    @RequestMapping("/edit")
    public String edit(HttpServletRequest request,BookSurveyTerm bookSurveyTerm){
        String type = request.getParameter("type");
        if (type.equals("false")){
        bookSurveyTerm.setCreateDate(new Date());
        bookSurveyTerm.setUpdateDate(bookSurveyTerm.getCreateDate());
        bookSurveyTerm.setState(true);
        bookSurveyTermService.insert(bookSurveyTerm);
        }else {
            bookSurveyTermService.updateByPrimaryKeySelective(bookSurveyTerm);
        }
        return "redirect:/admin/bookSurveyTerm/list";
    }
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request){
        String id = request.getParameter("id");
        Long bookSurveyTermId = Long.valueOf(id);
        bookSurveyTermService.deleteByPrimaryKey(bookSurveyTermId);

        return "redirect:/admin/bookSurveyTerm/list";
    }
    @RequestMapping("/selectByTitle")
    public String  selectByTitle(HttpServletRequest request,PageEntity page){
        String title = request.getParameter("title");
      List<BookSurveyTerm> list=bookSurveyTermService.findBookTermListByTitle(title,page);
      request.setAttribute("list",list);
      request.setAttribute("page",page);
        return "/survey/bookSurveyTern/list";
    }
    @RequestMapping("/bookSurveyList")
    public String bookSurveyList(HttpServletRequest request,PageEntity page){
        String id = request.getParameter("id");
        Long bookSurveyTermId = Long.valueOf(id);
        List<BookSurvey> list=bookSurveyService.findBookSurveyByTermId(bookSurveyTermId,page);
        request.setAttribute("list",list);
        request.setAttribute("bookSurveyTermId",bookSurveyTermId);
        request.setAttribute("page",page);
        return "/survey/booksurvey/list";
    }
}
