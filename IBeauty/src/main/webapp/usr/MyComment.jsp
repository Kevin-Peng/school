<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>我的订单</title>
<link rel="stylesheet" type="text/css" href="../static/css/collect.css" />
<link rel="stylesheet" href="../static/css/style.css" />
<link rel="stylesheet" type="text/css" href="../static/css/myorder.css">
<link rel="stylesheet" type="text/css"
	href="../static/css/mycomment.css">

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
<script type="text/javascript" src="../static/js/jquery.min.js"></script>
<script type="text/javascript" src="../static/js/head.js"></script>
</head>
<body>

	<!--——————————————————————要添加别的页面——————————————————————-->
	<div class="main">
		<jsp:include page="../header.jsp" />
		<!--用户中心首页开始-->
		<div class="wrap">
			<table>
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
									<li>我的评价</li>
								</ul>
							</div>
							<div class="account-content address_manage">
								<div class="personal_account clearfix">
									<div class="title_bar">
										<h2>我的评价</h2>

									</div>
									<div class="commodity_consult uc_order">
										<div class="tab_nav nav_top">
											<ul class="tabs">
												<li class="left current" id="p1"><a
													href="../order.do?click=1" onclick="change1()">全部评价</a></li>
											</ul>
										</div>
										<div class="list">
											<!--分页-->
											<div id="my_order_page"
												data-bind-first-page-url="/my/order/list?page=1">
												<div class="main-table">
                               <c:choose>
                                 <c:when test="${comlist ==null}">
                                   <div class="comerro">
                                   <p>${mycommenterror}</p>
                                   </div>
                                 </c:when>
                                 <c:otherwise>
													<form action="">

														<table border="0" cellspacing="0" cellpadding="10"
															width="1200px" class="table-list" id="carttable">
															<tbody>
																<tr id="row1">
																	<div class="row11">
																		<td class="c1">宝贝</td>
																		<td class="c2">宝贝描述</td>
																		<td class="c3">我的评价</td>
																	</div>
																	<c:forEach items="${comlist }" var="b">
																		<tr id="row2">
																			<td class="c1"><a href="../toDetail.do?productid=${b.product_id }"><img src="../static/${b.src}"></img></a></td>
																			<td class="c2">${b.product_name}</td>
																			<td class="c3">${b.content}</td>
																		</tr>
																	</c:forEach>
															</tbody>
														</table>
													</form>
												</c:otherwise>
											</c:choose>
												</div>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div> <!--}右栏结束-->
					</td>
				</tr>
			</table>
		</div>

		<!--}用户中心结束-->


		<script type="text/javascript"
			src="https://assets.sephome.com/libs/jquery-plugin/jquery.url/1.0/url.min.js?t=1496374617499"></script>
		<script type="text/javascript"
			src="https://assets.sephome.com/libs/jquery-plugin/jquery.superslide/2.1.1/jquery.superslide.min.js?t=1496374617499">
			
		</script>
		<script type="text/javascript"
			src="https://assets.sephome.com/system/b2c/templates/default/js/common.js?t=1496374617499">
			
		</script>
		<!-- <script type="text/javascript"
			src="https://assets.sephome.com/libs/sfm/0.1/util.js?t=1496374617499">
		</script> -->
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




		<div>
			<!--——————————————————————要添加别的页面——————————————————————-->
			<iframe src="../foot.jsp" scrolling="no" frameborder="0"
				marginheight="0px" marginwidth="0px" height="284px" width="100%"></iframe>
		</div>
	</div>

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
</body>
</html>