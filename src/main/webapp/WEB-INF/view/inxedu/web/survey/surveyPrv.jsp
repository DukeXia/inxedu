<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1,user-scalable=no">
    <meta name="format-detection" content="telephone=no"/>
    <title>${questionare.title}</title>
    <script type="text/javascript">
        if (window.location.hash) {
            window.location.hash = "";
            window.location.href = window.location.href.replace("#", "");
        }
        var isWeiXin = 0;
    </script>
    <link rel="stylesheet" href="_demo.css"/>

    <script src="jquery-1.11.1.min.js"></script>

    <link href="rangeslider.css" rel="stylesheet" type="text/css"/>
    <script>var hasSlider = 1;</script>
    <script src="j6.js" type="text/javascript"></script>

    <script src="j2.js" type="text/javascript"></script>
    <script src="j258.js" type="text/javascript"></script>
    <style>


    </style>
</head>
<body>


<form id="form1" method="post" action="https://sojump.com/handler/processjq.ashx?curid=13789895">


    <div id="toptitle">
        <h1 class="htitle">
            ${questionare.title}</h1>
    </div>

    <div id="divLoadAnswer" style="display:none;background:#fffaea;padding:15px 10px;">
        <b style="color:red;">提示：</b>您上次作答没有成功提交，<a href="javascript:" onclick="loadAnswer();">加载上次答案</a>
    </div>


    <div id="divContent">
        <div id="divDesc" class="formfield">
            <span class="description">
                <div><span style="line-height:1.5;">${questionare.description}</span></div></span>
        </div>


        <div id="divQuestion">
            <fieldset class='fieldset' style='' id='fieldset1'>
                <div class='field ui-field-contain' id='div1' req='1' topic='1' data-role='fieldcontain' type='3'>
                    <div class='field-label'>1. 性别<span class='req'>*</span></div>
                    <div class='ui-controlgroup'>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='1' id='q1_1'
                                                                                  name='q1' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q1_1'>男</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='2' id='q1_2'
                                                                                  name='q1' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q1_2'>女</div>
                        </div>
                    </div>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div2' req='1' topic='2' data-role='fieldcontain' type='1'>
                    <div class='field-label'>2. 年龄（周岁）<span class='req'>*</span></div>
                    <div class='ui-input-text' style='position:relative;'><input type='text' id='q2' value=''
                                                                                 name='q2'/></div>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div3' req='1' topic='3' data-role='fieldcontain' type='1'>
                    <div class='field-label'>3. 您所在的学院、专业班级是什么？（如果您是以毕业的学生填写当时所在专业班级）<span class='req'>*</span></div>
                    <div class='ui-input-text' style='position:relative;'><input type='text' id='q3' value=''
                                                                                 name='q3'/></div>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div4' req='1' topic='4' data-role='fieldcontain' type='3'>
                    <div class='field-label'>4. 您认为学习大学数学课程的重要程度？<span class='req'>*</span></div>
                    <div class='ui-controlgroup'>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='1' id='q4_1'
                                                                                  name='q4' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q4_1'>不重要</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='2' id='q4_2'
                                                                                  name='q4' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q4_2'>有点重要</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='3' id='q4_3'
                                                                                  name='q4' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q4_3'>一般重要</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='4' id='q4_4'
                                                                                  name='q4' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q4_4'>很重要</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='5' id='q4_5'
                                                                                  name='q4' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q4_5'>非常重要</div>
                        </div>
                    </div>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div5' req='1' topic='5' data-role='fieldcontain' type='3'>
                    <div class='field-label'>5. 您对大学数学课程有兴趣吗<span class='req'>*</span></div>
                    <div class='ui-controlgroup'>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='1' id='q5_1'
                                                                                  name='q5' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q5_1'>没有兴趣</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='2' id='q5_2'
                                                                                  name='q5' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q5_2'>有点兴趣</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='3' id='q5_3'
                                                                                  name='q5' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q5_3'>一般有兴趣</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='4' id='q5_4'
                                                                                  name='q5' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q5_4'>很有兴趣</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='5' id='q5_5'
                                                                                  name='q5' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q5_5'>非常有兴趣</div>
                        </div>
                    </div>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div6' req='1' topic='6' data-role='fieldcontain' type='3'>
                    <div class='field-label'>6. 您平时能做到课前预习课后复习吗<span class='req'>*</span></div>
                    <div class='ui-controlgroup'>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='1' id='q6_1'
                                                                                  name='q6' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q6_1'>能</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='2' id='q6_2'
                                                                                  name='q6' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q6_2'>有时</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='3' id='q6_3'
                                                                                  name='q6' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q6_3'>不能</div>
                        </div>
                    </div>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div7' req='1' topic='7' data-role='fieldcontain' type='3'>
                    <div class='field-label'>7. 您认为在数学课堂中教师的授课方式和教学形式对您的情绪有影响吗<span class='req'>*</span></div>
                    <div class='ui-controlgroup'>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='1' id='q7_1'
                                                                                  name='q7' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q7_1'>无影响</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='2' id='q7_2'
                                                                                  name='q7' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q7_2'>有点影响</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='3' id='q7_3'
                                                                                  name='q7' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q7_3'>一般有影响</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='4' id='q7_4'
                                                                                  name='q7' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q7_4'>影响较多</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='5' id='q7_5'
                                                                                  name='q7' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q7_5'>非常有影响</div>
                        </div>
                    </div>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div8' req='1' topic='8' data-role='fieldcontain' type='3'>
                    <div class='field-label'>8. 您认为在数学课堂上教师的语言表达对您的情绪有影响吗？<span class='req'>*</span></div>
                    <div class='ui-controlgroup'>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='1' id='q8_1'
                                                                                  name='q8' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q8_1'>无影响</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='2' id='q8_2'
                                                                                  name='q8' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q8_2'>有点影响</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='3' id='q8_3'
                                                                                  name='q8' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q8_3'>一般有影响</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='4' id='q8_4'
                                                                                  name='q8' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q8_4'>影响较多</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='5' id='q8_5'
                                                                                  name='q8' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q8_5'>非常有影响</div>
                        </div>
                    </div>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div9' req='1' topic='9' data-role='fieldcontain' type='3'>
                    <div class='field-label'>9. 您认为在数学课堂中教师的形象（包括穿衣风格、长相等）对您上课的情绪有影响吗？<span class='req'>*</span></div>
                    <div class='ui-controlgroup'>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='1' id='q9_1'
                                                                                  name='q9' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q9_1'>无影响</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='2' id='q9_2'
                                                                                  name='q9' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q9_2'>有点影响</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='3' id='q9_3'
                                                                                  name='q9' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q9_3'>一般有影响</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='4' id='q9_4'
                                                                                  name='q9' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q9_4'>影响较多</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='5' id='q9_5'
                                                                                  name='q9' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q9_5'>非常有影响</div>
                        </div>
                    </div>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div10' req='1' topic='10' data-role='fieldcontain' type='3'>
                    <div class='field-label'>10. 您认为在数学课堂中教师的板书对您上课的情绪有影响吗？<span class='req'>*</span></div>
                    <div class='ui-controlgroup'>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='1' id='q10_1'
                                                                                  name='q10' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q10_1'>无影响</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='2' id='q10_2'
                                                                                  name='q10' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q10_2'>有点影响</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='3' id='q10_3'
                                                                                  name='q10' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q10_3'>一般有影响</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='4' id='q10_4'
                                                                                  name='q10' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q10_4'>影响较多</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='5' id='q10_5'
                                                                                  name='q10' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q10_5'>非常有影响</div>
                        </div>
                    </div>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div11' req='1' topic='11' data-role='fieldcontain' type='4'>
                    <div class='field-label'>11. 您喜欢的数学老师有哪些特征吸引你？<span class='req'>*</span><span class='qtypetip'>&nbsp;[多选题]</span>
                    </div>
                    <div class='ui-controlgroup'>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='1'
                                                                                     id='q11_1' name='q11'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q11_1'>有责任感</div>
                        </div>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='2'
                                                                                     id='q11_2' name='q11'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q11_2'>具有亲和力</div>
                        </div>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='3'
                                                                                     id='q11_3' name='q11'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q11_3'>有才华</div>
                        </div>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='4'
                                                                                     id='q11_4' name='q11'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q11_4'>有幽默感</div>
                        </div>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='5'
                                                                                     id='q11_5' name='q11'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q11_5'>有趣味性</div>
                        </div>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='6'
                                                                                     id='q11_6' name='q11'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q11_6'>有激情</div>
                        </div>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='7'
                                                                                     id='q11_7' name='q11'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q11_7'>互动多</div>
                        </div>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='8'
                                                                                     id='q11_8' name='q11'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q11_8'>讲课方式你比较喜欢</div>
                        </div>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='9'
                                                                                     id='q11_9' name='q11'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q11_9'>板书工整</div>
                        </div>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='10'
                                                                                     id='q11_10' name='q11'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q11_10'>外观、形象、声音是你喜欢的类型</div>
                        </div>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='11'
                                                                                     id='q11_11' name='q11'
                                                                                     rel='tqq11_11'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q11_11' style='border-bottom:none;'>其他</div>
                            <div class='ui-text'><input type='text' rel='q11_11' id='tqq11_11' class='OtherText'></div>
                            <br/></div>
                    </div>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div12' req='1' topic='12' data-role='fieldcontain' type='4'>
                    <div class='field-label'>12. 那些不受欢迎的老师身上那些特点使你感到不喜欢？<span class='req'>*</span><span
                            class='qtypetip'>&nbsp;[多选题]</span></div>
                    <div class='ui-controlgroup'>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='1'
                                                                                     id='q12_1' name='q12'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q12_1'>教学水平差</div>
                        </div>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='2'
                                                                                     id='q12_2' name='q12'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q12_2'>责任心不够</div>
                        </div>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='3'
                                                                                     id='q12_3' name='q12'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q12_3'>呆板严肃</div>
                        </div>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='4'
                                                                                     id='q12_4' name='q12'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q12_4'>上课形式单调、无趣味、没有激情</div>
                        </div>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='5'
                                                                                     id='q12_5' name='q12'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q12_5'>课堂板书不工整</div>
                        </div>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='6'
                                                                                     id='q12_6' name='q12'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q12_6'>语言表达方式</div>
                        </div>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='7'
                                                                                     id='q12_7' name='q12'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q12_7'>外观形象穿衣风格等</div>
                        </div>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='8'
                                                                                     id='q12_8' name='q12' rel='tqq12_8'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q12_8' style='border-bottom:none;'>其他</div>
                            <div class='ui-text'><input type='text' rel='q12_8' id='tqq12_8' class='OtherText'></div>
                            <br/></div>
                    </div>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div13' req='1' topic='13' data-role='fieldcontain' type='3'>
                    <div class='field-label'>13. 您在数学课堂中出现的那些情绪偏多<span class='req'>*</span></div>
                    <div class='ui-controlgroup'>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='1' id='q13_1'
                                                                                  name='q13' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q13_1'>愉快</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='2' id='q13_2'
                                                                                  name='q13' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q13_2'>希望</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='3' id='q13_3'
                                                                                  name='q13' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q13_3'>好奇</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='4' id='q13_4'
                                                                                  name='q13' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q13_4'>感兴趣</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='5' id='q13_5'
                                                                                  name='q13' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q13_5'>自豪</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='6' id='q13_6'
                                                                                  name='q13' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q13_6'>生气</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='7' id='q13_7'
                                                                                  name='q13' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q13_7'>焦虑</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='8' id='q13_8'
                                                                                  name='q13' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q13_8'>厌烦</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='9' id='q13_9'
                                                                                  name='q13' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q13_9'>放松</div>
                        </div>
                    </div>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div14' req='1' topic='14' data-role='fieldcontain' type='9'>
                    <div class='field-label'>14. 请您选择下列情绪在您的数学课堂中出现的比重<span class='req'>*</span></div>
                    <table cellspacing='0' class='matrix-rating'>
                        <tbody>
                        <tr id='drv14_1t'>
                            <td class='title' style='text-align:left;'>愉快</td>
                        </tr>
                        <tr id='drv14_1'>
                            <td>
                                <div><input type='tel' rowid='1' pattern='[0-9]*' class='ui-slider-input' id='q14_0'
                                            name='q14_0' min='0' max='100'/></div>
                            </td>
                        </tr>
                        <tr id='drv14_2t'>
                            <td class='title' style='text-align:left;'>希望</td>
                        </tr>
                        <tr id='drv14_2'>
                            <td>
                                <div><input type='tel' rowid='2' pattern='[0-9]*' class='ui-slider-input' id='q14_1'
                                            name='q14_1' min='0' max='100'/></div>
                            </td>
                        </tr>
                        <tr id='drv14_3t'>
                            <td class='title' style='text-align:left;'>好奇</td>
                        </tr>
                        <tr id='drv14_3'>
                            <td>
                                <div><input type='tel' rowid='3' pattern='[0-9]*' class='ui-slider-input' id='q14_2'
                                            name='q14_2' min='0' max='100'/></div>
                            </td>
                        </tr>
                        <tr id='drv14_4t'>
                            <td class='title' style='text-align:left;'>感兴趣</td>
                        </tr>
                        <tr id='drv14_4'>
                            <td>
                                <div><input type='tel' rowid='4' pattern='[0-9]*' class='ui-slider-input' id='q14_3'
                                            name='q14_3' min='0' max='100'/></div>
                            </td>
                        </tr>
                        <tr id='drv14_5t'>
                            <td class='title' style='text-align:left;'>自豪</td>
                        </tr>
                        <tr id='drv14_5'>
                            <td>
                                <div><input type='tel' rowid='5' pattern='[0-9]*' class='ui-slider-input' id='q14_4'
                                            name='q14_4' min='0' max='100'/></div>
                            </td>
                        </tr>
                        <tr id='drv14_6t'>
                            <td class='title' style='text-align:left;'>生气</td>
                        </tr>
                        <tr id='drv14_6'>
                            <td>
                                <div><input type='tel' rowid='6' pattern='[0-9]*' class='ui-slider-input' id='q14_5'
                                            name='q14_5' min='0' max='100'/></div>
                            </td>
                        </tr>
                        <tr id='drv14_7t'>
                            <td class='title' style='text-align:left;'>焦虑</td>
                        </tr>
                        <tr id='drv14_7'>
                            <td>
                                <div><input type='tel' rowid='7' pattern='[0-9]*' class='ui-slider-input' id='q14_6'
                                            name='q14_6' min='0' max='100'/></div>
                            </td>
                        </tr>
                        <tr id='drv14_8t'>
                            <td class='title' style='text-align:left;'>厌烦</td>
                        </tr>
                        <tr id='drv14_8'>
                            <td>
                                <div><input type='tel' rowid='8' pattern='[0-9]*' class='ui-slider-input' id='q14_7'
                                            name='q14_7' min='0' max='100'/></div>
                            </td>
                        </tr>
                        <tr id='drv14_9t'>
                            <td class='title' style='text-align:left;'>放松</td>
                        </tr>
                        <tr id='drv14_9'>
                            <td>
                                <div><input type='tel' rowid='9' pattern='[0-9]*' class='ui-slider-input' id='q14_8'
                                            name='q14_8' min='0' max='100'/></div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div15' req='1' topic='15' data-role='fieldcontain' type='4'>
                    <div class='field-label'>15. 您认为造成这种厌烦情绪的主要原因有哪些？<span class='req'>*</span><span class='qtypetip'>&nbsp;[多选题]</span>
                    </div>
                    <div class='ui-controlgroup'>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='1'
                                                                                     id='q15_1' name='q15'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q15_1'>上课老师授课方式不喜欢</div>
                        </div>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='2'
                                                                                     id='q15_2' name='q15'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q15_2'>上课教师的语言表达不清晰、逻辑性不强</div>
                        </div>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='3'
                                                                                     id='q15_3' name='q15'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q15_3'>上课教师的形象不喜欢</div>
                        </div>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='4'
                                                                                     id='q15_4' name='q15'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q15_4'>所学内容太难</div>
                        </div>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='5'
                                                                                     id='q15_5' name='q15'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q15_5'>对数学完全没有兴趣</div>
                        </div>
                        <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='6'
                                                                                     id='q15_6' name='q15'
                                                                                     style='display:none;'/><a
                                class='jqcheck' href='javascript:;'></a></span>
                            <div class='label' for='q15_6'>以前数学功底不好，学新知识跟不上从而厌学</div>
                        </div>
                    </div>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div16' req='1' topic='16' minvalue='-1' maxvalue='-1'
                     data-role='fieldcontain' type='11'>
                    <div class='field-label'>16. 请将您认为影响您上数学课程情绪的因素按照由多到少进行排列<span class='req'>*</span><span
                            class='qtypetip'>&nbsp;[排序题]</span></div>
                    <ul class='ui-controlgroup ui-listview'>
                        <li class='ui-li-static' style='cursor:pointer;'><input type='hidden' class='custom' value='1'
                                                                                id='q16_1' name='q16'><span
                                class='sortnum'></span><span>所学专业</span></li>
                        <li class='ui-li-static' style='cursor:pointer;'><input type='hidden' class='custom' value='2'
                                                                                id='q16_2' name='q16'><span
                                class='sortnum'></span><span>学校校风</span></li>
                        <li class='ui-li-static' style='cursor:pointer;'><input type='hidden' class='custom' value='3'
                                                                                id='q16_3' name='q16'><span
                                class='sortnum'></span><span>任课教师行为</span></li>
                        <li class='ui-li-static' style='cursor:pointer;'><input type='hidden' class='custom' value='4'
                                                                                id='q16_4' name='q16'><span
                                class='sortnum'></span><span>任课教师的教学方式及授课形式</span></li>
                        <li class='ui-li-static' style='cursor:pointer;'><input type='hidden' class='custom' value='5'
                                                                                id='q16_5' name='q16'><span
                                class='sortnum'></span><span>任课教师的语言表达</span></li>
                        <li class='ui-li-static' style='cursor:pointer;'><input type='hidden' class='custom' value='6'
                                                                                id='q16_6' name='q16'><span
                                class='sortnum'></span><span>任课教师的形象</span></li>
                        <li class='ui-li-static' style='cursor:pointer;'><input type='hidden' class='custom' value='7'
                                                                                id='q16_7' name='q16'><span
                                class='sortnum'></span><span>任课教师所书写的板书</span></li>
                        <li class='ui-li-static' style='cursor:pointer;'><input type='hidden' class='custom' value='8'
                                                                                id='q16_8' name='q16'><span
                                class='sortnum'></span><span>对数学学习的热情、兴趣</span></li>
                        <li class='ui-li-static' style='cursor:pointer;'><input type='hidden' class='custom' value='9'
                                                                                id='q16_9' name='q16'><span
                                class='sortnum'></span><span>数学学习的难易程度</span></li>
                        <li class='ui-li-static' style='cursor:pointer;'><input type='hidden' class='custom' value='10'
                                                                                id='q16_10' name='q16'><span
                                class='sortnum'></span><span>数学学习动机</span></li>
                        <li class='ui-li-static' style='cursor:pointer;'><input type='hidden' class='custom' value='11'
                                                                                id='q16_11' name='q16'><span
                                class='sortnum'></span><span>数学课程的衔接程度（以前对数学的掌握程度）</span></li>
                    </ul>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div17' req='1' topic='17' data-role='fieldcontain' type='3'>
                    <div class='field-label'>17. 您觉得大学数学的难易程度如何？<span class='req'>*</span></div>
                    <div class='ui-controlgroup'>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='1' id='q17_1'
                                                                                  name='q17' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q17_1'>没有难度</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='2' id='q17_2'
                                                                                  name='q17' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q17_2'>有一点难度</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='3' id='q17_3'
                                                                                  name='q17' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q17_3'>一般难</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='4' id='q17_4'
                                                                                  name='q17' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q17_4'>较难</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='5' id='q17_5'
                                                                                  name='q17' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q17_5'>非常难</div>
                        </div>
                    </div>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div18' req='1' topic='18' data-role='fieldcontain' type='3'>
                    <div class='field-label'>18. 您在大学期间所学数学课程的平均分大概在什么范围内？<span class='req'>*</span></div>
                    <div class='ui-controlgroup'>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='1' id='q18_1'
                                                                                  name='q18' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q18_1'>90分以上</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='2' id='q18_2'
                                                                                  name='q18' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q18_2'>80-90</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='3' id='q18_3'
                                                                                  name='q18' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q18_3'>70-80</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='4' id='q18_4'
                                                                                  name='q18' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q18_4'>60-70</div>
                        </div>
                        <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='5' id='q18_5'
                                                                                  name='q18' style='display:none;'/><a
                                class='jqradio' href='javascript:;'></a></span>
                            <div class='label' for='q18_5'>60分以下</div>
                        </div>
                    </div>
                    <div class='errorMessage'></div>
                </div>
                <div class='field ui-field-contain' id='div19' req='1' topic='19' total='100' data-role='fieldcontain'
                     type='12'>
                    <div class='field-label'>19. 请您将下列选项您认为影响你数学成绩的因素进行比重评估<span class='req'>*</span></div>
                    <table cellspacing='0' class='matrix-rating'>
                        <tbody>
                        <tr id='drv19_1t'>
                            <td class='title' style='text-align:left;'>1、数学学习动机（为了考试或某些奖等）</td>
                        </tr>
                        <tr id='drv19_1'>
                            <td>
                                <div><input rowid='1' type='tel' pattern='[0-9]*' class='ui-slider-input' id='q19'
                                            name='q19' min='0' max='100'/>
                            </td>
                </div>
                </tr>
                <tr id='drv19_2t'>
                    <td class='title' style='text-align:left;'>2、数学学习兴趣</td>
                </tr>
                <tr id='drv19_2'>
                    <td>
                        <div><input rowid='2' type='tel' pattern='[0-9]*' class='ui-slider-input' id='q19' name='q19'
                                    min='0' max='100'/>
                    </td>
        </div>
        </tr>
        <tr id='drv19_3t'>
            <td class='title' style='text-align:left;'>3、任课教师的行为、形象</td>
        </tr>
        <tr id='drv19_3'>
            <td>
                <div><input rowid='3' type='tel' pattern='[0-9]*' class='ui-slider-input' id='q19' name='q19' min='0'
                            max='100'/>
            </td>
    </div>
    </tr>
    <tr id='drv19_4t'>
        <td class='title' style='text-align:left;'>4、语言表达</td>
    </tr>
    <tr id='drv19_4'>
        <td>
            <div><input rowid='4' type='tel' pattern='[0-9]*' class='ui-slider-input' id='q19' name='q19' min='0'
                        max='100'/>
        </td>
        </div></tr>
    <tr id='drv19_5t'>
        <td class='title' style='text-align:left;'>5、授课方式等</td>
    </tr>
    <tr id='drv19_5'>
        <td>
            <div><input rowid='5' type='tel' pattern='[0-9]*' class='ui-slider-input' id='q19' name='q19' min='0'
                        max='100'/>
        </td>
        </div></tr>
    <tr id='drv19_6t'>
        <td class='title' style='text-align:left;'>4、数学学习能力</td>
    </tr>
    <tr id='drv19_6'>
        <td>
            <div><input rowid='6' type='tel' pattern='[0-9]*' class='ui-slider-input' id='q19' name='q19' min='0'
                        max='100'/>
        </td>
        </div></tr>
    <tr id='drv19_7t'>
        <td class='title' style='text-align:left;'>5、数学课程的衔接程度</td>
    </tr>
    <tr id='drv19_7'>
        <td>
            <div><input rowid='7' type='tel' pattern='[0-9]*' class='ui-slider-input' id='q19' name='q19' min='0'
                        max='100'/>
        </td>
        </div></tr>
    </tbody></table>
    <div class='relsum'></div>
    <div class='errorMessage'></div>
    </div>
    <div class='field ui-field-contain' id='div20' req='1' topic='20' data-role='fieldcontain' type='3'>
        <div class='field-label'>20. 您在数学课堂上的注意力容易集中吗？<span class='req'>*</span></div>
        <div class='ui-controlgroup'>
            <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='1' id='q20_1' name='q20'
                                                                      style='display:none;'/><a class='jqradio'
                                                                                                href='javascript:;'></a></span>
                <div class='label' for='q20_1'>很不容易</div>
            </div>
            <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='2' id='q20_2' name='q20'
                                                                      style='display:none;'/><a class='jqradio'
                                                                                                href='javascript:;'></a></span>
                <div class='label' for='q20_2'>不容易</div>
            </div>
            <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='3' id='q20_3' name='q20'
                                                                      style='display:none;'/><a class='jqradio'
                                                                                                href='javascript:;'></a></span>
                <div class='label' for='q20_3'>一般</div>
            </div>
            <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='4' id='q20_4' name='q20'
                                                                      style='display:none;'/><a class='jqradio'
                                                                                                href='javascript:;'></a></span>
                <div class='label' for='q20_4'>容易</div>
            </div>
            <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='5' id='q20_5' name='q20'
                                                                      style='display:none;'/><a class='jqradio'
                                                                                                href='javascript:;'></a></span>
                <div class='label' for='q20_5'>非常容易</div>
            </div>
        </div>
        <div class='errorMessage'></div>
    </div>
    <div class='field ui-field-contain' id='div21' req='1' topic='21' minvalue='1' data-role='fieldcontain' type='4'>
        <div class='field-label'>21. 您在大学学过的数学课程哪些是你比较喜欢的？<span class='req'>*</span><span
                class='qtypetip'>&nbsp;[<b>最少</b>选择<b>1</b>项]</span></div>
        <div class='ui-controlgroup'>
            <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='1' id='q21_1' name='q21'
                                                                         style='display:none;'/><a class='jqcheck'
                                                                                                   href='javascript:;'></a></span>
                <div class='label' for='q21_1'>高等数学</div>
            </div>
            <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='2' id='q21_2' name='q21'
                                                                         style='display:none;'/><a class='jqcheck'
                                                                                                   href='javascript:;'></a></span>
                <div class='label' for='q21_2'>线性代数</div>
            </div>
            <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='3' id='q21_3' name='q21'
                                                                         style='display:none;'/><a class='jqcheck'
                                                                                                   href='javascript:;'></a></span>
                <div class='label' for='q21_3'>概率论与数理统计</div>
            </div>
            <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='4' id='q21_4' name='q21'
                                                                         style='display:none;'/><a class='jqcheck'
                                                                                                   href='javascript:;'></a></span>
                <div class='label' for='q21_4'>数学分析</div>
            </div>
            <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='5' id='q21_5' name='q21'
                                                                         style='display:none;'/><a class='jqcheck'
                                                                                                   href='javascript:;'></a></span>
                <div class='label' for='q21_5'>高等代数</div>
            </div>
            <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='6' id='q21_6' name='q21'
                                                                         style='display:none;'/><a class='jqcheck'
                                                                                                   href='javascript:;'></a></span>
                <div class='label' for='q21_6'>解析几何</div>
            </div>
            <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='7' id='q21_7' name='q21'
                                                                         style='display:none;'/><a class='jqcheck'
                                                                                                   href='javascript:;'></a></span>
                <div class='label' for='q21_7'>概率论</div>
            </div>
            <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='8' id='q21_8' name='q21'
                                                                         style='display:none;'/><a class='jqcheck'
                                                                                                   href='javascript:;'></a></span>
                <div class='label' for='q21_8'>数理统计</div>
            </div>
            <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='9' id='q21_9' name='q21'
                                                                         style='display:none;'/><a class='jqcheck'
                                                                                                   href='javascript:;'></a></span>
                <div class='label' for='q21_9'>多元统计分析</div>
            </div>
            <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='10' id='q21_10'
                                                                         name='q21' style='display:none;'/><a
                    class='jqcheck' href='javascript:;'></a></span>
                <div class='label' for='q21_10'>数学建模</div>
            </div>
            <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='11' id='q21_11'
                                                                         name='q21' style='display:none;'/><a
                    class='jqcheck' href='javascript:;'></a></span>
                <div class='label' for='q21_11'>数值分析</div>
            </div>
            <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='12' id='q21_12'
                                                                         name='q21' style='display:none;'/><a
                    class='jqcheck' href='javascript:;'></a></span>
                <div class='label' for='q21_12'>常微分方程</div>
            </div>
            <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='13' id='q21_13'
                                                                         name='q21' style='display:none;'/><a
                    class='jqcheck' href='javascript:;'></a></span>
                <div class='label' for='q21_13'>复变函数</div>
            </div>
            <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='14' id='q21_14'
                                                                         name='q21' style='display:none;'/><a
                    class='jqcheck' href='javascript:;'></a></span>
                <div class='label' for='q21_14'>离散数学</div>
            </div>
            <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='15' id='q21_15'
                                                                         name='q21' style='display:none;'/><a
                    class='jqcheck' href='javascript:;'></a></span>
                <div class='label' for='q21_15'>初等数论</div>
            </div>
            <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='16' id='q21_16'
                                                                         name='q21' style='display:none;'/><a
                    class='jqcheck' href='javascript:;'></a></span>
                <div class='label' for='q21_16'>模糊数学</div>
            </div>
            <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='17' id='q21_17'
                                                                         name='q21' rel='tqq21_17'
                                                                         style='display:none;'/><a class='jqcheck'
                                                                                                   href='javascript:;'></a></span>
                <div class='label' for='q21_17' style='border-bottom:none;'>其他</div>
                <div class='ui-text'><input type='text' rel='q21_17' id='tqq21_17' class='OtherText'></div>
                <br/></div>
        </div>
        <div class='errorMessage'></div>
    </div>
    <div class='field ui-field-contain' id='div22' topic='22' data-role='fieldcontain' type='1'>
        <div class='field-label'>22. 您为什么对这些课程感兴趣？</div>
        <div class='ui-input-text' style='position:relative;'><input type='text' id='q22' value='' name='q22'/></div>
        <div class='errorMessage'></div>
    </div>
    <div class='field ui-field-contain' id='div23' req='1' topic='23' data-role='fieldcontain' type='3'>
        <div class='field-label'>23. 您觉得大学数学课程的学习对你的以后工作生活有帮助吗？<span class='req'>*</span></div>
        <div class='ui-controlgroup'>
            <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='1' id='q23_1' name='q23'
                                                                      style='display:none;'/><a class='jqradio'
                                                                                                href='javascript:;'></a></span>
                <div class='label' for='q23_1'>没有</div>
            </div>
            <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='2' id='q23_2' name='q23'
                                                                      style='display:none;'/><a class='jqradio'
                                                                                                href='javascript:;'></a></span>
                <div class='label' for='q23_2'>很少</div>
            </div>
            <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='3' id='q23_3' name='q23'
                                                                      style='display:none;'/><a class='jqradio'
                                                                                                href='javascript:;'></a></span>
                <div class='label' for='q23_3'>一般</div>
            </div>
            <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='4' id='q23_4' name='q23'
                                                                      style='display:none;'/><a class='jqradio'
                                                                                                href='javascript:;'></a></span>
                <div class='label' for='q23_4'>较多</div>
            </div>
            <div class='ui-radio'><span class='jqradiowrapper'><input type='radio' value='5' id='q23_5' name='q23'
                                                                      style='display:none;'/><a class='jqradio'
                                                                                                href='javascript:;'></a></span>
                <div class='label' for='q23_5'>非常有帮助</div>
            </div>
        </div>
        <div class='errorMessage'></div>
    </div>
    <div class='field ui-field-contain' id='div24' req='1' topic='24' minvalue='1' data-role='fieldcontain' type='4'>
        <div class='field-label'>24. 您为了什么而学习数学或您是一怎样的心态上数学课？<span class='req'>*</span><span class='qtypetip'>&nbsp;[<b>最少</b>选择<b>1</b>项]</span>
        </div>
        <div class='ui-controlgroup'>
            <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='1' id='q24_1' name='q24'
                                                                         style='display:none;'/><a class='jqcheck'
                                                                                                   href='javascript:;'></a></span>
                <div class='label' for='q24_1'>对数学很感兴趣</div>
            </div>
            <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='2' id='q24_2' name='q24'
                                                                         style='display:none;'/><a class='jqcheck'
                                                                                                   href='javascript:;'></a></span>
                <div class='label' for='q24_2'>认为数学能开发头脑能使大脑变得灵活</div>
            </div>
            <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='3' id='q24_3' name='q24'
                                                                         style='display:none;'/><a class='jqcheck'
                                                                                                   href='javascript:;'></a></span>
                <div class='label' for='q24_3'>为了考研</div>
            </div>
            <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='4' id='q24_4' name='q24'
                                                                         style='display:none;'/><a class='jqcheck'
                                                                                                   href='javascript:;'></a></span>
                <div class='label' for='q24_4'>觉得今后工作生活可能会用到</div>
            </div>
            <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='5' id='q24_5' name='q24'
                                                                         style='display:none;'/><a class='jqcheck'
                                                                                                   href='javascript:;'></a></span>
                <div class='label' for='q24_5'>应付考试</div>
            </div>
            <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='6' id='q24_6' name='q24'
                                                                         style='display:none;'/><a class='jqcheck'
                                                                                                   href='javascript:;'></a></span>
                <div class='label' for='q24_6'>专业要求不得不学</div>
            </div>
            <div class='ui-checkbox'><span class='jqcheckwrapper'><input type='checkbox' value='7' id='q24_7' name='q24'
                                                                         rel='tqq24_7' style='display:none;'/><a
                    class='jqcheck' href='javascript:;'></a></span>
                <div class='label' for='q24_7' style='border-bottom:none;'>其他</div>
                <div class='ui-text'><input type='text' rel='q24_7' id='tqq24_7' class='OtherText'></div>
                <br/></div>
        </div>
        <div class='errorMessage'></div>
    </div>
    <div class='field ui-field-contain' id='div25' topic='25' data-role='fieldcontain' type='2'>
        <div class='field-label'>25. 您认为当前数学课堂教师的授课方式或上课形式语言表达等相关方面应该做出那些改进，请给出合理性建议</div>
        <div class='ui-input-text'><textarea rows='5' style='max-height:100px;' id='q25' name='q25' value=''></textarea>
        </div>
        <div class='errorMessage'></div>
    </div>
    </fieldset>
    </div>
    <div id="divMatrixRel" style="position: absolute; display: none; width: 80%; margin: 0 10%;"
         class="ui-input-text">
        <input type="text" placeholder="请注明..." id="matrixinput" style="min-height: 2em;
                width: 100%; padding: 0.3em 0.6em;"/>
    </div>
    <div class="shopcart" id="shopcart" style="display:none;">
    </div>
    <div class="footer">
        <div class="ValError">
        </div>
        <div id="divSubmit" style="padding: 10px; display:none;">
            <div id="tdCode" style="display: none;padding-bottom:15px;">
                <table>
                    <tr>
                        <td class="ui-input-text nofocus">
                            <input id="yucinput" size="14" maxlength="10" type="text" name="yucinput"/>
                        </td>
                        <td>
                            <div id="divCaptcha" style="display: none;">
                                <img alt="验证码" title="看不清吗？点击可以刷新" captchaid="" instanceid="">
                            </div>
                        </td>
                        <td>
                            &nbsp;&nbsp;<img id="imgCode" alt="验证码" title="看不清吗？点击可以刷新" style="vertical-align: bottom;
                                    cursor: pointer; display: none;"/>
                        </td>
                    </tr>
                </table>
            </div>
            <a id="ctlNext" href="javascript:;" class="button blue">
                提交</a>
            <div style="margin:0px 0 10px; padding-top:10px;">
                <a href="/urlreport.aspx?url=13789895" style="float: right;color:#aaa;font-size:13px;" class="reportto">
                    举报</a>
                <div style="clear: both;">
                </div>
            </div>
        </div>

        <div id='divMaxTime' style="display: none; background: #f5faf2;  color: #7c7c7c; font-size: 18px; height: 42px;
                left: 0; line-height: 40px; position: fixed; text-align: center; top: 0; width: 100%;
                z-index: 100;">
            <span id="spanTimeTip">本页剩余作答时间</span>&nbsp;<span
                style="color: Red; font-size: 16px; display: inline-block;"
                id='spanMaxTime'></span>
        </div>

    </div>

    </div>


    <div id="divPowerBy" style="margin: 0 auto;" class="logofooter">
        <div class='wjfooter'><a href='http://www.sojump.com/mobile/index.aspx' target='_blank'
                                 title='问卷星-专业的在线问卷调查、测评、投票平台'>问卷星</a>&nbsp;提供技术支持
        </div>
    </div>

    <input type="hidden" value="1" id="action" name="action"/>
    <input type="hidden" value="2017/5/6 16:04:11" id="starttime" name="starttime"/>
    <input type="hidden" value="directphone" id="source" name="source"/>
