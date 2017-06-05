package com.inxedu.os.nstar.experiment.controller;

import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.common.util.SingletonLoginUtils;
import com.inxedu.os.edu.entity.user.User;
import com.inxedu.os.nstar.experiment.entity.Experiment;
import com.inxedu.os.nstar.experiment.entity.ExperimentStudent;
import com.inxedu.os.nstar.experiment.service.ExperimentService;
import com.inxedu.os.nstar.experiment.service.ExperimentStudentService;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by lzq on 2017/5/14.
 */
@Controller
@RequestMapping("/bookSurvey")
public class ExperimentStudentController extends BaseController{
    @Autowired
    private ExperimentService experimentService;
    @Autowired
    private ExperimentStudentService experimentStudentService;
    @RequestMapping("/experimentInfo")
    public String experimentInfo(HttpServletRequest request){
        User loginUser = SingletonLoginUtils.getLoginUser(request);
        request.setAttribute("loginUser",loginUser);
        request.setAttribute("date",new Date());
        return "/experiment/front/experimentInfo";
    }
    @RequestMapping("/selectExoerimentList")
    public String selectExoerimentList(HttpServletRequest request, PageEntity page){
        List<Experiment> list = experimentService.findExperimentList(page);
        request.setAttribute("list",list);
        request.setAttribute("page",page);
        return "/experiment/front/select_esperiment_list";
    }
    @RequestMapping("/selectExperimentByName")
    public String selectByName(HttpServletRequest request, @ModelAttribute("page") PageEntity page){
        String courseName = request.getParameter("courseName");
        List<Experiment> list = experimentService.findByCourseName(courseName, page);
        request.setAttribute("list",list);
        request.setAttribute("page",page);
        return "/experiment/front/select_esperiment_list";
    }
    @RequestMapping("/saveBookExperiment")
    @ResponseBody
    public Map<String,Object> saveBookExperiment(HttpServletRequest request, ExperimentStudent experimentStudent){
        Map<String,Object> json=new HashedMap(6);
        User loginUser = SingletonLoginUtils.getLoginUser(request);
        ExperimentStudent experimentStudent1=experimentStudentService.findResultBySutdentNo(loginUser.getNo(),experimentStudent.getExperimentId());
        if(experimentStudent1!=null){
            json=this.setJson(false,"你已经评价过",null);
            return json;
        }
        experimentStudentService.save(experimentStudent);
        json=this.setJson(true,"评价完成，即将跳转到首页",null);
        return json;
    }
}
