package com.inxedu.os.nstar.survey.service.impl;

import com.inxedu.os.common.dao.GenericDaoImpl;
import com.inxedu.os.common.exception.BaseException;
import com.inxedu.os.common.util.MD5;
import com.inxedu.os.common.util.StringUtils;
import com.inxedu.os.edu.entity.user.User;
import com.inxedu.os.nstar.experiment.entity.Experiment;
import com.inxedu.os.nstar.survey.entity.BookSurvey;
import com.inxedu.os.nstar.survey.entity.Items;
import com.inxedu.os.nstar.survey.entity.Question;
import com.inxedu.os.nstar.survey.service.ImportSurveyService;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

/**
 * Created by lzq on 2017/5/21.
 */
@Repository("importSurveyService")
public class ImportSurveyServiceImpl extends GenericDaoImpl implements ImportSurveyService {
    @Override
    public String updateExcelToBookSurvey(HttpServletRequest request, MultipartFile myfile, Long bookSurveyTermId) throws IOException {
        StringBuilder sb = new StringBuilder();
        List<BookSurvey> list=new ArrayList<>(20);
        try (InputStream inputStream = myfile.getInputStream()) {
            //HSSFWorkbook wookbook = new HSSFWorkbook(inputStream);
            XSSFWorkbook wookbook=new XSSFWorkbook(inputStream);
            Iterator<Sheet> iterator = wookbook.sheetIterator();
            int size = 0;
            while (iterator.hasNext()) {
                size += 1;
                iterator.next();
            }
            for (int j = 0; j < size; ++j) {
                XSSFSheet sheet = wookbook.getSheetAt(j);

                int rows = sheet.getLastRowNum();// 指的行数，一共有多少行+
                if (rows == 0 && j == 0) {
                    throw new BaseException("请填写数据");
                } else if (rows == 0) {
                    continue;
                }

                for (int i = 1; i <= rows + 1; i++) {
                    // 读取左上端单元格
                    XSSFRow row = sheet.getRow(i);
                    // 行不为空
                    if (row != null) {
                         // **读取cell**
                        BookSurvey bookSurvey=new BookSurvey();
                        bookSurvey.setCreateDate(new Date());
                        bookSurvey.setSum(0);
                        bookSurvey.setNumber(0);
                        bookSurvey.setAverage(0);
                        bookSurvey.setCreateMan("admin");
                        bookSurvey.setBookSurveyTermId(bookSurveyTermId);
                        String surveyTitle = getStringCellValue(row.getCell((short) 0));// 问卷标题
                        if (surveyTitle == null || surveyTitle.equals("")) {
                           sb.append("第" + (i+1) + "行 问卷调查标题  不能为空<br/>");
                        }


                            String school = getStringCellValue(row.getCell((short) 1));// 发起问卷评价的学院
                        if (StringUtils.isEmpty(school)) {
                            sb.append("第" + i + "行 发起问卷评价的学院  "+school+" 不能为空<br/>");
                        }
                        String  beginYear= getStringCellValue(row.getCell((short) 2));//开始学年
                        if (StringUtils.isEmpty(beginYear)) {
                            sb.append("第"+(i+1)+"行 开始学年为空 ："+beginYear+"<br>");
                        }
                        String endYear = getStringCellValue(row.getCell((short) 3));//结束学年
                        if (StringUtils.isEmpty(endYear)) {
                            sb.append("第"+(i+1)+"行 结束学年为空 ："+endYear+"<br>");
                        }

                        String termNumber = getStringCellValue(row.getCell((short) 4));// 学期序号
                        if (StringUtils.isEmpty(termNumber)) {
                            sb.append("第" + i + "行  学期序号  不能为空<br/>");
                        }
                        String title = getStringCellValue(row.getCell(5));//教材标题
                        if (StringUtils.isEmpty(title)) {
                            sb.append("第"+i+"行 教材标题 ："+title+"不能为空<br>");
                        }
                        String author = getStringCellValue(row.getCell(6));//教材主编
                        if (StringUtils.isEmpty(author)) {
                            sb.append("第"+(i+1)+"行 教材主编："+author+"不能为空<br>");
                        }
                         Date publishDate = getDateCellValue(row.getCell(7));//教材主编
                        if (publishDate==null){
                            sb.append("第"+(i+1)+"行 出版时间 ：" +publishDate+"不能为空<br>");

                        }
                        String publish = getStringCellValue(row.getCell(8));//出版社
                        if(StringUtils.isEmpty(publish)){
                            sb.append("第"+(i+1)+"行 出版社 ：" +publish+"不能为空<br>");
                        }
                        int type = getIntCellValue(row.getCell(9));//
                        bookSurvey.setType(type);
                        bookSurvey.setAuthor(author);
                        bookSurvey.setBeginYear(beginYear);
                        bookSurvey.setEndYear(endYear);
                        bookSurvey.setPublicDate(publishDate);
                        bookSurvey.setSurveySchool(school);
                        bookSurvey.setSurveyTitle(surveyTitle);
                        bookSurvey.setTitle(title);
                        bookSurvey.setPublishingHouse(publish);
                        bookSurvey.setTermNumber(termNumber);
                        bookSurvey.setTerm(beginYear+"-"+endYear+"-"+termNumber);
                        list.add(bookSurvey);
                    }
                }

            }
            if (!sb.toString().equals("")) {
                // --------------批量保存
                return sb.toString();
            }
            for (BookSurvey bookSurvey:list
                 ) {
                this.insert("BookSurveyMapper.insert",bookSurvey);
            }
            list=null;
        } catch (BaseException e) {
            e.printStackTrace();
            sb.append("系统异常");
        }
        return sb.toString();
    }

