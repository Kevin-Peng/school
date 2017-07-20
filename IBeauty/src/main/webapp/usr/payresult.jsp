<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="utf-8">

<title>支付结果</title>

<link rel="shortcut icon" href=images/favicon.ico type=image/x-icon>
<link href="../static/css/pay/commonpayresult.css" rel="stylesheet">
<link href="../static/css/pay/tastesdk.css" rel="stylesheet">
</head>


<body>
	<div class="tastesdk tastesdkres">
		<div class=tastesdk-box>
			<div class=main style=padding-top:50px>
				<div class=typedemo style=display:block>
					<div class=tit>IBeauty | 网页支付结果</div>
					<div class=demo-pc>
						<div class=pay-res>
						    <c:choose>
							<c:when test="${order.status ==0}">
							<h4 class="res-title dft-process" id="result" style="color: #27c8e8; font-size: 40px; ">支付尚未完成</h4>
							</c:when>
							<c:when test="${order.status ==1}">
							<h4 class="res-title dft-process" id="result" style="color: #27c8e8; font-size: 40px; ">支付已完成</h4>
							</c:when>
							<c:otherwise>
							<h4 class="res-title dft-process" id="result" style="color: #27c8e8; font-size: 40px; ">订单丢失，请重新提交支付</h4>
							</c:otherwise>
							</c:choose>
							<div class=pro-infor>
								<p>
									订单名称： ${orderproname }<br> 实付金额： <span class=info-money>¥${order.total_price }</span>
									<br> &#12288;收款方： IBeauty团队<br> 订单编号： <span
										class=info-orderid>${order.id }</span> <br
										class=dft-info>&#12288;&#12288;&#12288;&#12288;&#12288;<em
										class="dft-info suc-t">(进入“个人中心－我的订单”通过订单编号进行订单查询)</em>
								</p>
								
							</div>
							<div class=suc-btns>
								<button class="pcdemo-btn back-demo-btn" ta=返回首页 onclick="window.location.href='../index.jsp'"></button>
								<a class="dft-info gocheckorderid" href="../myorder.do">查询订单</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="../static/js/common.js"></script>
	<script type="text/javascript"
		src="../static/js/tastesdk.js"></script>
</body>
</html>
