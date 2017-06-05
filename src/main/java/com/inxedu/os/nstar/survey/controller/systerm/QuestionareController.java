package com.inxedu.os.nstar.survey.controller.systerm;

import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.common.util.SingletonLoginUtils;
import com.inxedu.os.nstar.selectCourse.service.OneLevelAsyncContext;
import com.inxedu.os.nstar.survey.entity.Items;
import com.inxedu.os.nstar.survey.entity.Question;
import com.inxedu.os.nstar.survey.entity.Questionare;
import com.inxedu.os.nstar.survey.service.ItemsService;
import com.inxedu.os.nstar.survey.service.QuestionService;
import com.inxedu.os.nstar.survey.service.QuestionareService;
import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * Created by lzq on 2017/5/1.
 */
@Controller
@RequestMapping("/admin/questionare")
public class QuestionareController extends BaseController{
    private  static  final Logger log= LoggerFactory.getLogger(QuestionareController.class);
    private static final String REDIRE="redirect:/admin/questionare/list";
    @Autowired
    private QuestionareService questionareService;
    @Autowired
    private ItemsService itemsService;
    @Autowired
    private QuestionService questionService;
    @RequestMapping("/list")
    public String list(HttpServletRequest request, PageEntity page){
       List<Questionare> list= questionareService.findQuestionare(page);
       request.setAttribute("list",list);
       request.setAttribute("page",page);
        Enumeration<String> parameterNames = request.getParameterNames();
        return "/survey/questionare/list";
     }
     @RequestMapping("/edit")
    public String edit(HttpServletRequest request, Questionare questionare){
         String type = request.getParameter("type");
         if("false".equals(type)){
             questionare.setState(1);
             questionare.setCreateMan(SingletonLoginUtils.getLoginSysUser(request).getUserName());
             Date date=new Date();
             questionare.setCreateTime(date);
             questionare.setUpdateTime(date);
             questionareService.save(questionare);
         } else if ("true".equals(type)) {
            questionareService.updateByPrimaryKeySelective(questionare);
         }
        return REDIRE;
     }
     @RequestMapping("/toEdit/{id}")
     public String toedit(HttpServletRequest request, @PathVariable("id") int id){
        request.setAttribute("id",id);
        if(id>0){
         Questionare questionare= questionareService.selectByPrimaryKey(Long.valueOf(id));
         request.setAttribute("questionare",questionare);
        }
        return  "/survey/questionare/edit";
     }
     @RequestMapping("/delete")
     public String delete(HttpServletRequest request){
         String id = request.getParameter("id");
         if(!"".equals(id)){
             questionareService.deleteByPrimaryKey(Long.valueOf(id));
         }
         return REDIRE;
     }
    @RequestMapping("/publish/{id}/{state}")
    @ResponseBody
    public Map<String,Object> publish(HttpServletRequest request,@PathVariable("id") long id,@PathVariable("state") int state){
        Map<String,Object> json=new HashedMap(6);
        if(state==2){
            json=this.setJson(false,"该问卷已发布",null);
            return json;
        }
        if (state==3){
            json=this.setJson(false,"该问卷已关闭",null);
            return  json;
        }
        long imply= questionareService.updateStateByPrimaryKey(Long.valueOf(id), 2);
        if (imply>0){
           json= this.setJson(true,"发布成功",null);
        }else {
            json=this.setJson(false,"发布失败",null);
        }
        return  json;
    }
    @RequestMapping("/close/{id}/{state}")
    @ResponseBody
    public Map<String,Object> close(HttpServletRequest request,@PathVariable("id") long id,@PathVariable("state") int state){
            log.info("close:",id);
        Map<String,Object> json=new HashedMap(6);
        if(state==1){
            json=this.setJson(false,"该问卷未发布",null);
        }else if (state==3){
            json=this.setJson(false,"该问卷已关闭,不能关闭",null);
        }else{
            long imply= questionareService.updateStateByPrimaryKey(Long.valueOf(id),3);
            if (imply>0l){
                json=this.setJson(true,"关闭成功",null);}
                else{
                json=this.setJson(false,"关闭失败，请重试",null);
            }
        }
        return  json;
    }
    @RequestMapping("/reset/{id}")
    @ResponseBody
    public Map<String,Object> reset(HttpServletRequest request,@PathVariable("id") long id){
        log.info("reset",id);
        Map<String,Object> json=new HashedMap(6);
        Questionare questionare = questionareService.selectByPrimaryKey(id);
            if(questionare.getState()==1){
            json=this.setJson(false,"该问卷尚未发布",null);
        }else if(questionare.getState()==3){
            json=this.setJson(false,"该问卷已关闭",null);
        }else{
                long state= questionareService.updateStateByPrimaryKey(Long.valueOf(id),1);
                if (state>0l){
                    json=this.setJson(true,"该问卷已关闭",null);
                }else {
                json=this.setJson(false,"关闭失败,请重试",null);
                }
            }
            return json;
    }
    @RequestMapping("/toEditContent/{id}")
    public  String  toEditContent(HttpServletRequest request,@PathVariable("id") long id){
        Questionare questionareAndQuestion = questionareService.findQuestionareAndQuestion(id);
        request.setAttribute("questionare",questionareAndQuestion);
        return "/survey/questionare/editContent";
    }
    @RequestMapping("/editContent/{id}")
    @ResponseBody
    public Map<String,Object> editContent(HttpServletRequest request,@PathVariable("id") long id){
         Map<String,Object> json=new HashedMap(6);
        String title = request.getParameter("title");
        System.out.println(title);
        Questionare questionare = questionareService.selectByPrimaryKey(id);
        return  json;
     }
     @RequestMapping("/viewResult/{questionId}")
     @ResponseBody
    public Object viewResult(HttpServletRequest request,@PathVariable("questionId") long questionId){
        Map<String,Object> json=new HashedMap(6);
         List<String> itermList = new ArrayList<String>();
         List<Integer> staticsList = new ArrayList<Integer>();
         List<Items> itemss = itemsService.findItemsByquestionId(questionId);
         for (Items items:itemss) {
             itermList.add(items.getItem());
             staticsList.add(items.getStatistics());
         }
         json.put("iterm",itermList);
         json.put("statics",staticsList);
         json.put("success1",true);
         return json;
     }
     @RequestMapping("/showResult/{questionareId}")
    public String showResult(HttpServletRequest request,@PathVariable("questionareId") long questionareId){
         List<Question> questions = questionService.findQuestionByQuestionareId(questionareId);
         Questionare questionare=questionareService.selectByPrimaryKey(questionareId);
         request.setAttribute("questions",questions);
         request.setAttribute("questionare",questions);
         return "/survey/surveyresult/showResult";
     }
   /* @RequestMapping("/viewResult1")
    public String sss(){
        return "/survey/surveyresult/showResult";
    }*/

}

