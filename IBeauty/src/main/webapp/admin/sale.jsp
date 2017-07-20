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
</head>
<body>
<div class="adcenter"></div>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="fa fa-bar"></span>
                    <span class="fa fa-bar"></span>
                    <span class="fa fa-bar"></span>
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
                        <a  class="active-menu" href="sale.jsp"><img src="../static/img/red.png" > 后台主页</a>
                    </li>
                    <li>
                        <a  href="../Mycomment.do"   method="post" ><img src="../static/img/black.png" >反馈模块 </a>
                    </li>
                           <li  >
                        <a   href="../Users.do"   method="post"><img src="../static/img/black.png" >客户模块</a>
                    </li>   
                      <li  >
                        <a  href="../Iproduct.do"   method="post" ><img src="../static/img/black.png" >商品模块</a>
                    </li>
                    <li  >
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
                     <h2>销售详情</h2>   
                        <h5>欢迎回来！ </h5>
                    </div>
                 </div>

                 <!-- /. ROW  -->
                 <hr />
             
                <div class="row"> 
                    
                      
                               <div class="col-md-6 col-sm-12 col-xs-12" style="width:100%">                     
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            营业额图
                        </div>
                        <div class="panel-body">
                        <div style="width:20px;height:20px"></div>

                        	<script type="text/javascript" src="../static/js/jscharts.js"></script>   
<div id="graph">Loading graph...</div>

<script type="text/javascript">
	var myData = new Array(['2017/6/1', 4560.0], ['2017/6/2', 3678.5], ['2017/6/3', 5412.5], ['2017/6/4', 2145.5], ['2017/6/5', 5142.5], ['2017/6/6', 7218.7], ['2017/6/7', 2546.3]);
	var colors = ['#FA5E1F', '#FDCB3F', '#71D743', '#D23333', '#BAE73F', '#AB7B55', '#B381C9'];
	var myChart = new JSChart('graph', 'bar');
	myChart.setDataArray(myData);
	myChart.colorizeBars(colors);
	myChart.setTitle('营业额变化图');
	myChart.setTitleColor('#8E8E8E');
	myChart.setAxisNameX('日期');
	myChart.setAxisNameY('营业额（单位：元）');
	myChart.setAxisColor('#c6c6c6');
	myChart.setAxisWidth(1);
	myChart.setAxisNameColor('#9a9a9a');
	myChart.setAxisValuesColor('#939393');
	myChart.setAxisPaddingTop(60);
	myChart.setAxisPaddingLeft(50);
	myChart.setAxisPaddingBottom(60);
	myChart.setTextPaddingBottom(20);
	myChart.setTextPaddingLeft(15);
	myChart.setTitleFontSize(11);
	myChart.setBarBorderWidth(0);
	myChart.setBarSpacingRatio(50);
	myChart.setBarValuesColor('#737373');
	myChart.setGrid(false);
	myChart.setSize(616, 321);
	myChart.setBackgroundImage('chart_bg.jpg');
	myChart.draw();
</script>

                        </div>
                        </div>
                    </div>            
              
                

                
           </div>
                 <!-- /. ROW  -->
                <div class="row">                     
                      
                               <div class="col-md-6 col-sm-12 col-xs-12">                     
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            营业额变化趋势
                        </div>
                        <div class="panel-body">
                            <script type="text/javascript" src="../static/js/jscharts.js"></script>   
<div id="graphh">Loading graph...</div>

