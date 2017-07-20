<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>${productDetail.product_brand}${productDetail.product_name}</title>

<!--下拉面板样式-->
<link rel="stylesheet" href="../static/css/wangtianhui/style.css" />
<!--header样式-->

<!-- <link href="../static/css/wangtianhui/prodetail.css" rel="stylesheet" />  -->
<link href="../static/css/wangtianhui/wangtianhui.css" rel="stylesheet" /> 
<link href="../static/css/wangtianhui/detail.css" rel="stylesheet" />

<!--
  <script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script> 
  <script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
  <script type="text/javascript" src="js/jquery.min.js"></script> 
  <script type="text/javascript" src="js/productLibrary.js"></script> 
  <script type="text/javascript" src="js/index.js"></script> 
-->
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
		var oto1 = document.getElementById("p1");
		var oto2 = document.getElementById("preview");
		oto2.innerHTML = oto1.innerHTML;
	}
	function change2() {
		document.getElementById("p2").style.borderColor = "#27c8e8";
		document.getElementById("p1").style.borderColor = "#E5E5E5";
		document.getElementById("p3").style.borderColor = "#E5E5E5";
		var oto1 = document.getElementById("p2");
		var oto2 = document.getElementById("preview");
		oto2.innerHTML = oto1.innerHTML;
	}
	function change3() {
		document.getElementById("p3").style.borderColor = "#27c8e8";
		document.getElementById("p2").style.borderColor = "#E5E5E5";
		document.getElementById("p1").style.borderColor = "#E5E5E5";
		var oto1 = document.getElementById("p3");
		var oto2 = document.getElementById("preview");
		oto2.innerHTML = oto1.innerHTML;
	}
