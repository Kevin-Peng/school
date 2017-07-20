<%@ page language="java" import="java.util.*" pageEncoding="utf-8" 
contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="cn.IBeauty.po.MyCommentt,cn.IBeauty.dao.MycommentDAO" %>

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
        <!-- CUSTOM STYLES-->
    <link href="../static/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
        <!-- GOOGLE FONTS-->
   <link href='../static/css/css' rel='stylesheet' type='text/css' />

   <!-- TABLE STYLES-->
    <link href="../static/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
     <script language="javascript"> 
    function delcfm() { 
        if (!confirm("确认要删除？")) { 
            window.event.returnValue = false; 
        } 
    } 
</script>
</head>
<body>
<div class="adcenter"></div>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
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
                        <a   href="sale.jsp"><img src="../static/img/black.png" ></img>后台主页</a>
                    </li>
                    <li>
                        <a  href="../Mycomment.do"   method="post" class="active-menu"><img src="../static/img/red.png" ></img>反馈模块</a>
                    </li>
                    <li>
                        <a   href="../Users.do"   method="post"><img src="../static/img/black.png" ></img>客户模块</a>
                    </li>   
                    <li>
                        <a  href="../Iproduct.do"   method="post" ><img src="../static/img/black.png" ></img>商品模块</a>
                    </li>
                    <li>
                        <a  href="../Ordered.do" method="post"><img src="../static/img/black.png" ></img>订单模块 </a>
                    </li>               
                    
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
 <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>评论列表</h2>   
                        <h5>欢迎回来！ </h5>
                       
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />

<div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                             评论表
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example"> 
                                    <thead>
                                        <tr>
                                            <th>编号</th>
                                            <th>产品编号</th>
                                            <th>用户编号</th>
                                            <th>图片</th>
                                            <th>评价内容</th>                                     
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                     <c:forEach items="${mycommentList}" var="mycomment">
                                        <tr class="odd gradeX">
                                            <td>${mycomment.id}</td>
                                            <td>${mycomment.product_id}</td>
                                            <td>${mycomment.userid}</td>
                                            <td>${mycomment.comment_pic}</td>
                                            <td>${mycomment.content}</td>
                                       
                                            <td><a href="../delmycomment.do?mycommentid=${mycomment.id}"><input type="button" value="删除" onClick="delcfm()"></a></td>
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