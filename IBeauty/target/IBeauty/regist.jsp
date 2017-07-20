<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>用户注册 - IBeauty</title>
    <link rel="stylesheet" href="./static/css/styl.css" type="text/css" />

    <style type="text/css">
        #login_part h2{
        position: relative;
        top: 20px;
        left: 10px;
    }
    #login_part form{
        position: relative;
        top: 20px;
        left: -10px;
    }
    </style>

</head>
<body>

<div class="main">

    <div class="header">
        <div class="page_header">
            <div id="logo">
                <a href="">
                    <span class="l_name"><img src="./static/img/I3.bmp"></span>
                    <span class="l_website"><img src="./static/img/BEAUTY5.png"></span>
                    <span class="l_slogan">美从这里开始</span>
                </a>
            </div>
        </div>
    </div>
      <nav class="topNav navDelay">
        <ul>
            <li>
                <div class="L1"><a href="">首页</a></div>
            </li>
            <li>
                <div class="L1"><a href="./login.jsp">登录</a></div>
            </li>
            <li>
                <div class="L1"><a href="#" class="gologin liAll">注册</a></div>
            </li>
        </ul>
    </nav>
    <div id="login_part" style="background:url(static/img/back8.jpg)no-repeat; width:100%;height">
        <div id="login_detail">
            <h2>欢迎注册&nbsp;<a href="">IBeauty</a></h2>
        <br/>
        <form name="loginForm" method="post">
            <dl>
                <dd>
                    <input name="username" size="30" type="text" placeholder="请输入您的Email"  value="">
                </dd>
                <br/>
                <dd>
                    <input name="password" size="30" type="password" placeholder="请输入您的密码">
                </dd>
                <br/>
                <dd>
                    <input name="valild" size="15" type="text" placeholder="请输入验证码" id="emailId">
                    &nbsp;<button onclick="check()">获取邮箱验证码</button>
                </dd>
                <br/>
                <dd>
                    <input name="password" size="30" type="password" placeholder="请输入您的密码">
                </dd>
                <br/>
                <dd>
                    <input name="password" size="30" type="password" placeholder="请确认您的密码">
                </dd>
                <dd>
                    <input type="submit" class="login_btn" value="立即注册">
                </dd>
                <dd>
                    <input type="checkbox" class="recept" checked name="recept">
                    <p><a href="help.html">我已看过并接受《用户协议》</a></p>
                </dd>
                <br/>
            </dl>
        </form>
        </div>
    </div>
    <div id="footinfo">
        <ul>
            <li><img src="./static/img/FAQ.png"><a href="help.html">&nbsp;帮助/FAQ</a></li>
            <li><img src="./static/img/send.png"><a href="help.html">&nbsp;配送服务</a></li>
            <li><img src="./static/img/about.png"><a href="help.html">&nbsp;关于我们</a></li>
            <li><img src="./static/img/connect.png"><a href="help.html">&nbsp;联系我们</a></li>
        </ul>
    </div>
    <div id="footer">
        <p>
            <a href="help.html" target="_blank" title="关于我们">关于我们</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="help.html" target="_blank" title="友情链接">友情链接</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="help.html" target="_blank" title="加入我们">加入我们</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="help.html" target="_blank" title="商务合作">商务合作</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="help.html" target="_blank" title="使用条款">使用条款</a>
        </p>
        <p>Copyright &copy; 2017 <a href="">IBeauty项目小组 </a> </p>
        <p><img src="./static/img/paypal.png" /></p>     
    </div>

</div>
<script type="text/javascript" src="./static/js/jquery-1.7.2.min.js"></script>
<script>

    function check(){
        alert(1)
        var email=$("#emailId").val();
        alert(email);
        $.ajax({
            url:'checkEmail.do?email='+email,
            async:false,
            success: function(data) {
                var str=data;
                alert(str);
            },
            error: function(e) {
                var str=e.responseText;
                alert(str);
            }
        })
    }
</script>
</body>
</html>
