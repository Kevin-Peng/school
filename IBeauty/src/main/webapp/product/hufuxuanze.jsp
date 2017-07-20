<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<script type="text/javascript"
	src="../static/js/jquery-1.7.2.min.js?t=1496299121701"></script>
<script type="text/javascript"
	src="../static/js/jquery.bigautocomplete.js?t=1496299121701"></script>
<script type="text/javascript"
	src="../static/js/commonFooter.js?t=1496299121701"></script>
<title>护肤</title>
<link rel="stylesheet" href="../static/css/second.css" />
<link rel="stylesheet" href="../static/css/style.css" />
<!--header样式-->
<link href="../static/css/header.css" rel="stylesheet" style="text/css" />
</head>
<body>
	<style>
.noTips {
	position: absolute;
	background: rgba(0, 0, 0, 0.45);
	color: #fff;
	width: 80px;
	height: 80px;
	border-radius: 50px;
	text-align: center;
	line-height: 80px;
	left: 100px;
	top: 80px;
	font-size: 20px;
}
</style>
	<div id="out" align="center">
		<div class="main">
			<div class="header">
				<jsp:include page="../header.jsp" />
				<div align="center" id="mainn">
					<!--第1层框架，整个子页面-->
					<div>
						<!--第2层子框架1-->
						<div align="left" id="box21">
							<p>筛选结果：</p>
						</div>
						<div>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tbody>
									<tr>
										<th class="box22">已选条件</th>
										<td class="box23">
											<div class="box24">
												<ul>
													<% 
														if(!(session.getAttribute("brand")==null))
															{
													 %>
													<li id="box25"><%=(String) session.getAttribute("brand")%></li>													
													<% 
															}
														if(!(session.getAttribute("conditionn")==null))
															{
													 %>
													<li id="box25"><%=(String) session.getAttribute("conditionn")%></li>
													<% } 
													%>
												</ul>
											</div>
										</td>
									</tr>
									<tr>
										<th class="box22">品牌</th>
										<td class="box23">
											<div class="box24">
												<ul>
													<li><a href="">全部</a></li>
													<% 
														if((session.getAttribute("brand")==null))
															{
													 %>
													 	<ul>
													<li><a href="">全部</a></li>
													<c:forEach var="item" items="${BrandList}">												
														<li><a href="../listcal.do?brand=${item.product_brand}&conditionn=${conditionn}">${item.product_brand}
																</a></li>
													</c:forEach>
													</ul>
																									
													<% 
															}
														else{
													%>
															<li><%=(String) session.getAttribute("brand")%></li>
													<%
															}
													 %>
												</ul>
											</div>
										</td>
									</tr>
									<tr>
										<th class="box22">功效</th>
										<td class="box23">
											<div class="box24">
												<ul>
													<li><a href="">全部</a></li>
														<li><a href="../listProduct.do?brand=Etude House/爱丽小屋&flag=2">三效合一</a></li>
														<li><a href="../listProduct.do?brand=Etude House/爱丽小屋&flag=2">不干燥</a></li>
														<li><a href="../listProduct.do?brand=Etude House/爱丽小屋&flag=2">不油腻</a></li>
														<li><a href="../listProduct.do?brand=Etude House/爱丽小屋&flag=2">不黏腻</a></li>
														<li><a href="../listProduct.do?brand=Etude House/爱丽小屋&flag=2">丰盈</a></li>
														<li><a href="../listProduct.do?brand=Etude House/爱丽小屋&flag=2">亮白神采</a></li>
														<li><a href="../listProduct.do?brand=Etude House/爱丽小屋&flag=2">亮泽</a></li>
												</ul>
											</div>
										</td>
									</tr>
									<tr>
										<th class="box22">适合肤质</th>
										<td class="box23">
											<div class="box24">
												<ul>
													<% 
														if(!(session.getAttribute("conditionn")==null))
															{
													 %>
													<li><%=(String) session.getAttribute("conditionn")%></li>
													<% } 
													else{%>
													<ul>
														<li><a href="">全部</a></li>
														<c:forEach var="item" items="${ConditionList}">	
														<li><a href="../listcal.do?brand=${brand}&conditionn=${item.conditionn}">${item.conditionn}</a></li>
														</c:forEach>
													</ul>
													
													<%} %>
												</ul>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div>
						<!--第2层子框架2-->
						<div id="box31">
							<p align="left">&nbsp;&nbsp;找到商品如下：</p>
						</div>
					</div>
					<div>
						<!--第2层子框架3-->
						<div>
							<!--第2层子框架3的第一个部分-->
							<ul>
								<div class="box3" align="left">
									<div align="left" style="width:850px;">
										<li><a href="">默认</a></li>
										<li><a href="../groundtime.do?categoryy=${categoryy}&flag=2" target="_top">销量</a></li>
										<li><a href="../groundtime.do?categoryy=${categoryy}&flag=1" target="_top">评分数</a></li>
										<li><a href="../groundtime.do?categoryy=${categoryy}&flag=2" target="_top">上架时间</a></li>
										<li><a href="../groundtime.do?categoryy=${categoryy}&flag=2" style="width:35px; line-height:18px; height:27px; border-radius:100px; ">▲</a>
										<a href="../groundtime.do?categoryy=${categoryy}&flag=1" style="width:35px; line-height:18px; height:27px; border-radius:100px; ">▼</a></li>
										<li><a href="">价格</a></li>
										<form action="../changeprice.do" method="post">
											<div>
												<input type="text" name="xiaprice" placeholder="￥价格"
													style="width:60px; line-height:18px; height:27px; border:0px;" />&nbsp;-
												<input type="text" name="shangprice" placeholder="￥价格"
													style="width:60px; line-height:18px; height:27px; border:0px" />
												<input type="submit" value="GO"
													style="width:35px; line-height:18px; height:27px; border-radius:100px; background:#FFB6C1; color: #696969;" />
											</div>
										</form>
									</div>

								</div>
							</ul>
						</div>
						<div>
							<!--第2层子框架3的第二个部分,查询出的商品-->
							<div class="tongyong">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tbody>
									<%if((session.getAttribute("prolist")==null))
										{
									%>
										<div>
											并没有任何商品~
										</div>
										
									<%} else{%>
										<div>
											<%
												int i = 0;
											%>
											<!--商品-->
											<c:forEach var="list" items="${prolist}">
												<%
													if (i % 4 == 0) {
												%>
												<ul style="float:left">
													<li style="float:left">
													<div style="width:300px;">
														<div>
															<a href="../toDetail.do?productid=${list.id}" target="_blank" class="shangpin"> <img
																class="tupian" src="../static/${list.src}" alt="无法显示"
																height="220" width="220" />
															</a>
														</div>
														<div class="shangpinjieshao" align="center">
															<a href="./detail1.jsp">${list.product_name}</a>
														</div>

														<div class="jiage" class="tongyong">
															￥ <strong>${list.price}</strong>
														</div>

														<div class="shangpinjieshao" id="duibijia">
															￥ <strong>${list.fixed_price}</strong>
														</div>
													</div>
													</li>
												<%}
													else{
												%>
												
												<li style="float:left">
													<div style="width:300px;">
														<div>
															<a href="" target="_blank" class="shangpin"> <img
																class="tupian" src="../static/${list.src}" alt="无法显示"
																height="220" width="220" />
															</a>
														</div>
														<div class="shangpinjieshao" align="center">
															<a href="./detail1.jsp">${list.product_name}</a>
														</div>

														<div class="jiage" class="tongyong">
															￥ <strong>${list.price}</strong>
														</div>

														<div class="shangpinjieshao" id="duibijia">
															￥ <strong>${list.fixed_price}</strong>
														</div>
													</div>
													</li>
												<%
													}
													if(i % 4 == 3){
												%>
												</ul>
												<%}
												i++; %>
											</c:forEach>
										</div>
										<%} %>
									</tbody>
								</table>
							</div>
						</div>
						<div>
						<div class="box3">
							<ul>	
									<li align="right" style="width:1000px;">
										<%
											int q = 0;
											int pag = 1;
										%>
										<c:forEach items="${prolist}" var="a">
											<%
													q++;
													if (q % 13 == 0) {
														pag++;
														System.out.println("共有这么多页" + pag);
													}
											%>
										</c:forEach>
										<%
											for (int j = 0; j < pag; j++) {
												session.setAttribute("j", j);
										%>
										<a title=pag href="../choosepage.do?pagId=${j+1 }&flag=2" class="fenye" target="_top">${j+1 }</a>
										<%
											}
										%>
										
								</li>
							</ul>
							<div align="right" >
									<form action="../choosepage.do?flag=2" method="post" >
												<input type="text" name="pagId" placeholder="页数"
													style="width:60px; line-height:18px; height:27px; border:0px; background:#ffffff" />
												<input type="submit" value="GO"
													style="width:35px; line-height:18px; height:27px; border-radius:100px; background:#FFB6C1;" />
									</form>
									</div>
						</div>
					</div>
					<div id="">
						<!--第2层子框架4-->
						<div>
							<!--——————————————————————要添加别的页面——————————————————————-->

							<iframe src="../foot.jsp" scrolling="no" frameborder="0"
								marginheight="0px" marginwidth="0px" height="350px" width="100%"></iframe>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>