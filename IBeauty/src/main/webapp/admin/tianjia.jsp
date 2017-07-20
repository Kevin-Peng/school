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

   <style type="text/css">
     html,body{
     margin:auto;
     height:100%;
      }
   </style>
    
</head>


<body style="background:url(../static/img/timg2.jpg) no-repeat center center;background-size:100% 100%;">
<div class="adcenter" style="padding: 90px 50px 5px 50px"></div>
    <div class="container">
        <div class="row text-center  ">
            <div class="col-md-12">
                <br/><br/>
                <h2> 商品修改</h2>
                <br/>
            </div>
        </div>
         <div class="row">
               
                <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                        <strong>输入修改商品的详细信息</strong>  
                            </div>
                            <div class="panel-body">
                                <form action="../update.do" method="post" role="form">
									<br/>
                                     <div class="form-group input-group">
                                            <span class="input-group-addon"><strong>商品编号</strong></span>
                                            <input type="text" name="id" value="${product.id}" class="form-control" />
                                            <span class="input-group-addon"><strong>品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;牌</strong></span>
                                            <input type="text" name="product_brand" value="${product.product_brand}" class="form-control"  />
                                     </div>
                                     <div class="form-group input-group">
                                            <span class="input-group-addon"><strong>商品名称</strong></span>
                                            <input type="text" name="product_name" value="${product.product_name}" class="form-control" />
                                            <span class="input-group-addon"><strong>商品详情</strong></span>
                                            <input type="text" name="detail" value="${product.detail}" class="form-control"  />
                                        </div>
                                         <div class="form-group input-group">
                                            <span class="input-group-addon"><strong>规&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格</strong></span>
                                            <input type="text" name="volum" value="${product.volum}" class="form-control" />
                                            <span class="input-group-addon"><strong>产&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地</strong></span>
                                            <input type="text" name="product_country" value="${product.product_country}" class="form-control"  />
                                        </div>
                                      <div class="form-group input-group">
                                            <span class="input-group-addon"><strong>保&nbsp;&nbsp;质&nbsp;&nbsp;期</strong></span>
                                            <input type="text" name="guarantee" value="${product.guarantee}" class="form-control" />
                                            <span class="input-group-addon"><strong>添加时间</strong></span>
                                            <input type="text" name="add_time" value="${product.add_time}" class="form-control"  />
                                        </div>
                                     <div class="form-group input-group">
                                            <span class="input-group-addon"><strong>数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量</strong></span>
                                            <input type="text" name="product_num" value="${product.product_num}" class="form-control" />
                                            <span class="input-group-addon"><strong>属&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性</strong></span>
                                            <input type="text" name="conditionn" value="${product.conditionn}" class="form-control"  />
                                        </div>

                                    <div class="form-group input-group">
                                            <span class="input-group-addon"><strong>类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</strong></span>
                                            <input type="text" name="texture" value="${product.texture}" class="form-control"/>
                                            <span class="input-group-addon"><strong>固定价格</strong></span>
                                            <input type="text" name="fixed_price" value="${product.fixed_price}" class="form-control"  />
                                        </div>
                                        
                                     <div class="form-group input-group">
                                            <span class="input-group-addon"><strong>价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格</strong></span>
                                            <input type="text" name="price" value="${product.price}" class="form-control" />
                                            <span class="input-group-addon"><strong>颜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色</strong></span>
                                            <input type="text" name="color" value="${product.color}" class="form-control"/>
                                      </div>
                                     
                                    <input type="submit" value="确认修改" class="btn btn-primary " />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="product.jsp" class="btn btn-primary ">取&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消</a>
                                    
                                    </form>
                            </div>
                           
                        </div>
                    </div>
                
                
        </div>
    </div>


     <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="../static/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="../static/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="../static/js/jquery.metisMenu.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="../static/js/custom.js"></script>
   
</body>
</html>
