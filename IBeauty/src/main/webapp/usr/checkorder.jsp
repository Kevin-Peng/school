<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>核对订单 - ibeauty 美，从这里开始</title>


<link rel="stylesheet" type="text/css"
	href="../static/css/checkorder.css" />
<link rel="stylesheet" href="../static/css/style.css" />
<!--header样式-->
<link href="../static/css/header.css" rel="stylesheet" style="text/css" />
<!--下拉面板-->
<script type="text/javascript"
	src="../static/js/jquery-1.7.2.min.js?t=1496299121701"></script>
<script type="text/javascript"
	src="../static/js/jquery.bigautocomplete.js?t=1496299121701"></script>
<script type="text/javascript"
	src="../static/js/commonFooter.js?t=1496299121701"></script>
<!--head-->
<script type="text/javascript" src="../static/js/jquery.min.js"></script>
<script type="text/javascript" src="../static/js/head.js"></script>

</head>
<body onload="getcart()">
	<div class="main">
		<jsp:include page="../header.jsp" />
		<div class="wrapper">
			<div class="menu1">
				<ul class="step">
					<li class="two">
						<div class="step-content">
							<h5 class="step-heading">1.我的购物车</h5>
						</div>
					</li>
					<li class="one">
						<div class="step-content">
							<h5 class="step-heading" style="color:black;">2.填写核对订单信息</h5>
						</div>
					</li>
					<li class="three">
						<div class="step-content">
							<h5 class="step-heading">3.成功提交订单</h5>
						</div>
					</li>
				</ul>
				<div class="main-table">
					<table border="0" cellspacing="0" cellpadding="10" width="1200px"
						class="table-list" id="carttable">
						<tbody>
							<tr id="row1">
								<td class="c3">商品</td>
								<td class="c4">价格</td>
								<td class="c5">数量</td>
								<td class="c6">小计</td>
								<%
									int row = 0;
									double count = 0;
								%>
								<c:forEach items="${list}" var="b">
									<tr id="row2">
										<td class="c3"><img src="../static/${b.product_pic}"
											width="70px" height="70px"></td>
										<td class="c4">${b.price}</td>
										<td class="c5">${b.number}</td>
										<td class="c6">${b.total_price}</td>
									</tr>
									<%
										row++;
									%>
								</c:forEach>
								<%
									session.setAttribute("row", row);
								%>
							
						</tbody>
					</table>
				</div>
				<div class="jiesuan">

					<div class="the2">
						已选中 <span id="allnumber"><input type="text" value="${row}"
							id="pnumber"
							style="background:none;border:0;width:50px;text-align:center;"></span>件商品
					</div>
					<div class="the3">
						总价（不含运费）:￥ <span id="allprice"><input type="text"
							value="${jiage}" id="pcount" data-now="1" autocomplete="off"
							style="background:none;border:0;width:50px;text-align:center;"></span>
					</div>


				</div>
				<!--jiesuan-->
			</div>
			<!--menu1-->
			<div class="the1-1">
				<div class="the1">

					<!--——————————————————————要添加别的页面——————————————————————-->
				</div>
			</div>

			<div class="the5">

				<script>
					var div1 = document.getElementById("confirmdiv");
					function canel() {
						div1.style.display = "none";
					}
				</script>

				<div class="confirm-pop" id="confirmdiv">
					<div class="confirm">
						<h4>确认支付</h4>
						<p>
							请在新打开的页面进行支付！<span>支付完成前请不要关闭此窗口</span>
						</p>
						<div class="confirm-btns">
							<button class="finish-btn" ta="已完成支付"
								onclick="window.location.href='../payresult.do'"></button>
							<button class="change-pay" ta="更换支付方式" onclick="canel()"></button>
						</div>
						<p>
							支付遇到问题？请联系<span>IBeauty客服</span>获得帮助
						</p>
					</div>
				</div>

				<script type="text/javascript">
					function change1() {
						document.getElementById("p1").style.borderColor = "#27c8e8";
						document.getElementById("p2").style.borderColor = "#E5E5E5";
						document.getElementById("p3").style.borderColor = "#E5E5E5";
						document.getElementById("p4").style.borderColor = "#E5E5E5";
						document.getElementById("p5").style.borderColor = "#E5E5E5";
					}
					function change2() {
						document.getElementById("p2").style.borderColor = "#27c8e8";
						document.getElementById("p1").style.borderColor = "#E5E5E5";
						document.getElementById("p3").style.borderColor = "#E5E5E5";
						document.getElementById("p4").style.borderColor = "#E5E5E5";
						document.getElementById("p5").style.borderColor = "#E5E5E5";
					}
					function change3() {
						document.getElementById("p3").style.borderColor = "#27c8e8";
						document.getElementById("p2").style.borderColor = "#E5E5E5";
						document.getElementById("p1").style.borderColor = "#E5E5E5";
						document.getElementById("p4").style.borderColor = "#E5E5E5";
						document.getElementById("p5").style.borderColor = "#E5E5E5";
					}
					function change4() {
						document.getElementById("p4").style.borderColor = "#27c8e8";
						document.getElementById("p2").style.borderColor = "#E5E5E5";
						document.getElementById("p3").style.borderColor = "#E5E5E5";
						document.getElementById("p1").style.borderColor = "#E5E5E5";
						document.getElementById("p5").style.borderColor = "#E5E5E5";
					}
					function change5() {
						document.getElementById("p5").style.borderColor = "#27c8e8";
						document.getElementById("p2").style.borderColor = "#E5E5E5";
						document.getElementById("p3").style.borderColor = "#E5E5E5";
						document.getElementById("p1").style.borderColor = "#E5E5E5";
						document.getElementById("p4").style.borderColor = "#E5E5E5";
					}
				</script>

				<h5 style="margin-bottom:16px;font-weight:400;">选择支付方式</h5>

				<ul class="pay-label"
					style="border:1px solid #E5E5E5;padding:0 20px 70px;">
					<li
						style="float:left;width:150px;height:42px;position:relative;margin:15px 40px 0 0;display:inline;">
						<input type="radio" value="beautypay" checked="checked"
						name="channel" id="beautypay" onclick="change1()"
						style="position:absolute;left:0;top:0;width:100%;height:40px;opacity:0;outline:none;">
						<label id="p1" for="beautypay"
						style="position:absolute;left:0;top:0;width:148px;height:40px;border:1px solid #27c8e8;text-align:center;line-height:38px;vertical-align:middle;">
							<img src="../static/img/beautypay.png" alt="IBeauty支付"
							style="vertical-align:middle;"></img>
					</label>
					</li>

					<li
						style="float:left;width:150px;height:42px;position:relative;margin:15px 40px 0 0;display:inline;">
						<input type="radio" value="zfb" name="channel" id="zfb"
						onclick="change2()"
						style="position:absolute;left:0;top:0;width:100%;height:40px;opacity:0;">
						<label id="p2" for="zfb"
						style="position:absolute;left:0;top:0;width:148px;height:40px;border:1px solid #e5e5e5;text-align:center;line-height:38px;vertical-align:middle;">
							<img src="../static/img/alipay.png" alt="支付宝"
							style="vertical-align:middle;"></img>
					</label>
					</li>

					<li
						style="float:left;width:150px;height:42px;position:relative;margin:15px 40px 0 0;display:inline;">
						<input type="radio" value="baifubao" name="channel" id="baifubao"
						onclick="change3()"
						style="position:absolute;left:0;top:0;width:100%;height:40px;opacity:0;">
						<label id="p3" for="baifubao"
						style="position:absolute;left:0;top:0;width:148px;height:40px;border:1px solid #e5e5e5;text-align:center;line-height:38px;vertical-align:middle;">
							<img src="../static/img/baidupay.png" alt="百度支付"
							style="vertical-align:middle;"></img>
					</label>
					</li>

					<li
						style="float:left;width:150px;height:42px;position:relative;margin:15px 40px 0 0;display:inline;">
						<input type="radio" value="wxpay" name="channel" id="wxpay"
						onclick="change4()"
						style="position:absolute;left:0;top:0;width:100%;height:40px;opacity:0;">
						<label id="p4" for="wxpay"
						style="position:absolute;left:0;top:0;width:148px;height:40px;border:1px solid #e5e5e5;text-align:center;line-height:38px;vertical-align:middle;">
							<img src="../static/img/wxpay.png" alt="微信支付"
							style="vertical-align:middle;"></img>
					</label>
					</li>
					
					<li
						style="float:left;width:150px;height:42px;position:relative;margin:15px 40px 0 0;display:inline;">
						<input type="radio" value="yibaopay" name="channel" id="yibaopay"
						onclick="change5()"
						style="position:absolute;left:0;top:0;width:100%;height:40px;opacity:0;">
						<label id="p5" for="yibaopay"
						style="position:absolute;left:0;top:0;width:148px;height:40px;border:1px solid #e5e5e5;text-align:center;line-height:38px;vertical-align:middle;">
							<img src="../static/img/yibao.png" alt="易宝支付"
							style="vertical-align:middle;"></img>
					</label>
					</li>
			</div>

			<script type="text/javascript">
				function pay() {
					if (document.getElementById("beautypay").checked) {
						window.open("../payibeauty.do");
					} else if (document.getElementById("zfb").checked) {
						window.open("../alipay.do");
					} else if (document.getElementById("baifubao").checked) {
						window.open("../paybaidu.do");
					} else if (document.getElementById("wxpay").checked) {
						window.open("../paywx.do");
					}else if(document.getElementById("yibaopay").checked){
						window.open("../toyibaopay.do");
					}
					;
				}
			</script>

			<script>
				var div1 = document.getElementById("confirmdiv");
				function confirm() {
					div1.style.display = "block";
				}
			</script>
			<div class="the4-1">
				<div class="the4">
					<button class="button" type="submit" onclick="pay();confirm()">去&nbsp;&nbsp;支&nbsp;&nbsp;付</button>
				</div>
			</div>
			<iframe src="../foot.jsp" scrolling="no" frameborder="0"
				marginheight="0px" marginwidth="0px" height="284px" width="100%"></iframe>
		</div>		
		<!--wrapper-->
	</div>
	<!--main-->

	<div class="foot">
		<!--——————————————————————要添加别的页面——————————————————————-->
	</div>

</body>
</html>