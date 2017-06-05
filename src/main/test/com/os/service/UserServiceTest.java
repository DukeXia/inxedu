package com.os.service;

import com.BaseSpringCase;
import com.inxedu.os.nstar.appointment.entity.examSeat.ExamSeat;
import com.inxedu.os.nstar.appointment.entity.examStudent.ExamStudent;
import com.inxedu.os.nstar.appointment.service.AppointmentFrontService;
import com.inxedu.os.nstar.appointment.service.ExamSeatService;
import com.inxedu.os.nstar.survey.entity.BookSurvey;
import com.inxedu.os.nstar.survey.entity.Questionare;
import com.inxedu.os.nstar.survey.service.BookSurveyService;
import com.inxedu.os.nstar.survey.service.QuestionareService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;

import java.util.List;

/**
 * Created by 3 on 2016/10/5.
 */
public class UserServiceTest  extends BaseSpringCase{

    @Autowired
    private ExamSeatService examSeatService;
    @Autowired
    private AppointmentFrontService appointmentFrontService;
    @Autowired
    private BookSurveyService bookSurveyService;
    @Test
    public void addUser() {
            ExamSeat examSeat=new ExamSeat();
            examSeat.setExamClassroomName("15J201");
            examSeat.setState(true);
            examSeat.setSeatNo(21);
            examSeatService.addExamSeat(examSeat);
    }
    @Test
    public void oneTomangy(){
        List<BookSurvey> bookSurvey = bookSurveyService.findBookSurvey();
        System.out.println(bookSurvey.toString());
        ExamSeat examSeat=new ExamSeat();
        examSeat.setExamClassroomName("15J201");
        examSeat.setState(true);
        examSeat.setSeatNo(21);
        examSeatService.addExamSeat(examSeat);
    }
    @Test
    public void appoint(){
          for (int i = 0; i < 100; i++) {
                    ExamStudent examStudent=new ExamStudent();
                    examStudent.setStudentNo(2015000101+i+"");
                    examStudent.setCourseName("all");
                    examStudent.setCourseCode("all");
                    examStudent.setStudentClass("信科141");
                    new Thread(new Runnable() {
                        @Override
                        public void run() {
                            appointmentFrontService.appointment(examStudent,596,25);
                        }
                    }).start();

                    }
          }
}