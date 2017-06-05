package com.inxedu.os.edu.controller.course;

import com.inxedu.os.common.controller.BaseController;
import com.inxedu.os.common.entity.PageEntity;
import com.inxedu.os.common.util.ObjectUtils;
import com.inxedu.os.common.util.SingletonLoginUtils;
import com.inxedu.os.edu.entity.course.Course;
import com.inxedu.os.edu.entity.course.CourseDto;
import com.inxedu.os.edu.entity.course.CourseFavorites;
import com.inxedu.os.edu.entity.course.QueryCourse;
import com.inxedu.os.edu.entity.kpoint.CourseKpoint;
import com.inxedu.os.edu.entity.subject.QuerySubject;
import com.inxedu.os.edu.entity.subject.Subject;
import com.inxedu.os.edu.entity.teacher.QueryTeacher;
import com.inxedu.os.edu.entity.teacher.Teacher;
import com.inxedu.os.edu.entity.user.User;
import com.inxedu.os.edu.service.course.CourseFavoritesService;
import com.inxedu.os.edu.service.course.CourseKpointService;
import com.inxedu.os.edu.service.course.CourseService;
import com.inxedu.os.edu.service.subject.SubjectService;
import com.inxedu.os.edu.service.teacher.TeacherService;
import com.inxedu.os.nstar.survey.entity.Items;
import com.inxedu.os.nstar.survey.entity.Questionare;
import com.inxedu.os.nstar.survey.entity.Result;
import com.inxedu.os.nstar.survey.service.ItemsService;
import com.inxedu.os.nstar.survey.service.QuestionareService;
import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
/**
 * 前台 Course管理接口
 * @author www.inxedu.com
 */
@Controller
public class CourseController extends BaseController {

    private static final Logger logger = LoggerFactory.getLogger(CourseController.class);

    // 课程列表
    private static final String showCourseList = getViewPath("/web/course/courses-list");
    // 课程详情 
    private static final String couinfo = getViewPath("/web/course/course-infor");

    @Autowired
    private CourseService courseService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private SubjectService subjectService;
	@Autowired
	private CourseFavoritesService courseFavoritesService;
	@Autowired
	private CourseKpointService courseKpointService;
    @Autowired
    private QuestionareService questionareService;
    @Autowired
    private ItemsService itemsService;
    // 绑定变量名字和属性，参数封装进类
    @InitBinder("queryCourse")
    public void initBinderQueryCourse(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("queryCourse.");
    }
    @InitBinder("courseFavorites")
    public void initBinderCourseFavorites(WebDataBinder binder) {
    	binder.setFieldDefaultPrefix("courseFavorites.");
    }

    /**
     * 课程列表展示,搜索课程
     */
    @RequestMapping("/front/showcoulist")
    public ModelAndView showCourseList(HttpServletRequest request, @ModelAttribute("page") PageEntity page, @ModelAttribute("queryCourse") QueryCourse queryCourse) {
        ModelAndView model = new ModelAndView();
        try {
        	model.setViewName(showCourseList);
            // 页面传来的数据放到page中
        	page.setPageSize(12);
            //只查询上架的
            queryCourse.setIsavaliable(1);
            // 搜索课程列表
            List<CourseDto> courseList = courseService.queryWebCourseListPage(queryCourse, page);
            model.addObject("courseList", courseList);
            
            // 查询所有1级专业
            QuerySubject querySubject = new QuerySubject();
            querySubject.setParentId(0);
            List<Subject> subjectList = subjectService.getSubjectList(querySubject);
            
            
            //根据条件专业查询 所有的子专业
            if (ObjectUtils.isNotNull(queryCourse.getSubjectId())) {
                Subject subject = new Subject();
                subject.setSubjectId(queryCourse.getSubjectId());
                subject = subjectService.getSubjectBySubject(subject);
                //查询子专业
                List<Subject> sonSubjectList = null;
                if (subject.getParentId() != 0) {//如果条件为二级专业（根据父级id，查询所有的子级）
                    sonSubjectList = subjectService.getSubjectListByOne(Long.valueOf(subject.getParentId()));
                    model.addObject("subjectParentId", subject.getParentId());//父级id
                } else {//如果条件为一级专业（根据id，查询所有的子级）
                    sonSubjectList = subjectService.getSubjectListByOne(Long.valueOf(subject.getSubjectId()));
                }
                model.addObject("sonSubjectList", sonSubjectList);
            }
            
            // 全部教师
            QueryTeacher query = new QueryTeacher();
            List<Teacher> teacherList =teacherService.queryTeacherList(query);
            
            model.addObject("page",page);
            model.addObject("queryCourse", queryCourse);
            model.addObject("teacherList", teacherList);
            model.addObject("subjectList", subjectList);
        } catch (Exception e) {
        	model.setViewName(this.setExceptionRequest(request, e));
            logger.error("showCourseList()--error", e);
        }
        return model;
    }

