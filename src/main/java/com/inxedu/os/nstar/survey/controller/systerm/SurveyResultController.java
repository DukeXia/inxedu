package com.inxedu.os.nstar.survey.controller.systerm;

import com.inxedu.os.nstar.survey.entity.Result;
import com.inxedu.os.nstar.survey.service.ResultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by lzq on 2017/5/3.
 */
@Controller
@RequestMapping("/admin/surveyresult")
public class SurveyResultController {
    //       /admin/surveyresult/list
    @Autowired
    private ResultService resultService;
    @RequestMapping("/list")
    public  String list(HttpServletRequest request){
        System.out.println("fdshfk");
//        List<Result> list= resultService.findReslultList();
        List<Result> list=new ArrayList<>(6);
        Result result=new Result();
        result.setId(1l);
        result.setItemNum(2);
        result.setQuestionareId(1l);
        list.add(result);
        request.setAttribute("list",list);
        return "/survey/surveyresult/list";
    }
}