<script type="text/javascript">
	var myData = new Array(['2017/6/1', 4560.0], ['2017/6/2', 3678.5], ['2017/6/3', 5412.5], ['2017/6/4', 2145.5], ['2017/6/5', 5142.5], ['2017/6/6', 7218.7], ['2017/6/7', 2546.3]);
	var myChart = new JSChart('graphh', 'line');
	myChart.setDataArray(myData);
	myChart.setTitle('销售额变化趋势');
	myChart.setTitleColor('#8E8E8E');
	myChart.setTitleFontSize(11);
	myChart.setAxisNameX('');
	myChart.setAxisNameY('');
	myChart.setAxisColor('#8420CA');
	myChart.setAxisValuesColor('#949494');
	myChart.setAxisPaddingLeft(100);
	myChart.setAxisPaddingRight(120);
	myChart.setAxisPaddingTop(50);
	myChart.setAxisPaddingBottom(40);
	myChart.setAxisValuesDecimals(3);
	myChart.setAxisValuesNumberX(10);
	myChart.setShowXValues(false);
	myChart.setGridColor('#C5A2DE');
	myChart.setLineColor('#BBBBBB');
	myChart.setLineWidth(2);
	myChart.setFlagColor('#9D12FD');
	myChart.setFlagRadius(4);
	myChart.setTooltip([1997, 'GDP 7.80']);
	myChart.setTooltip([1998, 'GDP 4.80']);
	myChart.setTooltip([1999, 'GDP 6.50']);
	myChart.setTooltip([2000, 'GDP 6.10']);
	myChart.setTooltip([2001, 'GDP 4.40']);
	myChart.setTooltip([2002, 'GDP 5.80']);
	myChart.setTooltip([2003, 'GDP 4.00']);
	myChart.setTooltip([2004, 'GDP 8.50']);
	myChart.setTooltip([2005, 'GDP 8.90']);
	myChart.setTooltip([2006, 'GDP 9.20']);
	myChart.setLabelX([1997, '1997']);
	myChart.setLabelX([1998, '1998']);
	myChart.setLabelX([1999, '1999']);
	myChart.setLabelX([2000, '2000']);
	myChart.setLabelX([2001, '2001']);
	myChart.setLabelX([2002, '2002']);
	myChart.setLabelX([2003, '2003']);
	myChart.setLabelX([2004, '2004']);
	myChart.setLabelX([2005, '2005']);
	myChart.setLabelX([2006, '2006']);
	myChart.setSize(616, 321);
	myChart.setBackgroundImage('chart_bg.jpg');
	myChart.draw();
</script>

                      
                        </div>
                    </div>            
                </div>
                    <div class="col-md-6 col-sm-12 col-xs-12">                     
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            商品构成
                        </div>
                        <div class="panel-body">
                         
                            <script type="text/javascript" src="../static/js/jscharts.js"></script>   
<div id="graphe">Loading graph...</div>

<script type="text/javascript">
	var myData = new Array(['护肤', 11.1], ['彩妆', 22.6], ['香水', 20.2], ['身体护理', 18.6], ['洗发护发', 12.1],['工具', 8.6], ['男士', 6.8]);
	var colors = ['#0673B8', '#0091F1', '#F85900', '#1CC2E6', '#C32121','#949494','#8E8E8E'];
	var myChart = new JSChart('graphe', 'pie');
	myChart.setDataArray(myData);
	myChart.colorizePie(colors);
	myChart.setTitle('IBeauty电商系统各类商品占比 (%)');
	myChart.setTitleColor('#8E8E8E');
	myChart.setTitleFontSize(11);
	myChart.setTextPaddingTop(280);
	myChart.setPieValuesDecimals(1);
	myChart.setPieUnitsFontSize(9);
	myChart.setPieValuesFontSize(8);
	myChart.setPieValuesColor('#fff');
	myChart.setPieUnitsColor('#969696');
	myChart.setSize(616, 321);
	myChart.setPiePosition(308, 145);
	myChart.setPieRadius(95);
	myChart.setFlagColor('#fff');
	myChart.setFlagRadius(4);
	myChart.setTooltip(['Firefox','Including Mozilla and all Gecko browsers']);
	myChart.setTooltip(['IE6','Including IE5 and older browsers']);
	myChart.setTooltipOpacity(1);
	myChart.setTooltipBackground('#ddf');
	myChart.setTooltipPosition('ne');
	myChart.setTooltipOffset(2);
	myChart.setBackgroundImage('chart_bg.jpg');
	myChart.draw();
</script>


                        </div>
                    </div>            
                </div> 
                
           </div>
                 <!-- /. ROW  -->

    </div>
             <!-- /. PAGE INNER  -->
            </div>
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
      <!-- CUSTOM SCRIPTS -->
    <script src="../static/js/custom.js"></script>
    <script type="../static/text/javascript" src="js/jscharts.js"></script>
 
</body>
</html>