</form>
<a id='lnkCity' style="display: none;"></a>
<a href="javascript:;" class="scrolltop" style="display:none;"></a>
<script type="text/javascript">
    var activityId = 13789895;
    var isYdb = 0;
    var isPub = 0;
    var cqType = 1;
    var isDingDing = 0;
    var ddcorpid = "";
    var sojumpParm = '';
    var isKaoShi = 0;
    var lastTopic = 0;
    var Password = "";
    var guid = "";
    var udsid = 0;
    var langVer = 0;
    var cProvince = "";
    var cCity = "";
    var cIp = "";
    var divTip = document.getElementById("divTip");
    var displayPrevPage = "none";
    var inviteid = '';
    var access_token = "";
    var openid = "";
    var isQQLogin = 0;
    var wxthird = 0;
    var hashb = 0;
    var sjUser = '';
    var outuser = '';
    var outsign = '';
    var sourceurl = '';
    var sourcename = "";
    var isSimple = '';
    var jiFenBao = 0;
    var cAlipayAccount = "";
    var isRunning = 1;
    var SJBack = '';
    var jiFen = "0";
    var ItemDicData = "";
    var rndnum = "1864122581.43504279";
    var totalPage = 1;
    var totalCut = 0;
    var cepingCandidate = "";
    var cpid = "";
    var needSaveJoin = 0;
    var qBeginDate = "1494035601750";
    var randomMode = 0;
    var fisrtLoadTime = new Date().getTime();


    var needHBAlert = 0;
    if (needHBAlert) {
        if (needHBAlert == -1)
            alert("请注意：此问卷红" + "包已被之前参与的用户领取完");
        else if (needHBAlert == -2)
            alert("请注意：抽中红" + "包后答卷还需要发布者审核，通过审核后才能发放红" + "包！");
        else if (needHBAlert == -3)
            alert("提示：只有通过微信作答才能抽取红" + "包");
        else
            alert("请注意：每个参与者填完问卷后有1/" + needHBAlert + "的概率抽中红" + "包");
    }
    var needAwardAlert = 0;
    if (needAwardAlert) {
        if (needAwardAlert < 0)
            alert("请注意：此问卷奖品已被之前参与的用户领取完");
        else if (needAwardAlert == 999)
            alert("请注意：此问卷平均每天低于1人抽中奖品");
        else if (needAwardAlert % 1000 == 0)
            alert("请注意：此问卷平均每天会有" + (needAwardAlert / 1000) + "人抽中奖品");
        else
            alert("请注意：每个参与者填完问卷后有1/" + needAwardAlert + "的概率抽中奖品");
    }
</script>


<script type="text/javascript">
    var needAvoidCrack = 0;
    var tdCode = "tdCode";
    var imgCode = $("#imgCode")[0];
    var submit_text = $("#yucinput")[0];
    var tCode = $("#" + tdCode)[0];
    var hasTouPiao = 0;
</script>

<script src="j3.js" type="text/javascript"></script>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
</script>


<div style="display:none;">
    <script src="https://s13.cnzz.com/z_stat.php?id=4478442&web_id=4478442" language="JavaScript"></script>
</div>
<script>
    $(function () {
        if (window._czc) {
            var isVip = 0;
            var evvtype = "免费版";
            if (isVip) evvtype = "企业版";
            _czc.push(["_trackEvent", "移动端JQ", evvtype, cqType]);
        }
    });
</script>

</body>
</html>
