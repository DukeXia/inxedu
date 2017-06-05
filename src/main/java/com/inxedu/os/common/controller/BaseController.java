//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by Fernflower decompiler)
//

package com.inxedu.os.common.controller;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.inxedu.os.common.util.DateEditor;

import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inxedu.os.nstar.appointment.controller.ExcelFileGenerator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

public class BaseController {
    public static Gson gson = (new GsonBuilder()).setDateFormat("yyyy-MM-dd HH:mm:ss").create();
    protected static final String SIMPLE_VIEW_PATH = "inxedu";
    private static final Logger logger = LoggerFactory.getLogger(BaseController.class);

    public BaseController() {
    }

    @InitBinder({"page"})
    public void initBinderPage(WebDataBinder binder) {
        binder.setFieldDefaultPrefix("page.");
    }

    public static String getViewPath(String path) {
        return path != null && !path.trim().equals("")?"inxedu" + path:"";
    }

    public Map<String, Object> setJson(boolean success, String message, Object entity) {
        HashMap json = new HashMap();
        json.put("success", Boolean.valueOf(success));
        json.put("message", message);
        json.put("entity", entity);
        return json;
    }

    public String setExceptionRequest(HttpServletRequest request, Exception e) {
        logger.error(request.getContextPath(), e);
        StackTraceElement[] messages = e.getStackTrace();
        if(messages != null && messages.length > 0) {
            StringBuffer buffer = new StringBuffer();
            buffer.append(e.toString()).append("<br/>");

            for(int i = 0; i < messages.length; ++i) {
                buffer.append(messages[i].toString()).append("<br/>");
            }

            request.setAttribute("myexception", buffer.toString());
        }

        return "/common/error";
    }

    public Map<String, Object> setAjaxException(Map<String, Object> map) {
        map.put("success", Boolean.valueOf(false));
        map.put("message", "系统繁忙，请稍后再操作！");
        map.put("entity", (Object)null);
        return map;
    }

    @InitBinder
    protected void initBinder(HttpServletRequest request, ServletRequestDataBinder binder) throws Exception {
        binder.registerCustomEditor(Date.class, new DateEditor());
    }
    public void exportFiletoExcel(ArrayList<String> headlist,
                                  ArrayList<ArrayList<String>> dataList, String type,
                                  HttpServletResponse response) throws Exception {
        ExcelFileGenerator excelFileGenerator = new ExcelFileGenerator(
                headlist, dataList);
        /** 导出报表的文件名 */
        String filename = type + "报表（" + dateToStringWithExcel(new Date())
                + "）.xls";
        // 处理乱码
        filename = new String(filename.getBytes("gbk"), "iso-8859-1");
        /** response中进行设置，总结下载，导出，需要io流和头 */
        response.setContentType("application/vnd.ms-excel");
        response.setHeader("Content-disposition", "attachment;filename="
                + filename);
        response.setBufferSize(1024);
        // 获取输出流
        OutputStream os = response.getOutputStream();
        excelFileGenerator.expordExcel(os);// 使用输出流，导出
    }

    public   String dateToStringWithExcel(Date date) {
        String sDate = new SimpleDateFormat("yyyy-MM-ddHHmmss").format(date);
        return sDate;
    }

}
