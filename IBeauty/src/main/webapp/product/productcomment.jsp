<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>商品评价</title>
<!--下拉面板样式-->
<link rel="stylesheet" href="../static/css/wangtianhui/style.css" />
<!--header样式-->
<link href="../static/css/wangtianhui/header.css" rel="stylesheet"
	style="text/css" />
<link href="../static/css/wangtianhui/prodetail.css" rel="stylesheet" />
<link href="../static/css/wangtianhui/wangtianhui.css" rel="stylesheet" />


	<link href="../static/css/wangtianhui/productcomment1.css"
	rel="stylesheet" />
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
		document.getElementById("p1").style.borderColor = "#27c8e8";
		document.getElementById("p2").style.borderColor = "#E5E5E5";
		document.getElementById("p3").style.borderColor = "#E5E5E5";
		document.getElementById("p4").style.borderColor = "#E5E5E5";
		var oto1 = document.getElementById("p1");
		var oto2 = document.getElementById("pic_panel");
		oto2.innerHTML = oto1.innerHTML;
	}
	function change2() {
		document.getElementById("p2").style.borderColor = "#27c8e8";
		document.getElementById("p1").style.borderColor = "#E5E5E5";
		document.getElementById("p3").style.borderColor = "#E5E5E5";
		document.getElementById("p4").style.borderColor = "#E5E5E5";
		var oto1 = document.getElementById("p2");
		var oto2 = document.getElementById("pic_panel");
		oto2.innerHTML = oto1.innerHTML;
	}
	function change3() {
		document.getElementById("p3").style.borderColor = "#27c8e8";
		document.getElementById("p2").style.borderColor = "#E5E5E5";
		document.getElementById("p1").style.borderColor = "#E5E5E5";
		document.getElementById("p4").style.borderColor = "#E5E5E5";
		var oto1 = document.getElementById("p3");
		var oto2 = document.getElementById("pic_panel");
		oto2.innerHTML = oto1.innerHTML;
	}
	function change4() {
		document.getElementById("p4").style.borderColor = "#27c8e8";
		document.getElementById("p2").style.borderColor = "#E5E5E5";
		document.getElementById("p1").style.borderColor = "#E5E5E5";
		document.getElementById("p3").style.borderColor = "#E5E5E5";
		var oto1 = document.getElementById("p4");
		var oto2 = document.getElementById("pic_panel");
		oto2.innerHTML = oto1.innerHTML;
	}
</script>

<script type="text/javascript">
	function fabiao() {
		var ctext = document.getElementById("commenttext").value;
		if (ctext != null) {
			document.getElementById("tdata").value = ctext;
			document.getElementById("commenttext").value = null;
		} else {
			ctext = "请输入回复内容！";
			document.getElementById("tdata").value = ctext;
		}
	}
</script>



<script src="./M 唯美_files/push.js"></script>
<script src="./M 唯美_files/hm.js"></script>
<script type="text/javascript" src="./M 唯美_files/pageload.js"></script>
<script type="text/javascript" src="./M 唯美_files/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	var _usd = '0', _dau = 'https://data.vmei.com/data.do', _sed = 'vmei.com';
</script>
<script type="text/javascript" src="./M 唯美_files/commonHead.js"></script>

<!--
  <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script> 
  <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
  <script type="text/javascript" src="js/jquery.min.js"></script> 
  <script type="text/javascript" src="js/productLibrary.js"></script> 
  <script type="text/javascript" src="js/index.js"></script> 
  -->
<style>
.wrapper {
	padding: 0 0.75rem;
	max-width: 1200px;
	margin: 0 auto;
}

a {
	text-decoration: none;
	cursor: pointer;
}

