<%@ page language="java" import="java.util.*" pageEncoding="utf-8" 
contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>IBauty后台管理系统</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="../static/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="../static/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="../static/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="../static/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='../static/css/css' rel='stylesheet' type='text/css' />
   <!-- TABLE STYLES-->
   <link href="../static/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />

    
          

</head>
<body>
<div class="adcenter"></div>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
               
                <a class="navbar-brand" href="index.jsp">后台管理</a> 
            </div>
                    <div style="color: white;
            padding: 13px 50px 5px 50px;float: right;font-size: 16px;">
            <div id="time" float="left" style="float:left;padding: 15px 50px 5px 550px;"> </div><script type="text/javascript" src="http://网站的网址/time.js"></script>
             <script type="text/javascript" language="javascript">// <![CDATA[
window.onload=function (){
setInterval("document.getElementById('time').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
}
// ]]></script>              

    &nbsp; <a href="../blogin.jsp" class="btn btn-danger square-btn-adjust">退出</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                <li class="text-center">
                    <img src="../static/img/find_user.png" class="user-image img-responsive"/>
                    </li>
                
                    
                     <li>
                        <a   href="sale.jsp"><img src="../static/img/black.png" >后台主页</a>
                    </li>
                    <li>
                        <a  href="../Mycomment.do"   method="post"  ><img src="../static/img/black.png" >反馈模块</a>
                    </li>
                           <li  >
                        <a   href="../Users.do"   method="post" class="active-menu"> <img src="../static/img/red.png" >客户模块</a>
                    </li>   
                     <li  >
                        <a  href="../Iproduct.do"   method="post" ><img src="../static/img/black.png" >商品模块</a>
                    </li>
                    <li>
                        <a  href="../Ordered.do" method="post"><img src="../static/img/black.png" > 订单模块 </a>
                    </li>               
                </ul>
            </div>
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>客户信息</h2>   
                        <h5>欢迎回来！ </h5>
                       
                    </div>
                </div>
                
                   <hr />


                 


                        
                 
               
            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             客户表
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example"> 
                                    <thead>
                                        <tr>
                                            <th>用户ID</th>
                                            <th>邮箱</th>
                                            <th>用户名</th>
                                            <th>密码</th>                                            
                                            <th>用户等级</th>
                                            <th>邮箱验证情况</th>
                                            <th>验证码</th>
                                            <th>上次登录时间</th>
                                            <th>上次登录IP</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${userList}" var="user">
                                        <tr class="odd gradeX">
                                            <td>${user.id}</td>
                                            <td>${user.email}</td>
                                            <td>${user.nickname}</td>
                                            <td class="center">${user.pwd}</td>
                                            <td class="center">${user.user_integral}</td>
                                            <td class="center">${user.is_email_verify}</td>
                                            <td class="center">${user.email_verify_code}</td>
                                            <td class="center">${user.last_login_time}</td>
                                            <td class="center">${user.last_login_ip}</td>
                                            <td class="center" >
                                            <a href="../deluser.do?userid=${user.id}"><input type="button" value="删除" onclick="return confirm('确认删除？');" >
                                            </a>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                        
                                        
                                    </tbody>
                                </table>
                            </div>
                            </div>
                      
                    </div>
                  
                    <!--  end  Context Classes  -->
                </div>
            </div>
                <!-- /. ROW  -->
        </div>
               
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="../static/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="../static/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="../static/js/jquery.metisMenu.js"></script>
     <!-- DATA TABLE SCRIPTS -->
    <script src="../static/js/dataTables/jquery.dataTables.js"></script>
    <script src="../static/js/dataTables/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
            });
    </script>
         <!-- CUSTOM SCRIPTS -->
    <script src="../static/js/custom.js"></script>
    
   
</body>
</html>