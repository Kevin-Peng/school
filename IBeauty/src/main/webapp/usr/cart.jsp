<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- saved from url=(0030)https://www.vmei.com/cart/list -->
<html>
 <head> 
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
  <meta charset="utf-8" /> 
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /> 
  <title>购物车 - ibeauty 美，从这里开始</title> 

  
  <link rel="stylesheet" type="text/css" href="../static/css/cart.css"/>
  <link rel="stylesheet" href="../static/css/style.css" /> 
  <!--header样式-->
  <link href="../static/css/header.css" rel="stylesheet" style="text/css" />
   <!--下拉面板-->
  <script type="text/javascript" src="../static/js/jquery-1.7.2.min.js?t=1496299121701"></script> 
  <script type="text/javascript" src="../static/js/jquery.bigautocomplete.js?t=1496299121701"></script> 
  <script type="text/javascript" src="../static/js/commonFooter.js?t=1496299121701"></script> 
  <!--head-->
  <script type="text/javascript" src="../static/js/jquery.min.js"></script>
  <script type="text/javascript" src="../static/js/head.js"></script>

 </head> 
 <body onload="getcart()"> 
  <div class="head"> <!--————————————————————要添加别的页面————————————————————-->
  <div  class="header">
   <jsp:include page="../header.jsp"/> 
  </div>
   </div>

  <div class="main1"> 
    <div class="menu1"> 
     <ul class="step"> 
      <li class="one"> 
        <div class="step-content"> 
          <h5 class="step-heading" style="color:black;">1.我的购物车</h5> 
        </div> 
       </li> 
      <li class="two"> 
       <div class="step-content"> 
        <h5 class="step-heading">2.填写核对订单信息</h5> 
       </div> 
      </li> 
      <li class="three"> 
       <div class="step-content"> 
        <h5 class="step-heading">3.成功提交订单</h5> 
       </div>
      </li> 
     </ul> 
     <div class="main-table"> 
      <table border="0" cellspacing="0" cellpadding="10" class="table-list" id="carttable"> 
       <tbody>
        <tr id="row1"> 
         <td class="c1"> 
         <input type="checkbox" name="allchoose" class="checkall" /> </td> 
         <td class="c2">全选</td> 
         <td class="c3">商品</td> 
         <td class="c4">名称</td> 
         <td class="c5">价格</td>
         <td class="c6">数量</td> 
         <td class="c7">小计</td>
         <td class="c8">操作</td> 
         
         <%int row=0; %>
         <c:forEach items="${list1}" var="b">
              <tr> 
               	<td class="c1">
             		<input type="checkbox" id="${b.productId}" name="choose" class="box"/>
          		</td>
          		<td class="c2"></td>
          		<td class="c3">
             		<img src="../static/${b.productImg}" width="70px" height="70px">
          		</td>
          		<td class="c4">
            	${b.productName}
          		</td>
          		<td class="c5">
           		<input type="text" value="${b.productPrice}" name="count" id="${b.productPrice}" data-now="1" autocomplete="off" style="width:80px;text-align:center;border:none;">
          		</td>
          		<td id="c6">
            		<a href="#" id="${b.productPrice}" onclick="reduce('##${b.productId}',${b.productPrice},'#${b.productId}')" onblur="bb('${b.productId}','##${b.productId}','#${b.productId}')" style="font-size:20px;">-</a>
            		<input type="text" value="${b.productNum}" name="shuliang" id="##${b.productId}" onchange="a('##${b.productId}',${b.productPrice},'#${b.productId}')" onblur="bb('${b.productId}','##${b.productId}','#${b.productId}')" data-now="1" autocomplete="off" style="border:none;width:30px;text-align:center;">
            		<a href="#" id="${b.productName}" onclick="increase('##${b.productId}',${b.productPrice},'#${b.productId}')" onblur="bb('${b.productId}','##${b.productId}','#${b.productId}')" style="font-size:20px;">+</a>
          		</td>
          		<td class="c7">
            	<input type="text" value="${b.productCount}" id="#${b.productId}" name="count" data-now="1" autocomplete="off" style="width:80px;text-align:center;border:none;">
          		</td>
          		<td class="c8">
            		<a href="../delete.do?productId=${b.productId}&userId=${b.userId}">删除</a><br>
            		<a href="../cartcollect.do?productId=${b.productId}&userId=${b.userId}">收藏</a>
          		</td> 
              </tr>
              <% row++;%>
          </c:forEach>
        <%
				if (session.getAttribute("list1") == null) {
		%>
          	<tr id="row3" style="font-size:18px;text-align:center;vertical-align: middle;">
          	<td colspan="8">您的购物车没有商品，<a class="buy" href="../index.jsp" target="_top">马上购买</a></td>
          	</tr>
          <%}
          session.setAttribute("row",row);
          %>
          <tr id="row2"> 
         <td class="c1"> 
         <input type="checkbox" name="allchoose" class="checkall" /> </td> 
         <td class="c2"><a href="" onclick="deletes()">删除</a></td> 
         <td class="c3" colspan="2">
       		已选中
       		<span id="allnumber">
       		<input type="text" value="0" id="pnumber" style="background:none;border:0;width:50px;text-align:center;">
       		</span>件商品
      	</td>
         <td class="c5" colspan="3">
       		总价（不含运费）:￥
       		<span id="allprice">
       		<input type="text" value="0" id="pcount" data-now="1" autocomplete="off" style="background:none;border:0;width:50px;text-align:center;">
       		</span>
      	</td> 
         <td class="c8">
         <input type="text" value="" id="cartempty" style="border:0;text-align:center;">
         <button id="button" class="button" type="submit" onmousemove="on()" onmouseout="out()" style="background: rgb(176, 176, 176);">去&nbsp;&nbsp;结&nbsp;&nbsp;账</button>
         </td>
         </tr>
       </tbody>
      </table> 
     </div> 
    </div>  <!--menu1-->
    <div class="the3-1">
      <div class="the3">
        <a href="../index.jsp" target="_top">继续添加商品&gt;&gt;</a>
        <!--——————————————————————要添加别的页面——————————————————————-->
      </div>
    </div>  
         <script src="../static/js/jquery-1.7.2.min.js" type="text/javascript"></script>
		<script type="text/javascript">
				function a(ppid,ppcount,countId){
				  	var no=document.getElementById(ppid).value;//no是修改后的数量，proId是商品id，要返回数据库         待保存
					var count=ppcount*no;
					document.getElementById(countId).value=count;
				}
				function reduce(ppid,ppcount,countId){//减少购物车商品数量，不得小于1
					var no=document.getElementById(ppid).value;
					if(no>1){
					no--;
					}
					else{
					alert("商品数量不能少于一件！");
					}
				  	document.getElementById(ppid).value=no;
				  	var count=ppcount*no;
					document.getElementById(countId).value=count;
				}
				function increase(ppid,ppcount,countId){
					var no=document.getElementById(ppid).value;
					no++;
				  	document.getElementById(ppid).value=no;
				  	var count=ppcount*no;
					document.getElementById(countId).value=count;
				}
				function bb(productId,n,c){
					var productNum = document.getElementById(n).value;//数量
					var productCount = document.getElementById(c).value;//价格小计
					//alert("数量修改为："+productNum+"件"+"\n\n"+"价格小计为："+productCount);
					$.ajax({
						url : '../change.do?productNum=' + productNum + '&productCount=' + productCount + '&productId=' + productId,
						async : false,
						success : function(data) {
						}
					});
				}

			//复选框操作
			$(".checkall").click(function() {
				document.getElementById("button").style.background="#f40";
				//document.getElementById("button").disabled=false;
				$("input[name='choose']").prop("checked", this.checked);
				$("input[name='allchoose']").prop("checked", this.checked);
				var pnumber = document.getElementById("pnumber");
				pnumber.value = $("input[name='choose']:checked").length;
				var length=${row};
				var count=new Array();
				for(var i = 0;i<length;i++){
					if(document.getElementsByName("choose")[i].checked){
    					var countid = "#"+document.getElementsByName("choose")[i].id;
    					count[i]= document.getElementById(countid).value;
					}
					else{
						count[i] = 0;
					}
				}
				var pcount = 0;
				for(var i = 0;i<length;i++){
					pcount+=parseInt(count[i]);
				}
				var c = document.getElementById("pcount");
				c.value = pcount;
			});//直接选择全选并获取所选复选框的数量
			$("input[name='choose']").click(function() {
				if($("input[name='choose']").filter(":checked").length!=0){
					document.getElementById("button").style.background="#f40";
			    	//document.getElementById("button").disabled=false;
			    }
				var $subs = $("input[name='choose']");
				$(".checkall").prop("checked",$subs.length == $subs.filter(":checked").length ? true: false);
				pnumber.value = $subs.filter(":checked").length;
				var length=${row};
				var count=new Array();
				for(var i = 0;i<length;i++){
					if(document.getElementsByName("choose")[i].checked){
    					var countid = "#"+document.getElementsByName("choose")[i].id;
    					count[i]= document.getElementById(countid).value;
					}
					else{
						count[i] = 0;
					}
				}
				var pcount = 0;
				for(var i = 0;i<length;i++){
					pcount+=parseInt(count[i]);
				}
				var c = document.getElementById("pcount");
				c.value = pcount;
					
			});
			function deletes(){
				var length=${row};
				var deletes=new Array();
				var j = 0;
				var zongshu = document.getElementById("pnumber").value;
				for(var i = 0;i<length;i++){
				    if(document.getElementsByName("choose")[i].checked){				    
    					deletes[j] = document.getElementsByName("choose")[i].id;
    					j++;
					}
				}
				$.ajax({
					url : '../lotdelete.do?deletes=' + deletes+'&zongshu='+zongshu,
					async : false,
					success : function() {
					}
				});
			}
			$("#button").click(function() {
				if(document.getElementById("button").style.background=="rgb(176, 176, 176)"){}
				else{
					var length=${row};
					var topayid=new Array();
					var j=0;
					for(var i = 0;i<length;i++){
				    	if(document.getElementsByName("choose")[i].checked){				    
    						topayid[j] = document.getElementsByName("choose")[i].id;
    						j++;
						}
					}
					var zongjia = document.getElementById("pcount").value;
					var zongshu = document.getElementById("pnumber").value;
					window.location.href="../topay.do?zongjia="+zongjia+"&zongshu="+zongshu+"&topayid="+topayid;
				}
			});
			function on(){
				if(document.getElementById("button").style.background=="rgb(176, 176, 176)"){
					//alert("dd");
					document.getElementById("cartempty").value="请先勾选要结算的商品!";
				}
			}
			function out(){
				if(document.getElementById("button").style.background=="rgb(176, 176, 176)"){
					//alert("dd");
					document.getElementById("cartempty").value="";
				}
			}
		</script>
    
  </div>    <!--main1-->
	<div class="tuijian">
		
	</div>
  <div class="foot"><!--——————————————————————要添加别的页面——————————————————————--> 
   <iframe src="../foot.jsp" scrolling="no" frameborder="0" marginheight="0px" marginwidth="0px" height="284px" width="100%"></iframe>   
  </div> 
 </body>
</html>