</script>

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
			<!-- <iframe src="../header.jsp" scrolling="no" frameborder="0"
				marginheight="0px" marginwidth="0px" height="180px" width="100%"></iframe> -->
			<jsp:include page="../header.jsp" />
			<div class="e_region">
				<div class="e_module">
					<div class="container">
						<div>
							<div id="product_main">
								<div id="product_main_inner clearfix">
									<div class="product_img">
										<div id="preview" class="photo_small">
											<span class="jqzoom"> <img width="350" height="300"
												src="../static/${productDetail.src}" alt="" />
											</span>
										</div>
										<div class="spec-scroll">
											<a class="prev">&lt;</a> <a class="next">&gt;</a>
											<div class="items">
												<ul>
													<li id="p1" onmouseover="change1()"><img width="350"
														height="350" src="../static/${productDetail.src}" alt=""
														onmousemove="preview(this);" /></li>
													<li id="p2" onmouseover="change2()"><img width="350px"
														height="350px" src="../static/${productDetail.src}" alt="" /></li>
													<li id="p3" onmouseover="change3()"><img width="350"
														height="350" src="../static/${productDetail.src}" alt="" /></li>

												</ul>
											</div>
										</div>
										<br /> <br /> <br />
										<div class="shuoming">
											<p class="shuoming1">海外正品&nbsp; | &nbsp; 香港直发&nbsp; |
												&nbsp;无理由退换&nbsp; | &nbsp;购物送积分</p>
										</div>
										<br /> <br /> <br />
										<div class="collect">
											<a href="../collect.do?id=${productDetail.id}" id="uncollect">收藏</a>
										</div>
									</div>
									<div class="product_summary">
										<div class="crumb">
											<ul>
												<li><a href="./index.html">首页</a></li>
												<li class="step_arrow"></li>
												<li><a href="./caizhuangxuanze.html">香水</a></li>
												<li class="step_arrow"></li>
												<li><a href="./caizhuangxuanze.html">女士香水</a></li>
												<li class="step_arrow"></li>
												<li><a href="">淡香水edt</a></li>
											</ul>
										</div>
										<div class="product_detail_title clearfix">
											<h1>${productDetail.product_brand}
												${productDetail.product_name}${productDetail.volum} 清新淡雅 限量版</h1>
										</div>
										
										<div id="productActivities">
											<div class="preferential">
												<span><em class="tag">优惠</em><em class="txt">中国内地实付满299包邮</em></span>
												<span><em class="tag">限时</em><em class="txt">限时特价</em></span>
											</div>
										<div class="brands_logo">
											<div class="pic">
												<img src="../static/img/flag_france.png@60w_90Q_1e_1c.src" alt="法国">
											</div>
											<h2>${productDetail.product_country}</h2>
											<p>正品保证</p>
										</div></div>
										<div class="longname">${productDetail.detail}</div>
										<div class="page_hoice">
											<div class="page_price">
												<p class="clearfix">
													<span class="price curr_price" id="currPrice">￥<em>${productDetail.price}</em></span>
													<span class="del" style="display: none;">（ <del></del>）
													</span> <span class="tab" style="display: none;">包邮</span>
												</p>
											</div>
											<div class="page_attribute">
												<div class="longname1">
													<label>美妆海淘</label>
													<p>
														境外正品采购，香港直邮<span>（运费<span id="shippingFee">10.00</span>元）
														</span>
													</p>
												</div>
												<ul class="summary">
													<li><span class="tit">国际物流：</span>
														<div class="item">全场满299包邮</div></li>
												</ul>
												<div class="choose clearfix">
													<ul class="finished">
														<li class="finished-fl"><span class="tit">商品规格：</span></li>
														<li class="color_choose finished-fr"><a
															href="javascript:;" data-bind-pid="218"
															data-bind-vid="22" data-bind-pic="" data-bind-bigpic=""
															data-bind-alias="50ml" data-bind-color="" class="current">
																<span title="50ml" class="pic">
																	${productDetail.volum} </span><span class="selected"></span>
														</a></li>
													</ul>
												</div>





												<ul class="summary">
													<form action="../buy.do" target="_self">
    													<input type="hidden" id="filename" name="productid" value="${productDetail.id}"/>
														<ul>
															<li><span class="tit">购买数量：</span> <input
																type="text" value="1" name="num" id="shuliang"
																data-now="1" autocomplete="off"
																style="width:50px;height:20px;text-align:left;" /></li>
															<br>
															<li id="li-salesPerMonth" style="">月销售量：<span
																class="salesPerMonth">198</span></li>
															<li class="menu" id="li-commentTotalRow">累计评论：<span
																class="commentTotalRow">0</span></li>

															<li class="btns"><input type="submit" value="立即购买"
																style="width:120px;height:39px;background:#ac7cbc;color:#fff;font-size:14px" target="_top">
																</input> <input type="button" value="加入购物车" id="addShoppingCart"
																style="width:120px;height:39px;background:#ac7cbc;color:#fff;font-size:14px"></input>
															</li>
														</ul>
													</form>
												</ul>
											</div>
										</div>
									</div>
									<div class="product_again"></div>
								</div>
							</div>
							<div class="page-left">
								<div id="mealSet" data-bind-mealset-url="/mealSet/510589"
									data-isinit="false"></div>
								<div class="read_order_wrap">
									<div class="read_order">
										<ul>
											<li><a title="商品描述" href="#page_1"><span>商品描述</span></a></li>
											<li class="menu"><a title="用户评价" href="#page_2"><span>用户评价（<span
														class="commentTotalRow">0</span>）
												</span></a></li>
											<li class="menu"><a title="我要咨询" href="#page_3"><span>我要咨询<span
														id="productConsultationTotal">（0）</span></span></a></li>
											<li class="menu"></li>
										</ul>
									</div>
								</div>
								<div class="pro_box pro_info_box">
									<div id="page_1" class="pro_info">
										<div id="productDetailInfo">
											<div class="pro_box_title">
												<h3>
													<img src="../static/img/information.png" />
												</h3>
											</div>
											<div class="pro_box_main">
												<table border="0" cellpadding="0" cellspacing="0"
													width="860" style="max-width: 100%; margin: auto;">
													<tbody>
														<tr class="firstRow">
															<td colspan="3" valign="top"
																style="font-size:12px;padding-bottom:10px;">${productDetail.detail}
																&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
																&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>
														</tr>
														<tr>
															<td valign="top" width="80" height="30" nowrap=""><span
																style="font-size: 14.0px;font-weight: bold;">商品名称：</span></td>
															<td valign="top"
																style="font-size:12px;padding-bottom:10px;">${productDetail.product_brand}
																${productDetail.product_name}${productDetail.volum} 清新淡雅
																限量版</td>

														</tr>
														<tr>
															<td valign="top" width="80" height="30" nowrap=""><span
																style="font-size: 14.0px;font-weight: bold;">品牌：</span></td>
															<td valign="top"
																style="font-size:12px;padding-bottom:10px;">${productDetail.product_brand}</td>
														</tr>
														<tr>
															<td valign="top" width="80" height="30" nowrap=""><span
																style="font-size: 14.0px;font-weight: bold;">商品价格：</span></td>
															<td valign="top"
																style="font-size:12px;padding-bottom:10px;">
																￥${productDetail.price}</td>
														</tr>
														<tr>
															<td valign="top" width="80" height="30" nowrap=""><span
																style="font-size: 14.0px;font-weight: bold;">商品规格：</span></td>
															<td valign="top"
																style="font-size:12px;padding-bottom:10px;">
																${productDetail.volum}</td>
														</tr>
														<tr>
															<td valign="top" width="80" height="30" nowrap=""><span
																style="font-size: 14.0px;font-weight: bold;">原产国家：</span></td>
															<td valign="top"
																style="font-size:12px;padding-bottom:10px;">
																韩国</td>
														</tr>
														<tr>
															<td valign="top" width="80" height="30" nowrap=""><span
																style="font-size: 14.0px;font-weight: bold;">适合人群：</span></td>
															<td valign="top"
																style="font-size:12px;padding-bottom:10px;">
																所有</td>
														</tr>
														<tr>
															<td valign="top"
																style="font-size:12px;padding-bottom:10px;">全新有盒无塑封</td>
														</tr>
														<tr>
															<td valign="top" width="80" height="30" nowrap=""><span
																style="font-size: 14.0px;font-weight: bold;">使用方法：</span></td>
															<td valign="top"
																style="font-size:12px;padding-bottom:10px;">1.开盖即可用<br />2.使用详情见说明书。<br /></td>
														</tr>
														<tr>
															<td><br /></td>
															<td><br /></td>
														</tr>
													</tbody>
												</table>
												<div class="pro_box_title"
													style="width:860px;max-width:100%;margin:auto;">
													<h3 align="center">
														<img class="lazy" alt="" src="../static/img/details.png"
															style="display:block;margin:auto;" />
													</h3>
												</div>
												<!--下面是商品详情内容-->
												<table width="750" border="0">
													<tbody>
														<tr>
															<td class="laz1"><img class="lazy1" alt=""
																src="../static/${productDetail.src }"
																border="0" text-align="center"/></td>
															
															
														</tr>
														<tr>
														<td class="laz1"><img class="lazy1" alt=""
																src="../static/${productDetail.src }"
																border="0" text-align="center"/></td></tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
								<div class="pro_box comment_wrap">
									<div class="product_comment" id="div_product_comment">
										<div id="page_2" class="pro_box_title">
											<h3>
												<img src="../static/img/comments.png" />
											</h3>
										</div>
                                <c:choose>
                                 <c:when test="${commlist ==null}">
                                   <div class="comerro">
                                   <p>${comerror }</p>
                                   </div>
                                 </c:when>
                                 <c:otherwise>
									<div class="product_comment_list"
										data-bind-first-page-url="../productComment/510589?page=1">


										<table>
											<c:forEach items="${commlist }" var="b">
												<tr class="clearfix">
													<td>
														<div class="left" id="leftimg">
															<img width="60" height="60" src="../static/img/${b.user_pic}" />
														</div>
													</td>


													<td>
														<div class="right">
															<dl class="clearfix">
																<dt>
																	<div class="name">${b.nickname}</div>
																</dt>
															</dl>

															<dl class="clearfix comment_content">
																<p>${b.content}</p>
															</dl>


															<dl class="clearfix comment_content">

																<c:forEach items="${b.pic}" var="pic">
																	<a class="pic" href=""><img width="50" height="50"
																		src="../static/img/${pic}" /></a>
																</c:forEach>
															</dl>

															<ul class="clearfix comment_all">
																<li><a class="reply"
																	href="../productcomment.do?id=${productDetail.id}&user_pic=${b.user_pic }&nickname=${b.nickname}&content=${b.content}&pic=${b.comment_pic}">查看详情</a></li>
															</ul>
														</div>
													</td>
												</tr>

											</c:forEach>
										</table>
										<div class="pager"></div>
									</div>
                                 </c:otherwise>
                               </c:choose>




								</div>
									
									
								</div>
							</div>
							<div id="page-right">
								<div id="new_topRecommend">
									<div class="slider mid_banner">
										<div class="title">
											<h2>同品牌商品推荐</h2>
										</div>
										<ul>

											<li><a href="../toDetail.do?productid=${SameBrandProduct.id}" target="_top"> <img
													width="160" height="160"
													src="../static/${SameBrandProduct.src}" />
													<span>${SameBrandProduct.product_name}</span>
											</a>
												<div class="price">&yen;${SameBrandProduct.price}</div> <del class="price">
													&yen;${SameBrandProduct.fixed_price}</del></li>
										</ul>
									</div>
								</div>
								<div id="new_sameCategory">
									<div class="slider mid_banner">
										<div class="title">
											<h2>同类商品推荐</h2>
										</div>
										<ul>
											<li><a href="../toDetail.do?productid=${SameProduct.id}" target="_blank"> <img width="160"
													height="160"
													src="../static/${SameProduct.src}" />
													<span>${SameProduct.product_name}</span>
											</a>
												<div class="price">&yen;${SameProduct.price}</div> <del class="price">
													&yen;${SameProduct.fixed_price} </del></li>
										</ul>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>


			</div>
			<div id="footinfo">
				<iframe src="../foot.jsp" scrolling="no" frameborder="0"
					marginheight="0px" marginwidth="0px" height="284px" width="100%"></iframe>
			</div>
		</div>
	<script src="../static/js/jquery-1.7.2.min.js" type="text/javascript"></script>
	<script type="text/javascript">
		$("#addShoppingCart").click(function() {
			//productId要在本页面获取
			var productId = "${productDetail.id}";
			//alert(productId);
			$.ajax({
				url : '../addShoppingCart.do?productId=' + productId,
				success : function(data) {
					console.log(data);
					//假如代码里返回的是1
					if (data == '1') {
						alert("加入成功");
						window.location = "detail.jsp";
					} else {
						window.location = "../login.jsp";
					}
				}
			});
		});
	</script>
</body>
</html>