    /**
     * 课程详情
     * 不管是课程套餐还是课程目录时都放到list(coursePackageList)中
     */
    @RequestMapping("/front/couinfo/{id}")
    public ModelAndView couinfo(HttpServletRequest request, @PathVariable("id") int courseId) {
        ModelAndView model = new ModelAndView();
    	try {
    		model.setViewName(couinfo);
            // 查询课程详情
            Course course = courseService.queryCourseById(courseId);
            if(course!=null){
            	model.addObject("course", course);
                //更新课程的浏览量
                courseService.updateCourseCount("pageViewcount",courseId);

            	//查询课程老师
            	//List<Map<String,Object>> teacherList = teacherService.queryCourseTeacerList(courseId);
            	//model.addObject("teacherList", teacherList);
            	//相关课程
                /*
            	List<Course> courseList = courseService.queryInterfixCourseLis(course.getSubjectId(), 5,course.getCourseId());
            	for(Course tempCoursedto : courseList){
            		teacherList=teacherService.queryCourseTeacerList(tempCoursedto.getCourseId());
            	}
            	model.addObject("courseList", courseList);

            	int userId = SingletonLoginUtils.getLoginUserId(request);
            	if(userId>0){
            		//查询登用户是否已经收藏
        			boolean isFavorites = courseFavoritesService.checkFavorites(userId, courseId);
        			model.addObject("isFavorites", isFavorites);
            	}
            		*/
            	//查询课程章节目录
                /*
            	List<CourseKpoint> parentKpointList = new ArrayList<CourseKpoint>();//一级 课程章节
            	List<CourseKpoint> kpointList = courseKpointService.queryCourseKpointByCourseId(courseId);
            	if(kpointList!=null && kpointList.size()>0){
            		for(CourseKpoint temp:kpointList){
                		if (temp.getParentId()==0) {
                			parentKpointList.add(temp);
    					}
                	}
            		int freeVideoId=0;
            		for(CourseKpoint tempParent:parentKpointList){
                		for(CourseKpoint temp:kpointList){
                    		if (temp.getParentId()==tempParent.getKpointId()) {
                    			tempParent.getKpointList().add(temp);
        					}
                    		//获取一个可以试听的视频id
                    		if (freeVideoId==0&&temp.getFree()==1&&temp.getKpointType()==1) {
                    			freeVideoId=temp.getKpointId();
                    			model.addObject("freeVideoId",freeVideoId);
							}
                    	}
                	}
                	model.addObject("parentKpointList", parentKpointList);
            	}
            	*/
            }
            model.addObject("isok", true);
        } catch (Exception e) {
        	model.setViewName(this.setExceptionRequest(request, e));
            logger.error("couinfo()----error", e);
        }
        return model;
    }
    