body {
	background-color: #FFFFFF;
}
</style>
</head>
<body>
	<div class="main">
		<jsp:include page="../header.jsp" />
		<!--用户评论开始-->
		<div class="e_region">
			<div class="e_module">
				<div class="wrap container clearfix">
					<!--左栏开始{-->
					<div class="com_left">
						<div class="slider cat_slider">
							<div class="title">
								<h2>商品信息</h2>
							</div>
							<div class="baskinfo_bar">
								<p>
									<a href="./detail.jsp" target="_blank"><img
										src="../static/${pcomment.ppic }" width="190" height="140" /></a>
								</p>
								<p>商品名称：${pcomment.pname }</p>
								<p>小思价：${pcomment.price }</p>
								<p>
									<span>评价得分：</span> <a
										href="https://www.vmei.com/productComment/detail/145877#proclient_report"
										class="star"> <em style="width:0%"></em>
									</a>
								</p>
								<p>
									评论数：<span id="productCommentReplyNumber-id">${pcomment.comNumber}</span>条
								</p>
								<p class="product_summary">
									<a href="../usr/cart.jsp" class="btn buy" target="_top"
										title="加入购物车">加入购物车</a>
								</p>
							</div>
						</div>
					</div>
					<!--}左栏结束-->
					<!--右栏开始{-->
					<div class="com_right">
						<div class="crumb">
							<ul>
								<li class="home"><a href="./first.html"></a></li>
								<li><a href="./caizhuangxuanze.html" target="_blank">${pcomment.texture }</a></li>
								<li class="step_arrow"></li>
								<li><a href="./detail.html" target="_blank">${pcomment.pname }</a></li>
							</ul>
						</div>
						<div class="bask_title_bar">
							<div class="name">${pcomment.pname }</div>
						</div>
						<div class="bask_shows clearfix">
							<div class="products_pic">
								<div class="user">
									<img width="60" height="63"
										src="../static/img/${pcomment.user_pic }" alt="Lu鹿" /> <i></i>
								</div>
								<div class="user_name" id="UserComment-nickname"
									data-value="Lu鹿">${pcomment.nickname }</div>
								<p
									style="font-size:20px;color:#DE94D4;font-weight:blod;font-family:serif;">
									${pcomment.content }</p>





								<div id="pic_panel">
									<div class="pic">
										<img class="midimg" src="../static/img/${pcomment.pic1}" />
									</div>
								</div>


								<div class="show_scroll">
									<div class="list_pic">
										<ul>


											<li id="p1" onmouseover="change1()">
												<div class="pic">
													<img src="../static/img/${pcomment.pic1}" />
												</div>
											</li>


											<li id="p2" onmouseover="change2()">
												<div class="pic">
													<img src="../static/img/${pcomment.pic2}" />
												</div>
											</li>


											<li id="p3" onmouseover="change3()">
												<div class="pic">
													<img src="../static/img/${pcomment.pic3}" />
												</div>
											</li>

											<li id="p4" onmouseover="change4()">
												<div class="pic">
													<img src="../static/img/${pcomment.pic4}" />
												</div>
											</li>
										</ul>
									</div>
									<a href="javascript:;" class="scrollbutton prev_up current"
										title="向上"><span>向上</span></a> <a href="javascript:;"
										class="scrollbutton next_down" title="向下"><span>向下</span></a>
								</div>
							</div>
						</div>
						<div class="bask_reply">
							<div class="pro_consult">
								<div class="comment_panel">
									<div class="title">
										<h3>发表回复</h3>
									</div>
									<!-- 发表框 -->
									<div class="cmt_inpts">
										<form>
											<div class="txt_panel" id="cont">
												<div class="huifutxt">
													<textarea class="CommentContent" id="commenttext"></textarea>
												</div>
											</div>
											<input type="hidden" value="145877" id="productComment-id" />
											<div class="ext_panel">
												<a href="javascript:;" class="btn send" onclick="fabiao()">发表</a>
											</div>
										</form>
									</div>
									<!-- consult main -->
									<div class="consult_main">
										<!--分页-->
										<div id="my_page_reply_page"
											data-bind-first-page-url="/productComment/pageCommentReply?page=1&amp;commentId=145877">
											<ul class="cmt_item">
											</ul>
                                            <div id="tdata">
											<textarea class="CommentContent" >亲，您还没有评论，快来评论吧~~</textarea>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--}右栏结束-->
				</div>
			</div>
		</div>
		<!--用户评论结束-->


		<div id="footinfo">
			<iframe src="../foot.jsp" scrolling="no" frameborder="0"
				marginheight="0px" marginwidth="0px" height="284px" width="100%"></iframe>
		</div>
	</div>
</body>
</html>