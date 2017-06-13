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
    <title>regist</title>
    <link href="css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/style.min862f.css?v=4.1.0" rel="stylesheet">
</head>
<body>
<div class="ibox float-e-margins">
    <div class="ibox-title">
        <h5>第二课堂成员注册</h5>
        <div class="ibox-tools">
            <a class="collapse-link">
                <i class="fa fa-chevron-up"></i>
            </a>
            <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
                <i class="fa fa-wrench"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="form_basic.html#">选项1</a>
                </li>
                <li><a href="form_basic.html#">选项2</a>
                </li>
            </ul>
            <a class="close-link">
                <i class="fa fa-times"></i>
            </a>
        </div>
    </div>
    <div class="ibox-content">
        <form class="form-horizontal m-t" id="signupForm" novalidate="novalidate">
            <div class="form-group">
                <label class="col-sm-3 control-label">姓氏：</label>
                <div class="col-sm-8">
                    <input id="firstname" name="firstname" class="form-control" type="text">
                    <span class="help-block m-b-none"><i class="fa fa-info-circle"></i> 这里写点提示的内容</span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">名字：</label>
                <div class="col-sm-8">
                    <input id="lastname" name="lastname" class="form-control" type="text" aria-required="true" aria-invalid="false">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">用户名：</label>
                <div class="col-sm-8">
                    <input id="username" name="username" class="form-control" type="text" aria-required="true" aria-invalid="true">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">密码：</label>
                <div class="col-sm-8">
                    <input id="password" name="password" class="form-control" type="password">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">确认密码：</label>
                <div class="col-sm-8">
                    <input id="confirm_password" name="confirm_password" class="form-control" type="password">
                    <span class="help-block m-b-none"><i class="fa fa-info-circle"></i> 请再次输入您的密码</span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-3 control-label">E-mail：</label>
                <div class="col-sm-8">
                    <input id="email" name="email" class="form-control" type="email">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-8 col-sm-offset-3">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" class="checkbox" id="agree" name="agree"> 我已经认真了解了第二课堂的基本信息
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-8 col-sm-offset-3">
                    <button class="btn btn-primary" type="submit">提交</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script src="js/jquery.min.js?v=2.1.4"></script>
<script src="js/bootstrap.min.js?v=3.3.6"></script>
<script src="js/content.min.js?v=1.0.0"></script>
<script src="js/plugins/validate/jquery.validate.min.js"></script>
<script src="js/plugins/validate/messages_zh.min.js"></script>
<script src="js/demo/form-validate-demo.min.js"></script>
<script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
</body>
</html>
