<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
        <!-- CUSTOM STYLES-->
    <link href="../static/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='../static/css/css' rel='stylesheet' type='text/css' />
<!-- TABLE STYLES-->
    <link href="../static/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
    <script> function deleteRow(r) { var i=r.parentNode.parentNode.rowIndex; document.getElementById('dataTables-example').deleteRow(i); } </script> 
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
                <a class="navbar-brand" href="index.html">后台管理</a> 
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
                    <img src="../static/img/find_user.png" class="user-image ../static/img-responsive"/>
                    </li>
                    
                    
                     <li>
                        <a   href="sale.jsp"><img src="../static/img/black.png" >后台主页</a>
                    </li>
                    <li>
                        <a  href="../Mycomment.do"   method="post"  ><img src="../static/img/black.png" >反馈信息</a>
                    </li>
                    <li>
                        <a   href="../Users.do"   method="post"><img src="../static/img/black.png" > 客户模块</a>
                    </li>   
                    <li>
                        <a  href="../Iproduct.do" method="post"  ><img src="../static/img/black.png" >商品模块</a>
                    </li>
                    <li>
                        <a  href="../Ordered.do" method="post" class="active-menu"><img src="../static/img/red.png" >订单模块 </a>
                    </li>               
                </ul>
            </div>
        </nav>
        

        <!-- /. NAV SIDE  -->
       <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>订单列表</h2>   
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
                             订单表
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example"> 
                                    <thead>
                                        <tr>
                                            <th>订单号</th>
                                            <th>用户码</th>
                                            <th>订单状态</th>
                                            <th>下单时间</th>
                                            <th>订单描述</th>
                                            <th>订单总价</th>
                                            <th>收货人姓名</th>
                                            <th>收货地址</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                      <c:forEach items="${orderList}" var="myorder">
                                        <tr class="odd gradeX">
                                            <td>${myorder.id}</td>
                                            <td>${myorder.user_id }</td>
                                            <td>${myorder.status}</td>
                                            <td class="center">${myorder.order_time}</td>
                                            <td class="center">${myorder.order_desc}</td>
                                            <td class="center">${myorder.total_price}</td>
                                            <td class="center">${myorder.receive_name}</td>
                                            <td class="center">${myorder.full_address}</td>
                                            <td class="center"><a href="../delorder.do?orderid=${myorder.id}"><input type="button" value="删除" onclick="return confirm('确认删除吗？');"></a></td>
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
            
         <!-- /. PAGE WRAPPER  -->
         </div>
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