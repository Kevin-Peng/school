<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html;charstatic=utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charstatic="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>IBeauty后台管理系统</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="./static/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="./static/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="./static/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
  <link href='./static/css/css' rel='stylesheet' type='text/css' />

</head>







<style type="text/css">
    html,body{
    margin:auto;
    height:100%;}
</style> 


<body onload="myrefresh"
style="background:url(./static/img/back101.jpg) no-repeat center center;background-size:140% 100%;">
<div class="top" style="padding: 90px 0px 0px 0px">  </div>
    <div class="container"  >
        <div class="row text-center ">
            <div class="col-md-12">
                <br /><br />
                <h2>管理员登录</h2>
               
                
                 <br />
            </div>
        </div>
         <div class="row ">
               
                  <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offstatic-3 col-xs-10 col-xs-offstatic-1">
                        <div class="panel panel-default" border-color="blue">
                            <div class="panel-heading">
                        <strong>  输入登录信息 </strong>  
                            </div>
                            <div class="panel-body">
                                <form action="blogin.do" method="post">
                                     <br />
                                     <div class="form-group input-group">
                                            <span class="input-group-addon"><i class="fa fa-tag"  ><strong>用户名</strong></i></span>
                                            <input name="admname" type="text" class="form-control" placeholder="Your Username " />
                                            <br />
                                            

                                        </div>
                                      <div class="form-group input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock"  ><strong>密&nbsp;&nbsp;码</strong></i></span>
                                            <input name="pwd" type="password" class="form-control"  placeholder="Your Password" />
                                            <br />
                                            
                                           
                                      </div>
                                      ${success}
                                      ${pwderror}
                                      	
					
                                    <div class="form-group">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" /> 记住密码
                                            </label>
                                            

                                        </div>
                                     
                                     <input type="submit" class="btn btn-primary" value="登录">
                                    <hr />
                                    
                                    </form>
                            </div>
                           
                        </div>
                    </div>
                
                
        </div>
    </div>


     <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="./static/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="./static/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="./static/js/jquery.metisMenu.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="./static/js/custom.js"></script>
   
</body>
</html>

