<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>个人中心</title>
<link rel="stylesheet" type="text/css" href="../static/css/personal.css" />
<link rel="stylesheet" href="../static/css/style.css" />
<style type="text/css">
.c1 {
	width: 150px;
}

.c2 {
	width: 150px;
}

.c3 {
	width: 150px;
}

.c4 {
	width: 150px;
}

.c5 {
	width: 150px;
}

.button {
	display: inline-block;
	cursor: pointer;
	width: 235px;
	height: 36px;
	line-height: 36px;
	font-size: 20px;
	margin-right: 35px;
	overflow: visible;
	text-align: center;
	padding: 0;
	padding: 0 10px;
	background: #d91864;
	border-radius: 3px;
	color: #fff;
	border: none;
	margin-top: 10px;
	position: relative;
	left: 15px;
	top: 15px;
}
</style>

<!--header样式-->
<link href="../static/css/header.css" rel="stylesheet" style="text/css" />
<script type="text/javascript"
	src="../static/js/jquery-1.7.2.min.js?t=1496299121701"></script>
<script type="text/javascript"
	src="../static/js/jquery.bigautocomplete.js?t=1496299121701"></script>
<script type="text/javascript"
	src="../static/js/commonFooter.js?t=1496299121701"></script>
<!--head-->
<script type="text/javascript" src="../static/js/jquery.min.js"></script>
<script type="text/javascript" src="../static/js/head.js"></script>
<title>我的地址</title>
<script type="text/javascript" charset="gb2312"
	src="../static/js/jquery.js"></script>
<script type="text/javascript"
	src="../static/js/GlobalProvinces_main.js"></script>
<script type="text/javascript"
	src="../static/js/GlobalProvinces_extend.js"></script>
<script type="text/javascript" src="../static/js/initLocation.js"></script>

<script type="text/javascript">
	$(function() {
		initLocation({
			sheng_val : "陕西",
			shi_val : "西安",
			xian_val : "<?php echo $v['country']?>",
			xiang_val : "<?php echo $v['street']?>"
		});
	})
	function tijiao() {
		var sheng = $("#sheng option:selected");
		var shi = $("#shi option:selected")
		var xian = $("#xian option:selected")
		var address = $("#address").val();
		var pinjie = sheng.val() + shi.val() + xian.val() + address;
		$("#addressDetail").val(pinjie);
	}
</script>
</head>
<body>
	<div class="main">
		<jsp:include page="../header.jsp" />

		<!--用户中心首页开始-->
		<div class="wrap">
			<table>
				<tr>
					<td>
						<!--个人中心左栏占位-->
						<div class="com_left">
							<iframe src="../usr/personalleft.jsp" background="black"
								scrolling="no" frameborder="0" marginheight="0px"
								marginwidth="0px" width="200px" height="400px"></iframe>
						</div> <!--个人中心左栏占位结束-->
					</td>
					<td>
						<!--右栏开始-->
						<div class="com_right">
							<div id="allAddress">
								<form action="/address/editAddress.do" method="post">
									<table>
										<input hidden="type" name="id" value="${address.id}" />
										<tr>
											<td>收货人名称</td>
											<td colspan="3"><input type="text" placeholder="请输入收货人"
												width="100px" height="50px" name="receive_name"
												value="${address.receive_name}"></td>
										</tr>
										<tr>
											<td>收货地址</td>
											<td><select id="sheng" name="province"></select> 省</td>
											<td><select id="shi" name="city"></select> 市</td>
											<td><select id="xian" name="country"></select> 县</td>
											<td><input type="text" placeholder="具体街道住址信息"
												width="100px" height="50px" id="address"></td>
											<input type="hidden" id="addressDetail" name="full_address" />
										</tr>
										<tr>
											<td>邮政编码</td>
											<td colspan="3"><input type="text" placeholder="请输入邮政编码"
												width="100px" height="50px" name="postal_code"
												value="${address.postal_code}"></td>
										</tr>
										<tr>
											<td>请输入联系方式</td>
											<td colspan="3"><input type="text" placeholder="请输入联系方式"
												width="100px" height="50px" name="mobile"
												value="${address.mobile}"></td>
										</tr>
										<tr>
											<button type="submit" onclick="tijiao()">提交</button>
										</tr>
									</table>
								</form>
							</div>
						</div> <!--右栏结束-->
					</td>
				</tr>
			</table>
		</div>

		<!--用户中心结束-->
		<!--http://html-color-codes.info/chinese/-->
		<div>
			<!--——————————————————————要添加别的页面——————————————————————-->
			<iframe src="../foot.jsp" scrolling="no" frameborder="0"
				marginheight="0px" marginwidth="0px" height="350px" width="100%"></iframe>
		</div>
	</div>
</body>
</html>