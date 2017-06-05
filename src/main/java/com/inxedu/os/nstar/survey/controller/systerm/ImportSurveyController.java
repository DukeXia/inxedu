package com.inxedu.os.nstar.survey.controller.systerm;

import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.nstar.survey.service.ImportSurveyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created by lzq on 2017/5/21.
 */
@Controller
@RequestMapping("/admin/excelSurvey")
public class ImportSurveyController extends BaseController {
    @Autowired
    private ImportSurveyService importSurveyService;

    @RequestMapping("/toBookSurveyImport/{bookSurveyTermId}")
    public String toBookSurveyImport(HttpServletRequest request,@PathVariable("bookSurveyTermId") long bookSurveyTermId)
    {
        request.setAttribute("bookSurveyTermId",bookSurveyTermId);
        return "/survey/import/importBookSurvey";
    }

    @RequestMapping("/toExperimentImport")
    public String toExperimentImport() {
        return "/survey/import/importExperiment";
    }

    @RequestMapping("/toQuestionImport/{id}")
    public String toQuestionImport(HttpServletRequest request, @PathVariable("id") int id) {
        request.setAttribute("questionareId", id);
        return "/survey/import/importQuestions";
    }

    @RequestMapping("/importBookSurveyImport")
    public ModelAndView importBookSurveyImport(HttpServletRequest request, @RequestParam("myFile") MultipartFile myfile,
                                               @RequestParam("mark") Integer mark) {
        String bookSurveyTermId = request.getParameter("bookSurveyTermId");
        ModelAndView modelAndView = new ModelAndView();
        try {
            String message = importSurveyService.updateExcelToBookSurvey(request, myfile,Long.valueOf(bookSurveyTermId));
            request.setAttribute("msg", message);
            if (message == null || message.equals("")) {
                modelAndView.setViewName("/common/success");
            } else {
                modelAndView.setViewName("/common/msg_error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            modelAndView.addObject("msg", e.getMessage());
            modelAndView.setViewName("/common/msg_error");
        }
        return modelAndView;
    }

    @RequestMapping("/importExperiment")
    public ModelAndView importExperiment(HttpServletRequest request, @RequestParam("myFile") MultipartFile myFile, @RequestParam("mark") Integer mark) {
        ModelAndView modelAndView = new ModelAndView();
        try {
            String message = importSurveyService.updateExcelToExperiment(request, myFile, mark);
            request.setAttribute("msg", message);
            if (message == null || message.equals("")) {
                modelAndView.setViewName("/common/success");
            } else {
                modelAndView.setViewName("/common/msg_error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            modelAndView.addObject("msg", e.getMessage());
            modelAndView.setViewName("/common/msg_error");
        }
        return modelAndView;
    }

    @RequestMapping("/importQuestions")
    public ModelAndView importQuestions(HttpServletRequest request,@RequestParam("myFile") MultipartFile myFile,@RequestParam("mark") Integer mark){
        ModelAndView modelAndView=new ModelAndView();
        String questionareId = request.getParameter("questionareId");
        try {
            String message = importSurveyService.updateExcelToQuestions(request, questionareId, myFile, mark);
            request.setAttribute("msg", message);
            if (message == null || message.equals("")) {
                modelAndView.setViewName("/common/success");
            } else {
                modelAndView.setViewName("/common/msg_error");
            }
        } catch (IOException e) {
            e.printStackTrace();
            modelAndView.addObject("msg", e.getMessage());
            modelAndView.setViewName("/common/msg_error");
        }

        return modelAndView;


    }
}
