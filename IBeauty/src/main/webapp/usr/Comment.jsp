<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>评价</title>

<link rel="stylesheet" href="../static/css/style.css" />

<link rel="stylesheet" type="text/css" href="../static/css/Comment.css">




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

<script type="text/javascript">
	function change1() {
		$(".c1").attr('src', "../static/img/hui.png");
	}
	function change2() {
		$(".c1").attr('src', "../static/img/hui.png");
		$(".c2").attr('src', "../static/img/hui.png");
	}
	function change3() {
		$(".c1").attr('src', "../static/img/huang.png");
		$(".c2").attr('src', "../static/img/huang.png");
		$(".c3").attr('src', "../static/img/huang.png");
	}
	function change4() {
		$(".c1").attr('src', "../static/img/huang.png");
		$(".c2").attr('src', "../static/img/huang.png");
		$(".c3").attr('src', "../static/img/huang.png");
		$(".c4").attr('src', "../static/img/huang.png");
	}
	function change5() {
		$(".c1").attr('src', "../static/img/huang.png");
		$(".c2").attr('src', "../static/img/huang.png");
		$(".c3").attr('src', "../static/img/huang.png");
		$(".c4").attr('src', "../static/img/huang.png");
		$(".c5").attr('src', "../static/img/huang.png");
	}
</script>

<script type="text/javascript">
	function cli() {
		//alert("1");
		var content = document.getElementById("content").value;
		//alert(content);
		$.ajax({
			url : '../mycomment.do?content=' + content,
			async : true,
			success : function(data) {
				if (data == "Y") {
					document.getElementById("tijiao").style.display = "none";
					$("#xianshi").text("评价已提交！");
					document.getElementById("chakan").style.display = "block";
					//document.getElementById("tips2").text("提交成功！");
				} else {
					$("#xianshi").text("请填写评价！");
				}
			}
		});
	}
</script>
</head>
<body>
	<div class="main">
		<jsp:include page="../header.jsp" />
		<!--用户评价开始-->
		<div class="wrap1">
			<div class="com">

				<div class="com1">
					<div class="title">
						<div class="tit">商城星级</div>
						<div class="tit2">
							<img src="../static/img/huang.png"><img
								src="../static/img/huang.png"> <img
								src="../static/img/huang.png"><img
								src="../static/img/huang.png"></img>
						</div>
					</div>
					<div class="com2">
						<div class="top">
							<h4>宝贝评价</h4>
						</div>
						<div class="center">
							<form>
								<table class="tab">
									<tr id="row1">
										<td id="l1">宝贝</td>
										<td id="l2">宝贝描述</td>
										<td id="l3">评分</td>
									</tr>

									<tr id="row2">
										<td id="l1"><img src="../static/${commentProduct.src}"></img></td>
										<td id="l2"><div class="ll2">${commentProduct.product_name}</div></td>
										<td id="l3">
											<div class="item">
												<span data-type="match" class="rate-stars"
													style="position: absolute; left: -9999px;"> </span> <span
													class="ks-simplestar"> <img onclick="change1()"
													class="c1" src="../static/img/xing.png"></a> <img
													onclick="change2()" class="c2" src="../static/img/xing.png">
													<img onclick="change3()" class="c3"
													src="../static/img/xing.png"> <img
													onclick="change4()" class="c4" src="../static/img/xing.png">
													<img onclick="change5()" class="c5"
													src="../static/img/xing.png">
												</span>
												<div class="rate-msg-handle">
													<button type="button" class="butt" style="display: none;">
														<i class="tb-rate-ico-bg ico-bubble"></i><span
															class="J_txt">添加评论</span>
													</button>
												</div>
											</div>

											<div class="rate-msg-box" style="display: block;">
												<div class="bd">
													<div class="textinput">
														<span class="ph-label"></span>

														<textarea id="content" maxlength=""
															aria-labelby="label-ti-31100868710309990"
															class="rate-msg"></textarea>

														<p class="text-counter">
															还可以输入<strong class="r-t-counter">500</strong>字
														</p>
													</div>
												</div>
												<div class="ft">
													<button type="button" class="close-msg-box">收起评论</button>
													<ul class="rate-msg-option">
														<li><select class="privacy-control"
															name="anony31100868710309990" id="anony31100868710309990"
															disabled="">
																<option value="" selected="">公开评论</option>
																<option value="1">匿名评论</option>
														</select></li>
													</ul>
												</div>
											</div>
										</td>
									</tr>
								</table>
								<div class="sub">
									<div id="tijiao">
										<input type="button" value="提交评价" onclick="cli()"
											style="width:100px;height:40px;background:#d91966;color:#fff;font-size:14px" />
									</div>
									<div id="tips2"
										style="position:relative;width:200px;color:red;left:750px;"></div>
									<div id="xianshi"></div>
									<div id="chakan">
										<a href="../findComment.do">查看我的评价</a>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--}用户评价结束-->


		<script type="text/javascript"
			src="https://assets.sephome.com/libs/jquery-plugin/jquery.url/1.0/url.min.js?t=1496374617499"></script>
		<script type="text/javascript"
			src="https://assets.sephome.com/libs/jquery-plugin/jquery.superslide/2.1.1/jquery.superslide.min.js?t=1496374617499">
			
		</script>
		<script type="text/javascript"
			src="https://assets.sephome.com/system/b2c/templates/default/js/common.js?t=1496374617499">
			
		</script>
		<script type="text/javascript"
			src="https://assets.sephome.com/libs/sfm/0.1/util.js?t=1496374617499">
			
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