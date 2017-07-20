<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@page import="cn.IBeauty.po.Product,cn.IBeauty.dao.ProductDAO" %>

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
   
        <!-- CUSTOM STYLES-->
    <link href="../static/css/custom.css" rel="stylesheet" />
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
                        <a  href="sale.jsp"><img src="../static/img/black.png" >后台主页</a>
                    </li>
                    <li>
                        <a  href="../Mycomment.do"   method="post"  ><img src="../static/img/black.png" >反馈模块</a>
                    </li>
                    <li>
                        <a   href="../Users.do"   method="post"><img src="../static/img/black.png" >客户模块</a>
                    </li>   
                    <li>
                        <a  href="../Iproduct.do"   method="post"   class="active-menu"><img src="../static/img/red.png" >商品模块</a>
                    </li>
                    <li>
                        <a  href="../Ordered.do" method="post"><img src="../static/img/black.png" >订单模块</a>
                    </li>               
                </ul>
            </div>
        </nav>  

        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>商品列表</h2>   
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
                             库存表
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table width="130%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th style="width:80px" >商品编号</th>
                                            <th style="width:90px">品牌</th>
                                            <th style="width:200px">商品名称</th>
                                            <th style="width:200px">商品详情</th>
                                            <th style="width:60px">规格</th>
                                            <th style="width:80px">产地</th>
                                            <th style="width:60px">保质期</th>
                                            <th style="width:100px">添加时间</th>
                                            <th style="width:80px">数量</th>
                                            <th style="width:80px">属性</th>
                                            <th style="width:80px">类别</th>
                                            <th style="width:80px">固定价格</th>
                                            <th style="width:60px">价格</th>
                                            <th style="width:60px">颜色</th>
                                            <th style="width:60px">操作</th>
                                        </tr>
                                    </thead>
                                    

                                    
                                    <tbody>
                                    <c:forEach items="${productList}" var="product">
                                        <tr class="odd gradeX">
                                            <td >${product.id}</td>
                                            <td >${product.product_brand}</td>
                                            <td >${product.product_name}</td>
                                            <td >${product.detail}</td>
                                            <td >${product.volum}</td>
                                            <td >${product.product_country}</td>
                                            <td >${product.guarantee}</td>
                                            <td >${product.add_time}</td>
                                            <td >${product.product_num}</td>
                                            <td >${product.conditionn}</td>
                                            <td >${product.texture}</td>
                                            <td >${product.fixed_price}</td>
                                            <td >${product.price}</td>
                                            <td >${product.color}</td>
                                            
                                            
                                            <td class="center">      
                                             
                                            
                                            <a href="../delpro.do?productid=${product.id}"><input type="submit" value="删除" onClick="delcfm()"></a>
                                            
                                            
                                            &nbsp;&nbsp;
                                            <a href="../toupdate.do?productid=${product.id}"><input type="button" value="修改"></a>
                                            </td>
                                       </tr>
                                    </c:forEach>
                                    </tbody>
                                 </table>
                                 <a href="add.jsp" class="btn btn-primary ">添加数据</a>
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
