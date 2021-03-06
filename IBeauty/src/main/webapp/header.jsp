<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<base target="_parsent">
<!--下拉面板样式-->
<link rel="stylesheet" href="../static/css/style.css" />
<!--header样式-->
<link href="../static/css/index.css" rel="stylesheet" style="text/css" />
<!--下拉面板-->
<script type="text/javascript" src="../static/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript"
	src="../static/js/jquery.bigautocomplete.js"></script>
	
</head>
<body>
	<div class="header">
		<div class="topbar_wrap">
			<div class="wrap clearfix">
				<div class="topbar_left">
					<ul>
						<li class="login_warp">
							<ul>
								<li>欢迎来到iBeauty！</li>
								<%
									if (session.getAttribute("user") != null) {
								%>
								<li class="pli">
								<a href="../personal.do" title="" id="login_href" target="_top">${user}</a>
								
								  <div class="xianshii" >
								  <table>
								    <tr>
								    <td class="wdd1"><img src="../static/img/${userpicc}" /></td>
								    <td class="wdd2">
								       <div class="wth1"><a href="../personal.do" target="_top">个人首页</a></div>
								       <div class="wth1"><a href="../myorder.do" target="_top">我的订单</a></div>
								       <div class="wth1"><a href="../mycollect.do" target="_top">我的收藏</a></div>
								       <div class="wth1"><a href="../findComment.do" target="_top">我的评价</a></div>
								    </td>
								    </tr>
								  </table>
								   
								  </div>
								
								</li>
								<li class="line"><span>|</span></li>
								<li><a href="../invalidate.jsp" id="register_href" title="">注销</a></li>
								<%
									} else {
								%>
								<li><a href="../login.jsp" title="立即登录" id="login_href" target="_top">马上登录</a></li>
								<li class="line"><span>|</span></li>
								<li><a href="../regist.jsp" id="register_href" title="马上注册" target="_top">立即注册</a></li>
								<%
									}
								%>
							</ul>
						</li>
					</ul>
				</div>
				<ul class="topbar_right">
					<li><a href="../help.jsp" title="帮助中心" target="_top">帮助中心</a></li>
				</ul>
			</div>
		</div>
		<div id="header_bottom">
			<div id="header_bottom_mid">
				<div id="logo">
					<a href=""> <span class="l_name"><img
							src="../static/img/I3.bmp" /></span> <span class="l_website"><img
							src="../static/img/BEAUTY5.png" /></span> <span class="l_slogan">美从这里开始</span>
					</a>
				</div>
				<div class="search">
					<form autocomplete="off" action="../search.do" method="get">
						<span class="txt" style="position: relative;"> <input
							type="text" data-default="香水" name="keyword" 
							style="width:300px;height:30px" />
						</span> <span class="searchBtn"><input type="submit" value="搜索"
							style="width:70px;height:30px;background:transparent;border:1px solid #AEA5AB;"
							size="30px"
							onmouseover="this.style.borderColor='black';this.style.backgroundColor='plum';"
							onmouseout="this.style.borderColor='black';this.style.backgroundColor='#ffffff';" /></span>
					</form>
					<div class="top_search">
						<a title="" href="search.do?keyword=保湿">保湿</a> <a title=""
							href="search.do?keyword=兰蔻">兰蔻</a> <a title=""
							href="search.do?keyword=雅诗兰黛">雅诗兰黛</a> <a title=""
							href="search.do?keyword=控油">控油</a> <a title=""
							href="search.do?keyword=去角质">去角质</a> <a title=""
							href="search.do?keyword=防晒">防晒</a> <a title=""
							href="search.do?keyword=减肥">减肥</a> <a title=""
							href="search.do?keyword=脱毛">脱毛</a>
					</div>
					<div id="bigAutocompleteContent" class="searchBox"></div>
				</div>
				<div class="header_bottom_right">
					<div class="cart">
						<ul>
							<li class="bag-li"><a href="../refresh.do" class="shopbag" target="_top">
									<span><img src="../static/img/gwc.png" /></span> <span
									class="cart_hover">购物袋 <%
 	if (session.getAttribute("user") == null
 			|| session.getAttribute("list1") == null) {
 %> (<em>0</em>)
								</span> <span>：</span> <span class="bag_precie">￥0.00</span> <%
 	} else {
 %> (<em>${cartcount.num}</em>) </span> <span>：</span> <span class="bag_precie">￥${cartcount.price}</span>
									<%
										}
									%> <span class="bag_tips"></span>
							</a>
								<div class="gwc-cont">
									<div class="mycart_popup">
										<%
											if (session.getAttribute("user") != null
													&& session.getAttribute("list1") != null) {
										%>
										<div class="mycart_box">
											<div class="relt clearfix">
												<p>
													数量共计：<i>${cartcount.num}</i>件
												</p>
												<p>
													金额共計：<strong class="price money">￥${cartcount.price}</strong>
												</p>
												<a class="abs btn" title="去结算" href="../refresh.do">去结算</a>
											</div>
											<ul class="list">
												<c:forEach var="cart" items="${list1}">
													<li><div class="pic fl">
															<a target="_blank" href="../toDetail.do?productid=${cart.productId}"><img
																src="../static/${cart.productImg}"></a>
														</div>
														<div class="title fr">
															<p>
																<a class="a-black" href="/product/506019"
																	title="${cart.productName}">${cart.productName}</a>
															</p>
															<p>
																<a style="" href="/product/506019">规格 : 黑色套装 </a>
															</p>
															<p class="other">
																<span class="money" >￥${cart.productPrice}元</span>&nbsp;<i id="####${cart.id}">×&nbsp;${cart.productNum}</i><a
																	class="bluetit delCartItem" href="../delete.do?productId=${cart.productId}&userId=${cart.userId}">[刪除]</a>
															</p>
														</div>
														<div class="clear"></div></li>
												</c:forEach>
											</ul>
										</div>
										<%
										   } else { 
										%>
										<div class="tip">
											购物车暂无商品 <br />快去挑选自己钟爱的商品吧~~
										</div>
										<%
											}
										%>
									</div>
							</div></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<nav class="topNav navDelay">
			<ul>
				<li class="liHome">
					<div class="L1">
						<a href="../index.jsp">首页</a>
					</div>
				</li>
				<li class="liSkin">
					<div class="L1">
						<a href="../toSecondPage.do?id=101">护肤</a>
					</div>
					<div class="L2">
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=201">卸妆</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=卸妆油">卸妆油</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=卸妆乳">卸妆乳</a>
							</p>
							<h4 class="part">
								<a href="../toSecondPage.do?id=202">洁面</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=洁面乳">洁面乳</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=洁面皂">洁面皂</a>
							</p>
							<h4 class="part">
								<a href="../toSecondPage.do?id=203">爽肤水</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=爽肤水">爽肤水</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=柔肤水">柔肤水</a>
							</p>
						</div>
						<div class="sort">
							<h4 class="part">
								<a href="../toSecondPage.do?id=204">眼部护理</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=眼霜">眼霜</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=眼胶">眼胶</a>
							</p>
							<h4 class="part">
								<a href="../toSecondPage.do?id=205">乳液/面霜</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=面霜">面霜</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=日霜">日霜</a>
							</p>
							<h4 class="part">
								<a href="../toSecondPage.do?id=206">面部磨砂</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=磨砂膏">磨砂膏</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=磨砂啫喱">磨砂啫喱</a>
							</p>
						</div>
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=207">面膜</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=面膜帖">面膜帖</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=水洗式面膜">水洗式面膜</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=睡眠面膜">睡眠面膜</a>
							</p>
							<h4 class="part">
								<a href="../toSecondPage.do?id=208">精华</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=精华乳/液">精华乳/液</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=精华素/露">精华素/露</a>
							</p>
						</div>
						<div class="sort">
							<h4 class="part">
								<a href="../toSecondPage.do?id=209">唇部护理</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=唇膜">唇膜</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=唇部磨砂">唇部磨砂</a>
							</p>
							<h4 class="part">
								<a href="../toSecondPage.do?id=210">T区/暗疮护理</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=去黑头膏">去黑头膏</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=水洗式鼻帖/鼻膜">水洗式鼻帖/鼻膜</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=撕拉式鼻帖/鼻膜">撕拉式鼻帖/鼻膜</a>
							</p>
						</div>
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=211">颈部护理</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=颈霜">颈霜</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=颈膜">颈膜</a>
							</p>
							<h4 class="part">
								<a href="../toSecondPage.do?id=212">防晒护理</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=防晒乳/霜">防晒乳/霜</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=晒黑用品">晒黑用品</a>
							</p>
						</div>
						<div class="sortLast">
							<div class="hotimg">
								<a href="../toDetail.do?productid=1000010"><img
									src="../static/img/skin-one.jpg"
									alt="Estee Lauder/雅诗兰黛 ANR即时特润修护眼部精华霜DNA眼霜15ml 小棕瓶 去细纹眼袋" /></a>
							</div>
							<div class="hotimg">
								<a href="../toDetail.do?productid=1000011"><img
									src="../static/img/skin-two.jpg"
									alt="Lancome/兰蔻 小黑瓶新精华肌底液30ml/50ml/75ml肌因赋活露 嫩肌活肤液" /></a>
							</div>
						</div>
					</div>
				</li>
				<li class="liMakeup">
					<div class="L1">
						<a href="../toSecondPage.do?id=102">彩妆</a>
					</div>
					<div class="L2">
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=213">粉底</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=粉底液">粉底液</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=粉底霜/膏">粉底霜/膏</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=粉饼">粉饼</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=修容/阴影">修容/阴影</a>
							</p>
							<h4 class="part">
								<a href="../toSecondPage.do?id=214">腮红</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=胭脂膏">胭脂膏</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=胭脂水">胭脂水</a>
							</p>
						</div>
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=215">妆前/隔离</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=妆前乳">妆前乳</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=隔离乳">隔离乳</a>
							</p>
							<h4 class="part">
								<a href="../toSecondPage.do?id=216">BB霜</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=BB霜">BB霜</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=CC霜">CC霜</a>
							</p>
						</div>
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=217">睫毛膏</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=单头睫毛膏">单头睫毛膏</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=睫毛底膏">睫毛底膏</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=睫毛增长液">睫毛增长液</a>
							</p>
							<h4 class="part">
								<a href="../toSecondPage.do?id=218">眼线</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=眼线笔">眼线笔</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=眼线液">眼线液</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=眼线粉">眼线粉</a>
							</p>
						</div>
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=219">眼影</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=单色眼影">单色眼影</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=双色眼影">双色眼影</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=三色眼影">三色眼影</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=四色眼影">四色眼影</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=五色及以上">五色及以上</a>
							</p>
						</div>
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=220">美甲</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=彩色指甲油">彩色指甲油</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=护理指甲油">护理指甲油</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=指甲修护霜">指甲修护霜</a>
							</p>
							<h4 class="part">
								<a href="../toSecondPage.do?id=221">美唇</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=唇膏/口红">唇膏/口红</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=唇彩/蜜">唇彩/蜜</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=唇釉">唇釉</a>
							</p>
							<h4 class="part">
								<a href="../toSecondPage.do?id=222">中小样</a>
							</h4>
						</div>
						<div class="sortLast">
							<div class="hotimg">
								<a href="../toDetail.do?productid=1000012"><img
									src="../static/img/makeup-one.jpg"
									alt="Chanel/香奈儿 水亮系列口红可可小姐唇膏3g coco shine 轻盈滋润" /></a>
							</div>
							<div class="hotimg">
								<a href="../toDetail.do?productid=1000013"><img
									src="../static/img/makeup-two.jpg"
									alt="Dior/迪奥 活肤驻颜梦幻美肌修颜乳30/50ml 美肌臻品 淡斑遮瑕 杨幂推荐" /></a>
							</div>
						</div>
					</div>
				</li>
				<li class="liPerfume">
					<div class="L1">
						<a href="../toSecondPage.do?id=103">香水</a>
					</div>
					<div class="L2">
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=223">男士香水</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=古龙水EDC">古龙水EDC</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=香体乳">香体乳</a>
							</p>
						</div>
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=224">女士香水</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=香水EDP">香水EDP</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=淡香水EDT">淡香水EDT</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=香体乳">香体乳</a>
							</p>
						</div>
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=225">中性香水</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=香水EDP">香水EDP</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=淡香水EDT">淡香水EDT</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=香体乳">香体乳</a>
							</p>
						</div>
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=226">香水套装</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=香膏套装">香膏套装</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=香体乳套装">香体乳套装</a>
							</p>
						</div>
						<div class="sortLast">
							<div class="hotimg">
								<a href="../toDetail.do?productid=1000014"><img
									src="../static/img/perfume-one.jpg"
									alt="Burberry/巴宝莉 英伦迷情风格女士淡香水/女香30/50/100ml EDT" /></a>
							</div>
						</div>
						<div class="sortLast">
							<div class="hotimg">
								<a href="../toDetail.do?productid=1000015"><img
									src="../static/img/perfume-two.jpg"
									alt="Chanel/香奈儿 Chance邂逅清新淡香水50ml/100ml 绿邂逅 喷式香氛EDT" /></a>
							</div>
						</div>
					</div>
				</li>
				<li class="liBody">
					<div class="L1">
						<a href="../toSecondPage.do?id=104">身体护理</a>
					</div>
					<div class="L2">
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=227">沐浴用品</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=沐浴乳">沐浴乳</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=沐浴露">沐浴露</a>
							</p>
							<h4 class="part">
								<a href="../toSecondPage.do?id=228">女性卫生用品</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=卫生巾">卫生巾</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=卫生洁肤液">卫生洁肤液</a>
							</p>
							<h4 class="part">
								<a href="../toSecondPage.do?id=229">脱毛用品</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=脱毛膏">脱毛膏</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=脱毛蜡纸">脱毛蜡纸</a>
							</p>
						</div>
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=230">身体护理</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=润肤乳/霜">润肤油</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=身体磨砂">身体磨砂</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=身体喷雾">身体喷雾</a>
							</p>
							<h4 class="part">
								<a href="../toSecondPage.do?id=231">止汗香体用品</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=止汗喷雾">止汗喷雾</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=止汗贴">止汗贴</a>
							</p>
						</div>
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=232">纤体护理</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=纤体乳/霜">纤体乳/霜</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=纤体啫喱">纤体啫喱</a>
							</p>
							<h4 class="part">
								<a href="../toSecondPage.do?id=233">胸部护理</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=丰胸乳/霜">丰胸乳/霜</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=丰胸贴">丰胸贴</a>
							</p>
						</div>
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=234">手足部/指甲护理</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=护手霜">护手霜</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=手膜">手膜</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=足部磨砂">足部磨砂</a>
							</p>
							<h4 class="part">
								<a href="../toSecondPage.do?id=235">牙齿用品</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=牙膏">牙膏</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=漱口水">漱口水</a>
							</p>
						</div>
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=236">宝宝用品</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=沐浴露">沐浴露</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=洗发露">洗发露</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=尿疹膏">尿疹膏</a>
							</p>
						</div>
						<div class="sortLast">
							<div class="hotimg">
								<a href="../toDetail.do?productid=1000016"><img
									src="../static/img/soma-one.jpg"
									alt="Clarins/娇韵诗 调和身体护理油100ml 紧实肌肤消除细纹" /></a>
							</div>
							<div class="hotimg">
								<a href="../toDetail.do?productid=1000017"><img
									src="../static/img/soma-two.jpg"
									alt="L'occitane/欧舒丹 花香润手霜三件套装30ml*3 柔润双手护手霜" /></a>
							</div>
						</div>
					</div>
				</li>
				<li class="liHair">
					<div class="L1">
						<a href="../toSecondPage.do?id=105">洗发护发</a>
					</div>
					<div class="L2">
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=237">洗发</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=洗发露">洗发露</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=洗发皂">洗发皂</a>
							</p>
						</div>
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=238">护发</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=护发素">护发素</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=护发油">护发油</a>
							</p>
						</div>
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=239">头发造型用品</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=定型慕丝">定型慕丝</a>
							</p>
						</div>
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=240">美发工具</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=梳子">梳子</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=镜子">镜子</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=其他">其他</a>
							</p>
						</div>
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=241">染发烫发</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=染发膏">染发膏</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=染发水">染发水</a>
							</p>
						</div>
						<div class="sortLast">
							<div class="hotimg">
								<a href="../toDetail.do?productid=1000018"><img
									src="../static/img/hair-one.jpg"
									alt="Phyto/发朵 活力无硅抗老增浓密洗发水/露 200ml 抗衰老 延缓白发 改善枯黄" /></a>
							</div>
						</div>
					</div>
				</li>
				<li class="liTool">
					<div class="L1">
						<a href="../toSecondPage.do?id=106">工具</a>
					</div>
					<div class="L2">
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=242">美容工具</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=化妆棉">化妆棉</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=洁面扑">洁面扑</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=面油纸">面油纸</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=全身剃刀">全身剃刀</a>
							</p>
						</div>
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=243">化妆工具</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=">睫毛夹</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=">双眼皮贴</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=">眉刷</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=">眼影刷</a>
							</p>
						</div>
						<div class="sort">
							<h4 class="part">
								<a href="../toSecondPage.do?id=244">纤体工具</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=纤体绷带">纤体绷带</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=纤体器具">纤体器具</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=纤体袜">纤体袜</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=按摩刷">按摩刷</a>
							</p>
						</div>
						<div class="sort tool-special">
							<h4>
								<a href="../toSecondPage.do?id=245">美甲工具</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=去死皮锉">去死皮锉</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=甲面打磨工具">甲面打磨工具</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=去光水">去光水</a>
							</p>
							<h4 class="part">
								<a href="../toSecondPage.do?id=246">香水工具</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=香水瓶">香水瓶</a>
							</p>
							<h4 class="part">
								<a href="../toSecondPage.do?id=247">美容仪器</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=美容仪器">美容仪器</a>
							</p>
						</div>
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=248">沐浴工具</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=沐浴手套">沐浴手套</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=沐浴刷">沐浴刷</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=沐浴球">沐浴球</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=浴帽">浴帽</a>
							</p>
							<h4 class="part">
								<a href="../toSecondPage.do?id=249">其他工具</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=棉花棒">棉花棒</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=棉花湿纸巾">棉花湿纸巾</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=保温杯">保温杯</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=柠檬杯">柠檬杯</a>
							</p>
						</div>
						<div class="sortLast">
							<div class="hotimg">
								<a href="../toDetail.do?productid=1000019"><img
									src="../static/img/tool-one.jpg" alt="MAC/魅可 #239 眼影刷/眼部阴影刷" /></a>
							</div>
							<div class="hotimg">
								<a href="../toDetail.do?productid=1000020"><img
									src="../static/img/tool-two.jpg"
									alt="Shu-uemura/植村秀 专业睫毛夹 卷翘不伤睫毛 思芙美CEO推荐" /></a>
							</div>
						</div>
					</div>
				</li>
				<li class="liMan">
					<div class="L1">
						<a href="../toSecondPage.do?id=107">男士</a>
					</div>
					<div class="L2">
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=250">男士洁面</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=洁面乳">洁面乳</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=洁面皂">洁面皂</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=去角质啫喱">去角质啫喱</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=去黑头膏">去黑头膏</a>
							</p>
						</div>
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=251">男士护肤</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=爽肤水">爽肤水</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=柔肤水">柔肤水</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=BB霜">BB霜</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=眼部护理">眼部护理</a>
							</p>
						</div>
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=252">剃须护理</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=须后水">须后水</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=剃须膏">剃须膏</a>
							</p>
							<h4 class="part">
								<a href="../toSecondPage.do?id=253">男士套装</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=护肤套装">护肤套装</a>
							</p>
						</div>
						<div class="sort">
							<h4>
								<a href="../toSecondPage.do?id=254">男士头部护理</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=洗发露">洗发露</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=护发素">护发素</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=发蜡">发蜡</a>
							</p>
							<h4 class="part">
								<a href="../toSecondPage.do?id=255">男士其他护理</a>
							</h4>
							<p>
								<a href="../toSecondPageBytexture.do?texture=男士唇部护理">男士唇部护理</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=身体护理">身体护理</a>
							</p>
							<p>
								<a href="../toSecondPageBytexture.do?texture=防晒护理">防晒护理</a>
							</p>
						</div>
						<div class="sort sort-man">
							<div class="hotimg">
								<a href="../toDetail.do?productid=1000021"><img
									src="../static/img/man-one.jpg"
									alt="Kiehl's/科颜氏 契尔氏男士洁面啫喱250ml 全效活力洗面奶 唤醒肌肤 深层清洁" /></a>
							</div>
						</div>
						<div class="sortLast">
							<div class="hotimg">
								<a href=""><img src="../static/img/man-two.jpg"
									alt="wqq下架Lab Series/朗仕 活力焕颜凝乳50ml抚平油光减少毛孔" /></a>
							</div>
							<div class="hotimg">
								<a href=""><img src="../static/img/man-three.jpg"
									alt="Biotherm/碧欧泉 男仕炽能醒肤活力面霜50ml 持久保湿" /></a>
							</div>
						</div>
					</div>
				</li>
			</ul>
		</nav>
	</div>
	<script type="text/javascript">
		$(function() {
			$(".bag-li").hover(function() {
				$(this).addClass('hover_on');
			}, function() {
				$(this).removeClass('hover_on');
			});
		});
	</script>
	
	<script type="text/javascript">
		$(function() {
			$(".pli").hover(function() {
				$(this).addClass('hoverp');
			}, function() {
				$(this).removeClass('hoverp');
			});
		});
	</script>
</body>
</html>