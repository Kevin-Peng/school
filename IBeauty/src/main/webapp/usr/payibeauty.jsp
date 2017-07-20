<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="utf-8">
<title>收银台</title>
<link href="../static/css/pay/wxcommon.css" rel="stylesheet">
<link href="../static/css/pay/wxindex.css" rel="stylesheet">
<script type="text/javascript"  src="js/jquery-1.11.1.js"></script>

<link href="../static/css/pay/paycommonlogin.css" rel="stylesheet">
<link href="../static/css/pay/paylogin.css" rel="stylesheet">

<script type="text/javascript">
	function checkpay(){
	    var message='<%=session.getAttribute("ipayerror")%>';
		if(message!="null"){
		var t=confirm(message);
		if(t){
			window.location.href="./payresult.jsp";	
		}else{
			window.location.href="./payresult.jsp";
		}
		}
	}
	function CloseWindow(){
		window.close();
	}
	
	function repeatpay(){
		var warn='<%=session.getAttribute("repeatpay")%>';
		var payerror='<%=session.getAttribute("payerror")%>';
		if(warn!="null"){
		var t=confirm(warn);
		if(t){
			window.close();	
		}else{
			window.close();
		}
	}
		if(payerror!="null"){
			var t=confirm(payerror);
			if(t){
				window.close();
			}else{
				window.close();
			}
		}
	}
	
	function isenough(){
		var enough='<%=session.getAttribute("payenough")%>';
		if(enough!="null"){
			var t=confirm(enough);
			if(t){
				window.close();
			}else{
				window.close();
			}
		}
	}
	
</script>

</head>


<body class="wx-pay" onload="checkpay();repeatpay();isenough()">
	<div class="head">
		<div class="main">
			<div class="logo-area">
				<h1>IBeauty</h1>
				<h2>收银台</h2>
			</div>
		</div>
	</div>
	<div class="main">
		<div class="pay-content">
			<p>
				<strong>请您及时付款,以便订单尽快处理！</strong>请您在提交订单后<span>24小时</span>内完成支付，否则订单会自动取消。
			</p>
			<p class="order-id">支付金额：<span id="PaysumOfMoney">${order.total_price }</span> 元</p>
			<ul class="payInfor">
				<li id="PaymerchName"><strong>收款方</strong><em>：</em>IBeauty支付 - 第三方支付中心</li>
				<li id="PayOrderId">订单编号：${order.id }</li>
			</ul>

	<div class="account-box account-login-box" style="margin:0 auto;display:block;"> 
	<div class=login-toogle-btn-box style="display:block;"> 支付 </div> 
	<div class="account-error none"></div> 
	
	<script type="text/javascript">
		function checkspace(){
			var email=document.getElementById("email");
			if(email.value==""){
				alert("用户名不能为空");
				return false;
			}
			var pwd=document.getElementById("pwd");
			if(pwd.value==""){
				alert("密码不能为空");
				return false;			
			}
			var code=document.getElementById("code");
			if(code.value==""){
				alert("验证码不能为空");
				return false;
			}
		}
	</script>
	
	<form action="../paylogin.do" method="post" onsubmit="return checkspace()"> 
	<div class=account-msg> 
	<div class=phone-register id=phone-register>
	<div class="input login-input">
	<input size="30" name="email" id="email" type=text class=account placeholder=用户邮箱>
	<br><br><p style="font-size:14px;color:red;">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	${emailerror}</p>
	  </div> 
    <div class=input>  
	<input size="30"  name="pwd" id="pwd" type=password class=password placeholder=支付密码（字母，数字）> 
	<br><br><p style="font-size:14px;color:red;">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	${pwderror}</p>
	  </div>  
	 <div class="input verify-box"> 
	<input type=text name="code" id="code" class=verify-code placeholder=验证码>
	<br><br><p style="font-size:14px;color:red;">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	${imgerror}</p>
	   </div> 
	   <div class=verify-btn> <img id="pic" src="../number.jsp">   </div>
	</div> </div> <br><br><br><br>
	<button class=login-btn type="submit">登录支付</button> 
	</form>
	
	<div class=remember-me-box > 
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="../topayregist.do" class=right style="font-size:15px;">注册密码</a> </div> 
	<div class=link-login-box> 
<!-- <a href=register.html>注册</a> </div>   -->

				
			</div>
		</div>
	</div>
	<div class="footer">Copyright © 2017 IBeauty项目小组</div>
	
	<script src="/pub//js/index.js?ff47ea6338e974b71eb1"></script></div>
</body>
</html>