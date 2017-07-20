<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<title>我的订单</title>
<link rel="stylesheet" href="../static/css/style.css" />
<link rel="stylesheet" type="text/css" href="../static/css/myorder.css">
<!-- <link rel="stylesheet" href="https://assets.sephome.com/system/b2c/templates/default/css/common.css?t=a1496374685051"/>
    <link rel="stylesheet" href="https://assets.sephome.com/system/b2c/templates/default/css/modules.css?t=a1496374685051"/> -->
<!--下拉面板-->
<script type="text/javascript"
	src="../static/js/jquery-1.7.2.min.js?t=1496299121701"></script>
<script type="text/javascript"
	src="../static/js/jquery.bigautocomplete.js?t=1496299121701"></script>
<script type="text/javascript"
	src="../static/js/commonFooter.js?t=1496299121701"></script>
<!--head-->
<script type="text/javascript" src="../static/js/head.js"></script>

<script type="text/javascript">
	function change1() {
		document.getElementById("p1").style.borderColor = "#d91966";
		document.getElementById("p2").style.borderColor = "#666";
		document.getElementById("p3").style.borderColor = "#666";
		document.getElementById("p4").style.borderColor = "#666";
	}
	function change2() {
		document.getElementById("p2").style.borderColor = "#d91966";
		document.getElementById("p1").style.borderColor = "#666";
		document.getElementById("p3").style.borderColor = "#666";
		document.getElementById("p4").style.borderColor = "#666";
	}
	function change3() {
		document.getElementById("p3").style.borderColor = "#27c8e8";
		document.getElementById("p2").style.borderColor = "#E5E5E5";
		document.getElementById("p1").style.borderColor = "#E5E5E5";
		document.getElementById("p4").style.borderColor = "#E5E5E5";
	}
	function change4() {
		document.getElementById("p4").style.borderColor = "#27c8e8";
		document.getElementById("p2").style.borderColor = "#E5E5E5";
		document.getElementById("p3").style.borderColor = "#E5E5E5";
		document.getElementById("p1").style.borderColor = "#E5E5E5";
	}
</script>
       <!-- 对session属性干扰 -->
    <!-- <script type="text/javascript"
		src="https://assets.sephome.com/libs/sfm/0.1/util.js?t=1496374617499">
	</script> -->
	<script type="text/javascript"
		src="https://assets.sephome.com/libs/jquery-plugin/jquery.url/1.0/url.min.js?t=1496374617499"></script>
	<script type="text/javascript"
		src="https://assets.sephome.com/libs/jquery-plugin/jquery.superslide/2.1.1/jquery.superslide.min.js?t=1496374617499">
	</script>
	<script type="text/javascript"
		src="https://assets.sephome.com/system/b2c/templates/default/js/common.js?t=1496374617499">	
	</script>
	<script type="text/javascript"
		src="https://assets.sephome.com/libs/jquery-plugin/jquery.xdomainrequest/jquery.xdomainrequest.min.js">
		
	</script>
	<script type="text/javascript"
		src="https://assets.sephome.com/libs/sfm/0.1/stats.js?t=1496374617499">
		
	</script>
	<script type="text/javascript"
		src="https://assets.sephome.com/libs/jquery-plugin/jquery.cookie/1.4.1/jquery.cookie.min.js">
		
	</script>
	<script type="text/javascript"
		src="https://assets.sephome.com/system/b2c/js/common/commonFooter.js?t=1496374617499">
		
	</script>
	<script type="text/javascript"
		src="https://assets.sephome.com/system/b2c/js/app/my_sidebar.js?t=1496374685051">
		
	</script>
	<script type="text/javascript"
		src="https://assets.sephome.com/system/b2c/js/common/page.js?t=1496374685051">	
	</script>
	<script type="text/javascript">
		$(document).ready(
				function() {
					SFM.Page($("#my_order_page"), $("#my_order_page").attr(
							"data-bind-first-page-url"));
					///评论页加载
					$(".uc_order .tabs li").click(
							function() {
								$(".uc_order .tabs li").removeClass("current");
								$(this).addClass("current");

								var firstPageUrl = $(this).find("a").attr(
										"data-bind-first-page-url");
								var targetObj = $("#my_order_page");
								SFM.Page(targetObj, firstPageUrl);
							});
				});
	</script>

	<script>
		(function() {
			var bp = document.createElement('script');
			var curProtocol = window.location.protocol.split(':')[0];
			if (curProtocol === 'https') {
				bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
			} else {
				bp.src = 'http://push.zhanzhang.baidu.com/push.js';
			}
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(bp, s);
		})();
	</script>