    @Override
    public String updateExcelToExperiment(HttpServletRequest request, MultipartFile myFile, Integer mark) throws IOException {
        StringBuilder sb=new StringBuilder();
        List<Experiment> list=new ArrayList<>(20);
        try (InputStream inputStream = myFile.getInputStream()) {
            //HSSFWorkbook wookbook = new HSSFWorkbook(inputStream);
            XSSFWorkbook wookbook=new XSSFWorkbook(inputStream);
            Iterator<Sheet> iterator = wookbook.sheetIterator();
            int size = 0;
            while (iterator.hasNext()) {
                size += 1;
                iterator.next();
            }
            for (int j = 0; j < size; ++j) {
                XSSFSheet sheet = wookbook.getSheetAt(j);

                int rows = sheet.getLastRowNum();// 指的行数，一共有多少行+
                if (rows ==1 && j == 1) {
                    throw new BaseException("请填写数据");
                } else if (rows == 0) {
                    continue;
                }

                for (int i = 1; i <= rows + 1; i++) {
                    // 读取左上端单元格
                    XSSFRow row = sheet.getRow(i);
                    // 行不为空
                    if (row != null) {
                        // **读取cell**
                        Experiment experiment=new Experiment();
                        experiment.setAverage(0d);
                        experiment.setNumber(0);
                        experiment.setSum(0);
                        experiment.setCreateDate(new Date());
                        String labCourseName = getStringCellValue(row.getCell((short) 0));// 实验课名称
                        if (labCourseName == null || labCourseName.equals("")) {
                            sb.append("第" + (i+1) + "行 问卷调查标题  不能为空<br/>");
                        }


                        String school = getStringCellValue(row.getCell((short) 1));// 开课单位
                        if (StringUtils.isEmpty(school)) {
                            sb.append("第" + i + "行  开课单位 "+school+" 不能为空<br/>");
                        }
                        String  labClassName= getStringCellValue(row.getCell((short) 2));//实验课班级
                        if (StringUtils.isEmpty(labClassName)) {
                            sb.append("第"+(i+1)+"行 实验课班级为空 ："+labClassName+"<br>");
                        }
                        String teacher = getStringCellValue(row.getCell((short) 3));//指导教师
                        if (StringUtils.isEmpty(teacher)) {
                            sb.append("第"+(i+1)+"行 指导教师为空 ："+teacher+"<br>");
                        }

                        String labAddress = getStringCellValue(row.getCell((short) 4));// 实验室地址
                        if (StringUtils.isEmpty(labAddress)) {
                            sb.append("第" + i + "行  实验室地址  不能为空<br/>");
                        }
                        experiment.setCourseName(labCourseName);
                        experiment.setLabAddress(labAddress);
                        experiment.setSchool(school);
                        experiment.setLabClassName(labClassName);
                        experiment.setTeacher(teacher);

                        list.add(experiment);
                    }
                }

            }
            if (!sb.toString().equals("")) {
                // --------------批量保存
                return sb.toString();
            }
            for (Experiment experiment:list
                    ) {
                this.insert("ExperimentMapper.insert",experiment);
            }
            list=null;
        } catch (BaseException e) {
            e.printStackTrace();
            sb.append("系统异常");
        }
        return null;
    }

