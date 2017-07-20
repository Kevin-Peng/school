<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script src="../static/js/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	function deleteAddress(id, userid) {
		$.ajax({
			url : 'deleteAddress.do?id=' + id,
			error : function(data) {
				alert("删除成功");
				location.reload();
			}

		})
	}
	function addAddress() {
		window.location = "../usr/addAddress.jsp";
	}
	function updateAddress(id) {
		console.log(id);
		window.location = "../address/updateAddressData.do?id=" + id;
	}
	function setAddress(id) {
		$.ajax({
			url : 'setDefaultAddress.do?id=' + id,
			error : function(data) {
				alert("设置成功");
			}

		})
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
								<table>
									<tr>
										<td>收货人名称</td>
										<td>收货地址</td>
										<td>邮政编码</td>
										<td>联系方式</td>
										<td>操作</td>
									</tr>
									<c:forEach items="${addressList}" var="address">
										<tr>
											<td class="c1">${address.receive_name}</td>
											<td class="c2">${address.full_address}</td>
											<td class="c3">${address.postal_code}</td>
											<td class="c4">${address.mobile}</td>
											<td class="c5">
												<button type="submit" onclick="setAddress(${address.id});">设为默认地址</button>
												<button type="submit"
													onclick="updateAddress(${address.id});">编辑地址</button>
												<button type="submit"
													onclick="deleteAddress(${address.id},${address.user_id});">删除地址</button>
											</td>
										</tr>
									</c:forEach>
									<tr colspan="5">
										<button type="submit" onclick="addAddress();">新增收货地址地址</button>
									</tr>
								</table>
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