package com.inxedu.os.nstar.survey.service;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created by lzq on 2017/5/21.
 */
public interface ImportSurveyService {
    String updateExcelToBookSurvey(HttpServletRequest request, MultipartFile myfile, Long bookSurveyTermId) throws IOException;

    String updateExcelToExperiment(HttpServletRequest request, MultipartFile myFile, Integer mark) throws IOException;

    String updateExcelToQuestions(HttpServletRequest request, String questionareId, MultipartFile myFile, Integer mark) throws IOException;

}
