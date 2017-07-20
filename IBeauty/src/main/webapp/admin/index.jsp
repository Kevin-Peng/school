<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
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
    <link href="../static/time.js" rel="stylesheet" />

    
    
    
    
</head>
<body>
<div class="adcenter">   </div>

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
                        <a class="active-menu"  href="index.jsp"><img src="../static/img/red.png" >后台主页</a>
                    </li>
                    <li>
                        <a  href="sale.jsp"><img src="../static/img/black.png" >销售模块</a>
                    </li>
                    <li>
                        <a  href="../Mycomment.do"   method="post" ><img src="../static/img/black.png" >反馈模块 </a>
                    </li>
					<li>
                        <a   href="../Users.do"   method="post"><img src="../static/img/black.png" >客户模块</a>
                    </li>	
                    <li>
                        <a  href="../Iproduct.do"   method="post" ><img src="../static/img/black.png" >商品模块</a>
                    </li>
                    <li>
                        <a  href="../Ordered.do" method="post"><img src="../static/img/black.png" >订单模块 </a>
                    </li>				
				</ul>
            </div>
        </nav>  

        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>信息统计</h2>   
                        <h5>欢迎回来！ </h5>
                    </div>
                </div>              
                <!-- /. ROW  -->
                <div class="row"> 
                    
                      
                <div class="col-md-6 col-sm-12 col-xs-12">                     
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Bar Chart Example
                        </div>
                        <div class="panel-body">
                            <div id="morris-bar-chart" style="position: relative;"></div>
                        </div>
                    </div>            
                </div>
                
                <div class="col-md-6 col-sm-12 col-xs-12">                     
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Bar Chart Example
                        </div>
                        <div class="panel-body">
                            <div id="morris-bar-chart" style="position: relative;"></div>
                        </div>
                    </div>            
                </div>
                </div>
               
           
           
           
         <!-- /. PAGE WRAPPER  -->
        </div>
        </div>
        </div>
        
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="../static/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="../static/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="../static/js/jquery.metisMenu.js"></script>
     <!-- MORRIS CHART SCRIPTS -->
     <script src="../static/js/morris/raphael-2.1.0.min.js"></script>
    <script src="../static/js/morris/morris.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="../static/js/custom.js"></script>
    <script type="text/javascript" src="../static/js/jscharts.js"></script>
    
   
</body>
</html>
