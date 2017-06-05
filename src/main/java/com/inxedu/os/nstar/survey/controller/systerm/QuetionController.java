package com.inxedu.os.nstar.survey.controller.systerm;

import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.nstar.survey.entity.Question;
import com.inxedu.os.nstar.survey.service.ItemsService;
import com.inxedu.os.nstar.survey.service.QuestionService;
import com.inxedu.os.nstar.survey.service.QuestionareService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.prefs.BackingStoreException;

/**
 * Created by lzq on 2017/5/5.
 */
@Controller
@RequestMapping("/admin/question")
public class QuetionController  extends BaseController{
    @Autowired
    private QuestionareService questionareService;
    @Autowired
    private QuestionService questionService;
    @Autowired
    private ItemsService itemsService;
    @RequestMapping("/toCreateQuestion/{questionareId}")
    public String toCreateQuestion(HttpServletRequest request, @PathVariable("questionareId") long questionareId) {
        request.setAttribute("questionareId", questionareId);
        return "/survey/question/createQuestion";
    }
    @RequestMapping("/toEditQuestion/{questionId}")
    public String toEditQuestion(HttpServletRequest request,@PathVariable("questionId") long questionId){
        Question question = questionService.selectByPrimaryKey(questionId);
        request.setAttribute("question",question);
        return "/survey/question/editQuestion";
    }
    @RequestMapping("/createQuestion")
    public String createQuestion(HttpServletRequest request) {
        String type = request.getParameter("type");
        String topic = request.getParameter("topic");
        String questionareId = request.getParameter("questionareId");
        Question question = new Question();
        question.setTopic(topic);
        long id = Long.valueOf(questionareId);
        question.setQuestionareId(id);
        question.setState(true);
        question.setType(Integer.parseInt(type));
        int count = questionService.findCountByQuestionareId(id);
        question.setSortNum(count + 1);
        long questionId = questionService.save(question);
        String seqCnt = request.getParameter("listCnt");
        int lisCnt = Integer.parseInt(seqCnt);
        for (int i = 1; i <=lisCnt; i++) {
            String name="txt"+i;
            String item = request.getParameter(name);
            itemsService.saveItem(question.getId(),item,i);
        }
        StringBuilder sb=new StringBuilder();
                sb.append("redirect:/admin/questionare/toEditContent/");
                sb.append(questionareId);
        return sb.toString();
    }
    @RequestMapping("/editQuestion")
    public String editQuestion(HttpServletRequest request){
        String questionareId = request.getParameter("questionareId");
        String questionId = request.getParameter("questionId");
        String type = request.getParameter("type");
        Question question=new Question();
        question.setType(Integer.parseInt(type));
        question.setId(Long.valueOf(questionId));
        questionService.updateByPrimaryKeySelective(question);
        itemsService.deleteItermsByQuestionId(Long.valueOf(questionId));
        String seqCnt = request.getParameter("listCnt");
        int lisCnt = Integer.parseInt(seqCnt);
        for (int i = 0; i<lisCnt; i++) {
            String name="txt_"+i;
            String item = request.getParameter(name);
            itemsService.saveItem(Long.valueOf(questionId),item,i);
        }
        StringBuilder sb=new StringBuilder();
        sb.append("redirect:/admin/questionare/toEditContent/");
        sb.append(questionareId);
        return sb.toString();
    }

}