</head>
<body>

	<!--——————————————————————要添加别的页面——————————————————————-->
	<div class="main">
		<jsp:include page="../header.jsp" />
		<!--用户中心首页开始-->
		<div class="wrap">
			<table>
				<tbody>
					<tr>
						<td>
							<!--个人中心左栏占位-->
							<div class="com_left">
								<iframe src="./personalleft.jsp" background="black"
									scrolling="no" frameborder="0" marginheight="0px"
									marginwidth="0px" width="200px" height="400px"></iframe>
							</div> <!--个人中心左栏占位结束-->
						</td>
						<td>
							<!--右栏开始-->
							<div class="com_right">
								<div class="crumb">
									<ul>
										<li class="home"><a href="/"></a></li>
										<li class="step_arrow"></li>
										<li><a href="个人中心.html">个人首页</a></li>
										<li class="step_arrow">>></li>
										<li>我的订单</li>
									</ul>
								</div>
								<div class="account-content address_manage">
									<div class="personal_account clearfix">
										<div class="title_bar">
											<h2>我的订单</h2>
										</div>
										<div class="commodity_consult uc_order">
											<div class="tab_nav nav_top">
												<ul class="tabs">
													<li class="left current" id="p1"><a
														href="../order.do?click=1" onclick="change1()" target="_top">全部</a></li>
													<li id="p2"><a href="../order.do?click=2"
														onclick="change2()" target="_top">待付款</a></li>

													<li id="p3"><a href="../order.do?click=3" target="_top">待收货</a></li>
													<li id="p4"><a href="../order.do?click=4" target="_top">待评价</a></li>
												</ul>
											</div>
											<div class="list">
												<!--分页-->
												<div id="my_order_page"
													data-bind-first-page-url="/my/order/list?page=1">
													<div class="main-table">

														<form action="../comment.do">

															<table border="0" cellspacing="0" cellpadding="10"
																width="1200px" class="table-list" id="carttable">
																<tbody>
																	<tr id="row1">
																		<td class="c1"><label class="" for="checkAll"></label>
																			<!--<span class="check-box"></span>--> <input
																			type="checkbox" name="allchoose" class="box"
																			id="Allchoo" /></td>
																		<td class="c2">全选</td>
																		<td class="c3">商品</td>

																		<td class="c5">数量</td>
																		<td class="c6">小计</td>
																		<td class="c7">商品操作</td>
																		<td class="c8">交易状态</td>
																		<td class="c9">交易操作</td>
																	
																		<c:forEach items="${orderlist}" var="b">
																			<tr id="row2">
																				<td class="c1"><input type="checkbox"
																					name="choose1" class="box" id="choo1" /></td>
																				<td class="c2"></td>
																				<td class="c3"><img
																					src="../static/${b.product_pic}" width="70px"
																					height="70px"></td>

																				<td class="c5">${b.number}</td>
																				<td class="c6">${b.total_price}</td>
																				<td class="c7"><a href="">退款/退货</a><br> <a
																					href="">投诉卖家</a></td>
																				<c:choose>
																					<c:when test="${b.status==0}">
																						<td class="c8">待付款</td>
																					</c:when>
																					<c:when test="${(b.status==1)&&(b.re_status==0)}">
																						<td class="c8">待收货</td>
																					</c:when>
																					<c:when
																						test="${(b.status==1)&&(b.re_status==1)&&(b.ping_status==0)}">
																						<td class="c8">待评价</td>
																					</c:when>
																					<c:otherwise>
																						<td class="c8">已评价</td>
																					</c:otherwise>
																				</c:choose>

																				<c:choose>
																					<c:when test="${b.status==0}">
																						<td class="c9"><input type="button" value="去付款" onclick="window.location.href='../gobuy.do?product_id=${b.product_id }&num=${ b.number}&id=${b.id}&order_id=${b.order_id}'" style="width:70px;height:30px;background:#ac7cbc;color:#fff;font-size:14px" /></td>
																					</c:when>
																					<c:when test="${(b.status==1)&&(b.re_status==0)}">
																						<td class="c9"><input type="button"
																							onclick="window.location.href='../receive.do?id=${b.id}'"
																							value="确认收货"
																							style="width:70px;height:30px;background:#ac7cbc;color:#fff;font-size:14px" /></td>
																					</c:when>
																					<c:when
																						test="${(b.status==1)&&(b.re_status==1)&&(b.ping_status==0)}">
																						<td class="c9"><input type="button"
																							value="去评价"
																							onclick="window.location.href='../comment.do?id=${b.product_id}'"
																							style="width:70px;height:30px;background:#ac7cbc;color:#fff;font-size:14px" /></td>
																					</c:when>
																					<c:otherwise>
																						<td class="c9"><input type="submit"
																							value="已评价"
																							style="width:70px;height:30px;background:#ac7cbc;color:#fff;font-size:14px" /></td>
																					</c:otherwise>
																				</c:choose>

																			</tr>
																		</c:forEach>
																		
																</tbody>
															</table>
														</form>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div> <!--}右栏结束-->
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!--}用户中心结束-->
		<div>
			<!--——————————————————————要添加别的页面——————————————————————-->
			<iframe src="../foot.jsp" scrolling="no" frameborder="0"
				marginheight="0px" marginwidth="0px" height="284px" width="100%"></iframe>
		</div>
	</div>
</body>
</html>