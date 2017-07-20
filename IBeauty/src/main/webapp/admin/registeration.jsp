<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Free Bootstrap set Template : Binary set</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href='css/custom.css' rel='stylesheet' />
     <!-- GOOGLE FONTS-->
   <link href='css/css' rel='stylesheet' type='text/css' />

</head>

<style type="text/css">
html,body{

    margin:auto;
    height:100%;

  }

</style> 
<body style="background:url(img/back101.jpg) no-repeat center center;background-size:140% 100%;">
<div class="adcenter" style="padding: 90px 50px 5px 50px"></div>
    <div class="container">
        <div class="row text-center  ">
            <div class="col-md-12">
                <br /><br />
                <h2>管理员注册</h2>
               
                
                 <br />
            </div>
        </div>
         <div class="row">
               
                <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                        <strong>  新用户 ? 请进行注册 </strong>  
                            </div>
                            <div class="panel-body">
                                <form role="form">
<br/>
                                        <div class="form-group input-group">
                                            <span class="input-group-addon"><strong>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</strong></span>
                                            <input type="text" class="form-control" placeholder="Your Name" />
                                        </div>
                                     <div class="form-group input-group">
                                            <span class="input-group-addon"><strong>注册名称</strong></span>
                                            <input type="text" class="form-control" placeholder="Desired Username" />
                                        </div>
                                         <div class="form-group input-group">
                                            <span class="input-group-addon"><strong>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</strong></span>
                                            <input type="text" class="form-control" placeholder="Your Email" />
                                        </div>
                                      <div class="form-group input-group">
                                            <span class="input-group-addon"><strong>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</strong></span>
                                            <input type="password" class="form-control" placeholder="Enter Password" />
                                        </div>
                                     <div class="form-group input-group">
                                            <span class="input-group-addon"><strong>重复密码</strong></span>
                                            <input type="password" class="form-control" placeholder="Retype Password" />
                                        </div>
                                     
                                     <a href="login.html" class="btn btn-success ">注册</a>
                                    <hr />
                                    已经注册 ?  <a href="login.html" >登录</a>
                                    </form>
                            </div>
                           
                        </div>
                    </div>
                
                
        </div>
    </div>


     <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="js/jquery.metisMenu.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="js/custom.js"></script>
   
</body>
</html>
