<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<title>收银台</title>
<link href="../static/css/pay/wxcommon.css" rel="stylesheet">
<link href="../static/css/pay/wxindex.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>

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
		if (enough != "null") {
			var t = confirm(enough);
			if (t) {
				window.close();
			} else {
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
			<p class="order-id">
				支付金额：<span id="PaysumOfMoney">${order.total_price }</span> 元
			</p>
			<ul class="payInfor">
				<li id="PaymerchName"><strong>收款方</strong><em>：</em>IBeauty支付 -
					第三方支付中心</li>
				<li id="PayOrderId">订单编号：${order.id }</li>
			</ul>
			
			<script type="text/javascript">
				function c1(){
					document.getElementById("p1").style.background = "#27c8e8";
					document.getElementById("p2").style.background = "#FFFFFF";
					document.getElementById("p3").style.background = "#FFFFFF";
					document.getElementById("p4").style.background = "#FFFFFF";
					document.getElementById("p5").style.background = "#F6F6F6";
					document.getElementById("p6").style.background = "#F6F6F6";
					document.getElementById("p7").style.background = "#F6F6F6";
					document.getElementById("p8").style.background = "#F6F6F6";
					document.getElementById("p9").style.background = "#FFFFFF";
					document.getElementById("p10").style.background = "#FFFFFF";
					document.getElementById("p11").style.background = "#FFFFFF";
					document.getElementById("p12").style.background = "#FFFFFF";
					document.getElementById("q1").checked="true";
				}
				function c2(){
					document.getElementById("p2").style.background = "#27c8e8";
					document.getElementById("p1").style.background = "#FFFFFF";
					document.getElementById("p3").style.background = "#FFFFFF";
					document.getElementById("p4").style.background = "#FFFFFF";
					document.getElementById("p5").style.background = "#F6F6F6";
					document.getElementById("p6").style.background = "#F6F6F6";
					document.getElementById("p7").style.background = "#F6F6F6";
					document.getElementById("p8").style.background = "#F6F6F6";
					document.getElementById("p9").style.background = "#FFFFFF";
					document.getElementById("p10").style.background = "#FFFFFF";
					document.getElementById("p11").style.background = "#FFFFFF";
					document.getElementById("p12").style.background = "#FFFFFF";
					document.getElementById("q2").checked="true";
				}
				function c3(){
					document.getElementById("p3").style.background = "#27c8e8";
					document.getElementById("p2").style.background = "#FFFFFF";
					document.getElementById("p1").style.background = "#FFFFFF";
					document.getElementById("p4").style.background = "#FFFFFF";
					document.getElementById("p5").style.background = "#F6F6F6";
					document.getElementById("p6").style.background = "#F6F6F6";
					document.getElementById("p7").style.background = "#F6F6F6";
					document.getElementById("p8").style.background = "#F6F6F6";
					document.getElementById("p9").style.background = "#FFFFFF";
					document.getElementById("p10").style.background = "#FFFFFF";
					document.getElementById("p11").style.background = "#FFFFFF";
					document.getElementById("p12").style.background = "#FFFFFF";
					document.getElementById("q3").checked="true";
				}
				function c4(){
					document.getElementById("p4").style.background = "#27c8e8";
					document.getElementById("p2").style.background = "#FFFFFF";
					document.getElementById("p3").style.background = "#FFFFFF";
					document.getElementById("p1").style.background = "#FFFFFF";
					document.getElementById("p5").style.background = "#F6F6F6";
					document.getElementById("p6").style.background = "#F6F6F6";
					document.getElementById("p7").style.background = "#F6F6F6";
					document.getElementById("p8").style.background = "#F6F6F6";
					document.getElementById("p9").style.background = "#FFFFFF";
					document.getElementById("p10").style.background = "#FFFFFF";
					document.getElementById("p11").style.background = "#FFFFFF";
					document.getElementById("p12").style.background = "#FFFFFF";
					document.getElementById("q4").checked="true";
				}
				function c5(){
					document.getElementById("p5").style.background = "#27c8e8";
					document.getElementById("p1").style.background = "#FFFFFF";
					document.getElementById("p2").style.background = "#FFFFFF";
					document.getElementById("p3").style.background = "#FFFFFF";
					document.getElementById("p4").style.background = "#FFFFFF";
					document.getElementById("p6").style.background = "#F6F6F6";
					document.getElementById("p7").style.background = "#F6F6F6";
					document.getElementById("p8").style.background = "#F6F6F6";
					document.getElementById("p9").style.background = "#FFFFFF";
					document.getElementById("p10").style.background = "#FFFFFF";
					document.getElementById("p11").style.background = "#FFFFFF";
					document.getElementById("p12").style.background = "#FFFFFF";
					document.getElementById("q5").checked="true";
				}
				function c5(){
					document.getElementById("p6").style.background = "#27c8e8";
					document.getElementById("p1").style.background = "#FFFFFF";
					document.getElementById("p2").style.background = "#FFFFFF";
					document.getElementById("p3").style.background = "#FFFFFF";
					document.getElementById("p4").style.background = "#FFFFFF";
					document.getElementById("p5").style.background = "#F6F6F6";
					document.getElementById("p7").style.background = "#F6F6F6";
					document.getElementById("p8").style.background = "#F6F6F6";
					document.getElementById("p9").style.background = "#FFFFFF";
					document.getElementById("p10").style.background = "#FFFFFF";
					document.getElementById("p11").style.background = "#FFFFFF";
					document.getElementById("p12").style.background = "#FFFFFF";
					document.getElementById("q6").checked="true";
				}
				function c7(){
					document.getElementById("p7").style.background = "#27c8e8";
					document.getElementById("p1").style.background = "#FFFFFF";
					document.getElementById("p2").style.background = "#FFFFFF";
					document.getElementById("p3").style.background = "#FFFFFF";
					document.getElementById("p4").style.background = "#FFFFFF";
					document.getElementById("p6").style.background = "#F6F6F6";
					document.getElementById("p5").style.background = "#F6F6F6";
					document.getElementById("p8").style.background = "#F6F6F6";
					document.getElementById("p9").style.background = "#FFFFFF";
					document.getElementById("p10").style.background = "#FFFFFF";
					document.getElementById("p11").style.background = "#FFFFFF";
					document.getElementById("p12").style.background = "#FFFFFF";
					document.getElementById("q7").checked="true";
				}
				function c8(){
					document.getElementById("p8").style.background = "#27c8e8";
					document.getElementById("p1").style.background = "#FFFFFF";
					document.getElementById("p2").style.background = "#FFFFFF";
					document.getElementById("p3").style.background = "#FFFFFF";
					document.getElementById("p4").style.background = "#FFFFFF";
					document.getElementById("p6").style.background = "#F6F6F6";
					document.getElementById("p7").style.background = "#F6F6F6";
					document.getElementById("p5").style.background = "#F6F6F6";
					document.getElementById("p9").style.background = "#FFFFFF";
					document.getElementById("p10").style.background = "#FFFFFF";
					document.getElementById("p11").style.background = "#FFFFFF";
					document.getElementById("p12").style.background = "#FFFFFF";
					document.getElementById("q8").checked="true";
				}
				function c9(){
					document.getElementById("p9").style.background = "#27c8e8";
					document.getElementById("p1").style.background = "#FFFFFF";
					document.getElementById("p2").style.background = "#FFFFFF";
					document.getElementById("p3").style.background = "#FFFFFF";
					document.getElementById("p4").style.background = "#FFFFFF";
					document.getElementById("p6").style.background = "#F6F6F6";
					document.getElementById("p7").style.background = "#F6F6F6";
					document.getElementById("p8").style.background = "#F6F6F6";
					document.getElementById("p5").style.background = "#F6F6F6";
					document.getElementById("p10").style.background = "#FFFFFF";
					document.getElementById("p11").style.background = "#FFFFFF";
					document.getElementById("p12").style.background = "#FFFFFF";
					document.getElementById("q9").checked="true";
				}
				function c10(){
					document.getElementById("p10").style.background = "#27c8e8";
					document.getElementById("p1").style.background = "#FFFFFF";
					document.getElementById("p2").style.background = "#FFFFFF";
					document.getElementById("p3").style.background = "#FFFFFF";
					document.getElementById("p4").style.background = "#FFFFFF";
					document.getElementById("p6").style.background = "#F6F6F6";
					document.getElementById("p7").style.background = "#F6F6F6";
					document.getElementById("p8").style.background = "#F6F6F6";
					document.getElementById("p5").style.background = "#F6F6F6";
					document.getElementById("p9").style.background = "#FFFFFF";
					document.getElementById("p11").style.background = "#FFFFFF";
					document.getElementById("p12").style.background = "#FFFFFF";
					document.getElementById("q10").checked="true";
				}
				function c11(){
					document.getElementById("p11").style.background = "#27c8e8";
					document.getElementById("p1").style.background = "#FFFFFF";
					document.getElementById("p2").style.background = "#FFFFFF";
					document.getElementById("p3").style.background = "#FFFFFF";
					document.getElementById("p4").style.background = "#FFFFFF";
					document.getElementById("p6").style.background = "#F6F6F6";
					document.getElementById("p7").style.background = "#F6F6F6";
					document.getElementById("p8").style.background = "#F6F6F6";
					document.getElementById("p5").style.background = "#F6F6F6";
					document.getElementById("p9").style.background = "#FFFFFF";
					document.getElementById("p10").style.background = "#FFFFFF";
					document.getElementById("p12").style.background = "#FFFFFF";
					document.getElementById("q11").checked="true";
				}
				function c12(){
					document.getElementById("p12").style.background = "#27c8e8";
					document.getElementById("p1").style.background = "#FFFFFF";
					document.getElementById("p2").style.background = "#FFFFFF";
					document.getElementById("p3").style.background = "#FFFFFF";
					document.getElementById("p4").style.background = "#FFFFFF";
					document.getElementById("p6").style.background = "#F6F6F6";
					document.getElementById("p7").style.background = "#F6F6F6";
					document.getElementById("p8").style.background = "#F6F6F6";
					document.getElementById("p5").style.background = "#F6F6F6";
					document.getElementById("p9").style.background = "#FFFFFF";
					document.getElementById("p11").style.background = "#FFFFFF";
					document.getElementById("p10").style.background = "#FFFFFF";
					document.getElementById("q12").checked="true";
				}
			</script>
			<div style="margin:0 auto;display:block;">
				<form action="../yibaopay.do" method="post">
					<table>
						<tr>
							<td style="width:350px">请您选择在线支付银行</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td id="p1" onclick="c1()"><INPUT TYPE="radio" NAME="pd_FrpId" value="CMBCHINA-NET" checked="checked" id="q1">招商银行
							</td>
							<td id="p2" onclick="c2()"><INPUT TYPE="radio" NAME="pd_FrpId" value="ICBC-NET" id="q2">工商银行</td>
							<td id="p3" onclick="c3()"> <INPUT TYPE="radio" NAME="pd_FrpId" value="ABC-NET" id="q3">农业银行</td>
							<td id="p4" onclick="c4()"><INPUT TYPE="radio" NAME="pd_FrpId" value="CCB-NET" id="q4">建设银行</td>
						</tr>
						<tr>
							<td id="p5" onclick="c5()"><INPUT TYPE="radio" NAME="pd_FrpId" value="CMBC-NET" id="q5">中国民生银行总行</td>
							<td id="p6" onclick="c6()"><INPUT TYPE="radio" NAME="pd_FrpId" value="CEB-NET" id="q6">光大银行
							</td>
							<td id="p7" onclick="c7()"><INPUT TYPE="radio" NAME="pd_FrpId" value="BOCO-NET" id="q7">交通银行</td>
							<td id="p8" onclick="c8()"><INPUT TYPE="radio" NAME="pd_FrpId" value="SDB-NET" id="q8">深圳发展银行</td>
						</tr>
						<tr>
							<td id="p9" onclick="c9()"><INPUT TYPE="radio" NAME="pd_FrpId" value="BCCB-NET" id="q9">北京银行</td>
							<td id="p10" onclick="c10()"><INPUT TYPE="radio" NAME="pd_FrpId" value="CIB-NET" id="q10">兴业银行
							</td>
							<td id="p11" onclick="c11()"><INPUT TYPE="radio" NAME="pd_FrpId" value="SPDB-NET" id="q11">上海浦东发展银行
							</td>
							<td id="p12" onclick="c12()"><INPUT TYPE="radio" NAME="pd_FrpId" value="ECITIC-NET" id="q12">中信银行</td>
						</tr>
						<tr>
							<td><INPUT TYPE="submit" class="submit-btn" value="确定支付"
								style="width: 150px;height: 36px;font-size: 20px;margin-right: 35px;text-align: center;background: #27c8e8;color: #fff;">
							</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div class="footer">Copyright © 2017 IBeauty项目小组</div>

		<script src="/pub//js/index.js?ff47ea6338e974b71eb1"></script>
	</div>
</body>
</html>