    @Override
    public String updateExcelToQuestions(HttpServletRequest request, String questionareId, MultipartFile myFile, Integer mark) throws IOException {
        StringBuilder sb=new StringBuilder();
        List<Question> list=new ArrayList<>(20);
        try (InputStream inputStream = myFile.getInputStream()) {
            XSSFWorkbook wookbook=new XSSFWorkbook(inputStream);
            Iterator<Sheet> iterator = wookbook.sheetIterator();
            int size = 0;
            while (iterator.hasNext()) {
                size += 1;
                iterator.next();
            }

            for (int j = 0; j < size; ++j) {
                XSSFSheet sheet = wookbook.getSheetAt(j);
                int rows = sheet.getLastRowNum();// 指的行数，一共有多少行+
                if (rows == 0 && j == 0) {
                    throw new BaseException("请填写数据");
                } else if (rows == 0) {
                    continue;
                }
                for (int i = 1; i <= rows + 1; i++) {
                    // 读取左上端单元格
                    XSSFRow row = sheet.getRow(i);
                    // 行不为空
                    if (row != null) {
                        // **读取cell**
                        int columNums = row.getPhysicalNumberOfCells();
                        Question question=new Question();
                        question.setQuestionareId(Long.valueOf(questionareId));
                        question.setState(true);
                        question.setSortNum(i);
                        List<Items> itemsList=new ArrayList<>(6);
                        String topic = getStringCellValue(row.getCell((short) 0));// 题目
                        if (topic   == null || topic.equals("")) {
                            sb.append("第" + i + "行 题目  不能为空<br/>");
                        }
                        String type = getStringCellValue(row.getCell((short) 1));// 类型
                        if (StringUtils.isEmpty(type)) {
                            sb.append("第" + i + "行  开课单位 "+type+" 不能为空<br/>");
                        }
                        if(columNums>2){
                            for (int k = 0; k < columNums - 2; k++) {
                                String  item= getStringCellValue(row.getCell((short) 2));//实验课班级
                                Items items=new Items();
                                items.setItem(item);
                                items.setState(true);
                                items.setSortNum(k+1);
                                items.setStatistics(0);
                                if (StringUtils.isEmpty(item)) {
                                    sb.append("第"+i+"行 实验课班级为空 ："+item+"<br>");
                                }
                                itemsList.add(items);
                            }
                        }
                        question.setType(Integer.parseInt(type));

                        question.setTopic(topic);
                        list.add(question);
                        question.setItems(itemsList);
                    }
                }

            }
            if (!sb.toString().equals("")) {
                // --------------批量保存
                return sb.toString();
            }
            for (Question question:list
                    ) {
                this.insert("SurveyQuestionMapper.insert",question);
               Long quetionId= question.getId();
                for (Items it:question.getItems()) {
                    it.setQuestionId(quetionId);
                    this.insert("SurveyItemsMapper.insert",it);
                }
            }
            list=null;
        } catch (BaseException e) {
            e.printStackTrace();
            sb.append("系统异常");
        }
        return sb.toString();
    }

    private Date getDateCellValue(XSSFCell cell) {
        Date value = cell.getDateCellValue();
       /* String date = getStringCellValue(cell);
        System.out.println(date);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date newDate = new Date();
        try {
            newDate = sdf.parse(date);
        } catch (Exception var5) {
            var5.printStackTrace();
        }*/
        return value;

    }
    public String getStringCellValue(XSSFCell cell) {
        String value = "";
        if (cell != null) {
            switch (cell.getCellType()) {
                case XSSFCell.CELL_TYPE_FORMULA:
                    break;
                case XSSFCell.CELL_TYPE_NUMERIC:
                    DecimalFormat df = new DecimalFormat("0");
                    value = df.format(cell.getNumericCellValue());
                    break;
                case XSSFCell.CELL_TYPE_STRING:
                    value = cell.getStringCellValue().trim();
                    break;
                default:
                    value = "";
                    break;
            }
        }
        return value.trim();
    }
    public Integer getIntCellValue(XSSFCell cell) {
        String stringValue = getStringCellValue(cell);
        if (stringValue == null || !NumberUtils.isDigits(stringValue)) {
            return null;
        }
        Integer intValue = null;
        try {
            intValue = Integer.parseInt(stringValue);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return intValue;
    }
}
