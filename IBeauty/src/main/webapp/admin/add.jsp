<%@ page language="java" import="java.util.*" pageEncoding="utf-8" 
contentType="text/html;charset=utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html >
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
   
   
   <script type="text/javascript">
		function checkspace(){
			var id=document.getElementById("id");
			if(id.value==""){
				alert("产品编号不能为空");
				return false;
				
			}
			
			var product_num=document.getElementById("product_num");
			if(product_num.value==""){
				alert("产品数量不能为空");
				return false;
				
			}
			var fixed_price=document.getElementById("fixed_price");
			if(fixed_price.value==""){
				alert("价格不能为空");
				return false;
							
			}
			var add_time=document.getElementById("add_time");
			
			if(add_time.value==""){
				alert("添加时间不能为空");
				return false;
						
			} 
			
			var add_time=document.getElementById("add_time");
			re=/^(\d{4})-(\d{1,2})-(\d{1,2})$/;//正则表达式
			if(!re.test(document.getElementById("add_time").value))//判断日期格式符合YYYY-MM-DD 
			{
			alert("请输入正确格式（添加时间）");
		    return false;
			
			}
			
			
					    			
			var price=document.getElementById("price");
			if(price.value==""){
				alert("价格不能为空");
				return false;
				
			}
		}
	</script>

   
    

</head>

<style type="text/css">
html,body{

    margin:auto;
    height:100%;

  }

</style> 

<body style="background:url(../static/img/timg.jpg) no-repeat center center;background-size:100% 100%;">
<div class="adcenter">
  
  
</div>
    <div class="container" style="padding: 90px 50px 5px 50px">
        <div class="row text-center  ">
            <div class="col-md-12">
                <br /><br />
                <h2> 商品添加</h2>
               
                
                 <br />
            </div>
        </div>
         <div class="row">
               
                <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1">
                        <div class="panel panel-default" style="width:400px">
                            <div class="panel-heading">
                        <strong>输入添加商品的详细信息</strong>  
                            </div>
                            <div class="panel-body">
                                <form action="../add.do"  method="post" onsubmit="return checkspace()" >
									<br/>
                                        <div class="form-group input-group">
                                            <span class="input-group-addon"><strong>商品编号</strong></span>
                                            <input type="text" id="id" name="id" class="form-control" />
                                            
                                            <span class="input-group-addon"><strong>品&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;牌</strong></span>
                                            <input type="text" id="product_brand"  name="product_brand" class="form-control"  />
                                        </div>
                                        <div class="form-group input-group">
                                            <span class="input-group-addon"><strong>商品名称</strong></span>
                                            <input type="text" id="product_name" name="product_name" class="form-control" />
                                            
                                            <span  class="input-group-addon"><strong>商品详情</strong></span>
                                            <input type="text"  id="detail" name="detail" class="form-control"  />
                                        </div>
                                        <div class="form-group input-group">
                                            <span class="input-group-addon"><strong>规&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格</strong></span>
                                            <input type="text" id="volum" name="volum" class="form-control" />
                                            <span class="input-group-addon"><strong>产&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地</strong></span>
                                            <input type="text"  id="product_country" name="product_country"  class="form-control"  />
                                        </div>
                                        <div class="form-group input-group">
                                            <span class="input-group-addon"><strong>保&nbsp;&nbsp;质&nbsp;&nbsp;期</strong></span>
                                            <input type="text"  id="guarantee" name="guarantee" class="form-control" />
                                            <span class="input-group-addon"><strong>添加时间</strong></span>
                                            <input type="text"  id="add_time" name="add_time"  class="form-control"    />
                                        </div>
                                        <div class="form-group input-group">
                                            <span class="input-group-addon"><strong>数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量</strong></span>
                                            <input type="text"  id="product_num" name="product_num" class="form-control" />
                                           
                                            <span class="input-group-addon"><strong>属&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;性</strong></span>
                                            <input type="text"  id="conditionn" name="conditionn" class="form-control"  />
                                        </div>

                                    <div class="form-group input-group">
                                            <span class="input-group-addon"><strong>类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</strong></span>
                                            <input type="text" id="texture"  name="texture"  class="form-control"/>
                                            <span class="input-group-addon"><strong>固定价格</strong></span>
                                            <input type="text"   id="fixed_price" name="fixed_price" class="form-control"  />
                                        </div>
                                        
                                     <div class="form-group input-group">
                                            <span class="input-group-addon"><strong>价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格</strong></span>
                                            <input type="text" id="price"  name="price" class="form-control" />
                                            <span class="input-group-addon"><strong>颜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色</strong></span>
                                            <input type="text" id="color" name="color" class="form-control"/>
                                      </div>
                                       
                                     
                                    <input  class="btn btn-primary " type="submit" value="添加"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="product.jsp" class="btn btn-primary ">取消</a>
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