    /**
     * 添加课程收藏
     */
    @RequestMapping("/front/createfavorites/{courseId}")
    @ResponseBody
    public Map<String,Object> createFavorites(HttpServletRequest request,@ModelAttribute("courseFavorites") CourseFavorites courseFavorites,@PathVariable("courseId") int courseId){
    	Map<String,Object> json = new HashMap<String,Object>();
    	try{
    		int userId = SingletonLoginUtils.getLoginUserId(request);
    		if(userId<=0){
    			json = this.setJson(false, "请登录！", null);
    			return json;
    		}
    		if(courseId<=0){
    			json = this.setJson(false, "请选择要收藏的课程！", null);
    			return json;
    		}
    		boolean is = courseFavoritesService.checkFavorites(userId, courseId);
    		if(is){
    			json = this.setJson(false, "该课程你已经收藏过了！", null);
    			return json;
    		}
    		courseFavorites.setUserId(userId);
    		courseFavorites.setAddTime(new Date());
    		courseFavoritesService.createCourseFavorites(courseFavorites);
    		json = this.setJson(true, "收藏成功", null);
    	}catch (Exception e) {
    		this.setAjaxException(json);
			logger.error("createFavorites()--error",e);
		}
    	return json;
    }
    @RequestMapping("/front/showSurveyList")
    public String showSurveyList(HttpServletRequest request,PageEntity page){
        List<Questionare> list = questionareService.findQuestionareFront(page);
        request.setAttribute("list",list);
        request.setAttribute("page",page);
        return "/inxedu/web/survey/surveyList";
    }
    @RequestMapping("/front/survey/{id}")
    @ResponseBody
    public Map<String,Object> surveyInfo(HttpServletRequest request,@PathVariable("id") long id){
        Map<String,Object> json=new HashedMap(6);
        json=this.setJson(true,"ok",null);
        Questionare questionare1= questionareService.selectByPrimaryKey(id);
        if(questionare1.getFlag()==0){
            if(SingletonLoginUtils.getLoginUser(request)==null){
                json=this.setJson(false,"请登录!",null);
                return json;
            }
        }
        if(questionare1.getState()==3){
            json=this.setJson(false,"该问卷已关闭",null);
        }
        return json;
    }
    @RequestMapping("/front/surveyInfo/{id}")
    public String surveyContent(HttpServletRequest request,@PathVariable("id") long id){
        Questionare questionare = questionareService.findQuestionareAndQuestion(id);
        request.setAttribute("questionare",questionare);
        return "/inxedu/web/survey/surveyInfo";
    }
    @RequestMapping("/front/submitSurveyQuestion")
    @ResponseBody
    public Map<String,Object> submitSurveyQuestion(HttpServletRequest request){
        Map<String,Object> json=new HashedMap(6);

        String questionareId = request.getParameter("questionareId");

        Enumeration<String> e = request.getParameterNames();
        List lname = new LinkedList();
        Map map = new HashMap();
        while (e.hasMoreElements()) {//取得所有参数名
            String key = (String) e.nextElement();
            if (key.startsWith("qu") || key.startsWith("oid")){
                continue;
            }
            String ln2 = key.substring(key.length()-2);//截取参数的后两个字符，以利于参数的正确排序
            map.put(ln2, key);
            lname.add(ln2);
            Collections.sort(lname);
        }
        //取得参数的值
        for (int i = 0; i < lname.size(); i++) {
            int ccount=0,rcount=0,tcount=0;

            String name = (String) map.get(lname.get(i));
            //System.out.println("name:" + name);
            //radio
            //判断是否为复选框
            if (name.startsWith("checkbox")) {
                ccount++;
                String checkbox = request.getParameter(name);
                if (checkbox != null) {
                    itemsService.updateStatics(Long.valueOf(name.substring(name.indexOf("_") + 1, name.length())));
                }
            } else if(name.startsWith("radio") || name.startsWith("select")) {
                itemsService.updateStatics(Long.valueOf(name.substring(name.indexOf("_") + 1, name.length())));
            }else if(name.startsWith("txt")) {

            }
        }
        json=this.setJson(true,"提交成功，感谢参与的提示",null);
        return json;

    }
}