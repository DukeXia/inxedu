package com.inxedu.os.nstar.experiment.controller;

import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.nstar.experiment.entity.Experiment;
import com.inxedu.os.nstar.experiment.entity.ExperimentStudent;
import com.inxedu.os.nstar.experiment.service.ExperimentService;
import com.inxedu.os.nstar.experiment.service.ExperimentStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * Created by lzq on 2017/5/13.
 */
@Controller
@RequestMapping("/admin/experiment")// /admin/experiment/edit
public class ExperimentController extends BaseController{
    @Autowired
    private ExperimentService experimentService;
    @Autowired
    private ExperimentStudentService experimentStudentService;
    @RequestMapping("list")
    public String list(HttpServletRequest request,@ModelAttribute("page") PageEntity page){
       List<Experiment> list= experimentService.findExperimentList(page);
       request.setAttribute("list",list);
       request.setAttribute("page",page);
        return "/experiment/list";
    }
    @RequestMapping("/findByCourseName")
    public String findByCourseName(HttpServletRequest request,@ModelAttribute("page") PageEntity page){
        String courseName = request.getParameter("courseName");
       List<Experiment> list= experimentService.findByCourseName(courseName,page);
       request.setAttribute("list",list);
       request.setAttribute("page",page);
        return "/experiment/list";
    }
    @RequestMapping("/toEdit/{id}")
    public String toEdit(HttpServletRequest request, @PathVariable("id") long id){
        if(id>0l){
            Experiment experiment = experimentService.selectByPrimaryKey(id);
            request.setAttribute("experiment",experiment);
        }
        return "/experiment/edit";
    }
    @RequestMapping("edit")
    public String edit(HttpServletRequest request,Experiment experiment){
        if(experiment.getId()!=null){
            experimentService.updateByPrimaryKeySelective(experiment);
        }else {
            experiment.setNumber(0);
            experiment.setSum(0);
            experiment.setAverage(0d);
            experiment.setCreateDate(new Date());
            experimentService.save(experiment);
        }
        return "redirect:/admin/experiment/list";
    }
    @RequestMapping("/delete")
    public String delete(HttpServletRequest request){
        String id = request.getParameter("id");
        experimentService.deleteByPrimaryKey(Long.valueOf(id));
        return "redirect:/admin/experiment/list";
    }
    @RequestMapping("/voteInfo/{id}")
    public String voteInfo(HttpServletRequest request,@PathVariable("id") long id,@ModelAttribute("page")PageEntity page){
        List<Experiment> list=experimentStudentService.findExperimentByExperimentId(id,page);
        request.setAttribute("list",list);
        request.setAttribute("page",page);
        request.setAttribute("id",id);
        return "/experiment/experimentStudent/list";
    }
    @RequestMapping("/searchInfo")
    public String voteInfo(HttpServletRequest request){
        String experimentId = request.getParameter("id");
        ExperimentStudent experimentStudent = experimentStudentService.selectByPrimaryKey(Long.valueOf(experimentId));
        request.setAttribute("experimentStudent",experimentStudent);
        return  "/experiment/experimentStudent/experimentInfo";
    }
    @RequestMapping("/clear")
    public String clear(HttpServletRequest request){
        experimentService.deleteAllExperiment();
        return "redirect:/admin/experiment/list";
    }
}
