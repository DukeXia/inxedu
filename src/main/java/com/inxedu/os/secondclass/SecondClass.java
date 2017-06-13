package com.inxedu.os.secondclass;

import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by lzq on 2017/6/13.
 */
@Controller
public class SecondClass {
    @RequestMapping("/secondclass/user/toRegist")
    public String regist() {
        return "secondclass/regist";
    }
}
