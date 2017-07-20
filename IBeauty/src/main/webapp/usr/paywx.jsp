<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
	<meta charset="utf-8">
<title>收银台</title>
<link href="../static/css/pay/wxcommon.css" rel="stylesheet">
<link href="../static/css/pay/wxindex.css" rel="stylesheet">
<script type="text/javascript"  src="js/jquery-1.11.1.js"></script>
<script type="text/javascript">
	function seachOrderStatus(){
		var orderId = "DemoPay1496714627445";
		var merchantId = "m1604080001";
		var sign = "36d345d88b52449e79f7d418aab8a90b";
		var codeurl = "weixin://wxpay/bizpayurl?pr=ybkBWBu";
		var returnUrl = "http://fuqianla.net/tastesdkres.html";
		
		$.ajax({
			type:"get",
			async:false,
			url:"/services/wxsmpay/searchstatus",
			contentType:"application/json",
			data:{"orderId":orderId,"merchantId":merchantId,"sign":sign,"codeurl":codeurl},
			cache:false,
			dataType:"json",
			success:function(msg){
				var returnCode = msg["returnCode"];
				
				if("SUCCESS" === returnCode){
					var parmMap = msg["parmMap"];
					var ret_code = parmMap["ret_code"]
					if("0000" === ret_code){
						if(!(returnUrl==='' || returnUrl==='null' || returnUrl==='NULL' ||returnUrl===null)){
							var returnData = "";
							for(var key in parmMap){
								if(returnData.length == 0){
									returnData += "?" + key + "="  + parmMap[key];
								} else {
									returnData += "&" + key + "="  + parmMap[key];
								}
							}
							
							window.location.href = returnUrl + returnData;
						}
					}
					return;
				}
			}
		});
		
	}
	
	setInterval(function(){
		seachOrderStatus();
	},3000);
</script>
</head>
<body class="wx-pay">
	<div class="head">
		<div class="main">
			<div class="logo-area">
				<h1>Ibeauty</h1>
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
				<li id="PaymerchName"><strong>收款方</strong><em>：</em>IBeauty - 应用中心</li>
				<li id="PayOrderId">订单编号：${order.id }</li>
			</ul>
			<div class="wx-pay-cont">
				<div class="wx-ecode fl">
					<img src="../static/img/txt-1.png?605fd5f7bf9b986c276c84de27038d33"
						alt="请使用微信扫一扫扫描二维码支付">
					<p>
						<img id="wxerweima"
							src="../static/img/bizpayurl_pr=ybkBWBu&smsign=36d345d88b52449e79f7d418aab8a90b.png?code_url=weixin://wxpay/bizpayurl?pr=ybkBWBu&smsign=36d345d88b52449e79f7d418aab8a90b"
							alt="">二维码有效时长为2小时，请尽快支付
					</p>
				</div>
				<img class="pic fr"
					src="../static/img/pic-1.jpg?402195d9bafb16e93419753a993be9a4" alt="示例">
			</div>
		</div>
	</div>
	<div class="footer">支付创新实验室 沪ICP备15048911号-2</div>
	
	<script src="index.js?ff47ea6338e974b71eb1"></script>
</body>
</html>