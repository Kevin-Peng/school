<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>个人中心左栏</title>
    <link rel="stylesheet" type="text/css" href="../static/css/personalleft.css"/>

</head>
<body>
	<!--左栏开始-->
                
<div class="com_left">
    <div class="header_slider">
        <div class="header_box">           
            <span>
                 <a href="../personal.do"><img width="80" height="80" alt="" src="../static/img/${usr.user_pic }"></a>
            </span>
        </div>
        <div class="name">
            <form>
                <label for="name"><h3>用户名</h3></label>
            </form>
        </div>        
    </div>
    <div class="slider_hd">   
        <br><a href="../personal.do" target="_top">个人首页</a><br><br>
        <a href="../myorder.do" target="_top">我的订单</a><br><br>
        <a href="../mycollect.do" target="_top">我的收藏</a><br><br>
        <a href="../findComment.do" target="_top">商品评价</a><br><br>
        <a href="../refresh.do" target="_top">购物车</a><br><br>
        <a href="../topayregist.do" target="_top">支付密码注册/修改</a><br><br>
    </div>



</div> <!--左栏结束-->

</body>
</html>