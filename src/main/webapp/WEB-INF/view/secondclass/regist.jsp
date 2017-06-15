<%--
  Created by IntelliJ IDEA.
  User: lzq
  Date: 2017/6/13
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>第二课堂</title>
    <link rel="stylesheet" href="${ctximg}/static/secondclass/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${ctximg}/static/secondclass/css/bootstrapValidator.min.css"/>

    <script type="text/javascript" src="${ctx }/static/secondclass/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx }/static/secondclass/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/secondclass/js/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/secondclass/js/language/zh_CN.js"></script>
    <style>
     span{
         color: rgba(100,50,255,0.2);
         text-shadow: 1px 2px #b0edff;
     }
      /*.btn-my{
          color: rgba(203, 255, 35, 0.5);
      }*/
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-lg-8 col-lg-offset-2">
            <div class="page-header">
                <h2>第二课堂新生<span>注册</span></h2>
            </div>
            <form id="defaultForm" method="post" class="form-horizontal" action="#">
                <div class="form-group">
                    <label class="col-lg-3 control-label">学号</label>
                    <div class="col-lg-5">
                        <input type="text" class="form-control" placeholder="请输入学号" name="studentNo"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">姓名</label>
                    <div class="col-lg-5">
                        <input type="text" class="form-control" placeholder="请输入姓名" name="name"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">班级</label>
                    <div class="col-lg-5">
                        <input type="text" class="form-control" placeholder="请输入班级" name="classname"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label">学院</label>
                    <div class="col-lg-5">
                        <input type="text" class="form-control" placeholder="请输入学院" name="college"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">指导老师</label>
                    <div class="col-lg-5">
                        <input type="text" class="form-control" placeholder="请输入指导老师" name="teacherName"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">兴趣方向</label>
                    <div class="col-lg-5">
                        <select name="avocation" class="form-control">
                            <option value="">==请选择==</option>
                            <option value="Java程序设计">Java程序设计</option>
                            <option value="Android与IOS等手机研发">Android与微信等手机开发</option>
                            <option value="服务器运维与网络安全">服务器运维与网络安全</option>
                            <option value="微信公众号与小程序研发">微信公众号与小程序研发</option>
                            <option value="页面设计">页面设计</option>
                        </select>
                        <%--<input type="text" class="form-control" name="avocation"/>--%>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">学习目标</label>
                    <div class="col-lg-5">
                        <input type="text" class="form-control" name="studyTarget"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">手机</label>
                    <div class="col-lg-5">
                        <input type="text" class="form-control" placeholder="请输入手机号" name="mobile"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">QQ</label>
                    <div class="col-lg-5">
                        <input type="text" class="form-control" placeholder="请输入qq号码" name="qq"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-3 control-label">微信</label>
                    <div class="col-lg-5">
                        <input type="text" class="form-control" placeholder="请输入微信号" name="weichat"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-lg-3 control-label">邮箱</label>
                    <div class="col-lg-5">
                        <input type="text" class="form-control" placeholder="请输入你的邮箱号码" name="email"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-9 col-lg-offset-3">
                        <button type="button" onclick="regist()" class="btn btn-primary btn-my">注册</button>
                    </div>
                </div>


            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('#defaultForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                studentNo: {
                    message: '学号不是有效的',
                    validators: {
                        notEmpty: {
                            message: '学号不能为空'
                        },
                        stringLength: {
                            min: 10,
                            max: 10,
                            message: '学号为10位数字'
                        },
                        numeric: {
                            message: '学号只能输入数字'
                        }
                    }
                },
                name: {
                    validators: {
                        notEmpty: {
                            message: '姓名不能为空'
                        },
                        stringLength: {
                            max: 15,
                            message: '姓名不能超过15位'
                        },
                        regexp:{
                            regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                            message: '姓名不能全是数字'
                        }
                    }
                },
                classname: {
                    validators: {
                        notEmpty: {
                            message: '班级不能为空'
                        },
                        stringLength: {
                            max: 15,
                            message: '班级不能超过15位'
                        }
                    }
                },
                college: {
                    validators: {
                        notEmpty: {
                            message: '学院不能为空'
                        },
                        stringLength: {
                            max: 15,
                            message: '学院不能超过15位'
                        }
                    }
                },
                teacherName: {
                    validators: {
                        notEmpty: {
                            message: '指导老师不能为空'
                        }
                    }
                },
                studyTarget: {
                    validators: {
                        notEmpty: {
                            message: '学习目标不能为空'
                        }
                    }
                },
                mobile: {
                    validators: {
                        notEmpty: {
                            message: '手机号不能为空'
                        },
                        stringLength: {
                            min:11,
                            max: 11,
                            message: '请输入11位的手机号'
                       },
                         regexp:{
                              regexp: /^1[3|5|8]{1}[0-9]{9}$/,
                              message: '请输入正确的手机号'
                         }
                    }
                },
                qq: {
                    validators: {
                        notEmpty: {
                            message: 'qq不能为空'
                        },
                        regexp: {
                            regexp: /^[1-9][0-9]{4,9}$/,
                            message: '请输入正确的QQ号'
                        }
                    }
                },
                avocation: {
                    validators: {
                        notEmpty: {
                            message: '兴趣方向不能为空'
                        }
                    }
                },
                weichat: {
                    validators: {
                        notEmpty: {
                            message: '微信不能为空'
                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty: {
                            message: '邮箱不能为空'
                        },
                        emailAddress: {
                            message: '邮箱格式不正确'
                        }
                    }
                }
            }
        });
    });

    function regist() {
        var bootstrapValidator = $("#defaultForm").data('bootstrapValidator');
        bootstrapValidator.validate();
        if (bootstrapValidator.isValid()) {
            $.ajax({
                url: "/secondclass/user/regist",
                type: "POST",
                dataType: "json",
                data: $("#defaultForm").serialize(),
                success: function (data) {
                    if (data.success) {
                        alert(data.message);
                        location.href = "/";
                    }else {
                        alert(data.message);
                    }
                },
                error: function (error) {

                }

            });
        }
    }
</script>
</body>
</html>
