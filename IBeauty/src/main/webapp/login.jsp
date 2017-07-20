<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html;charset=utf-8"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>用户登录 - IBeauty</title>
<link rel="stylesheet" href="./static/css/styl.css" type="text/css" />
<style type="text/css">
#login_part h2 {
	position: relative;
	left: 270px;
	top: 50px;
}

#login_part form {
	position: relative;
	left: 250px;
	top: 50px;
}
</style>
</head>

<%
	String rightcode = (String) session.getAttribute("rCode");
%>
<script language="JavaScript">
function myrefresh()
{
   session.invalidate();
   response.sendRedirect("index.jsp");
}
</script>
<body onload="myrefresh">

	<div class="main">

		<div class="header">
			<div class="page_header">
				<div id="logo">
					<a href=""> <span class="l_name"><img
							src="./static/img/I3.bmp"></span> <span class="l_website"><img
							src="./static/img/BEAUTY5.png"></span> <span class="l_slogan">美从这里开始</span>
					</a>
				</div>
			</div>
		</div>
		<nav class="topNav navDelay">
			<ul>
				<li>
					<div class="L1">
						<a href="tz.jsp">首页</a>
					</div>
				</li>
				<li>
					<div class="L1">
						<a href="" class="gologin liAll">登录</a>
					</div>
				</li>
				<li>
					<div class="L1">
						<a href="regist.jsp">注册</a>
					</div>
				</li>
			</ul>
		</nav>

		<div id="login_part"
			style="background:url(./static/img/back4.jpg)no-repeat; width:100%;">
			<h2 id="">
				欢迎登录&nbsp;<a href="">IBeauty</a>
			</h2>
			<br />
			<form action="login.do" method="post">
				<dl>
					<dd>
						<input name="email" size="30" type="text"
							placeholder="请输入您的Email或者电话" >
						
					</dd>
					<dd>
					<br />
					${emailerror}
					</dd>
					<br />
					<dd>
						<input name="pwd" size="30" type="password" placeholder="请输入您的密码">
					</dd>
					<dd>
					<br />
					${pwderror}
					</dd>
					<br />
					<dd>
						<input name="code" size="15" type="text" placeholder="请输入验证码">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img id="pic" 
							src="number.jsp"> 
					</dd>
					<dd>
					<br />
					${imgerror}
					</dd>
					<br />
					<dd>
						<input type="submit" class="login_btn" value="登录">
						<div class="options">
							<span> <input type="checkbox" class="remember" checked
								name="rememberMe"> <label for="remember">记住用户名</label>
							</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<span><a href="">忘记密码？</a></label></span>
						</div>
					</dd>
					<br />
					<dd id="others">
						<a target="_blank" title="使用QQ登录" class="qq" href="#"><img
							src="./static/img/qq.ico"></a>&nbsp;&nbsp;&nbsp; <a
							target="_blank" title="使用新浪微博登录" class="sina" href="#"><img
							src="./static/img/weibo.ico"></a>&nbsp;&nbsp;&nbsp; <a
							target="_blank" title="使用支付宝登录" class="alipay" href="#"><img
							src="./static/img/alipay.ico"></a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
							href="regist.html" id="re">免费注册</a>
					</dd>
				</dl>
			</form>
		</div>
		<div id="footinfo">
			<ul>
				<li><img src="./static/img/FAQ.png"><a href="help.html">&nbsp;帮助/FAQ</a></li>
				<li><img src="./static/img/send.png"><a href="help.html">&nbsp;配送服务</a></li>
				<li><img src="./static/img/about.png"><a href="help.html">&nbsp;关于我们</a></li>
				<li><img src="./static/img/connect.png"><a
					href="help.html">&nbsp;联系我们</a></li>
			</ul>
		</div>
		<div id="footer">
			<p>
				<a href="help.html" target="_blank" title="关于我们">关于我们</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="help.html" target="_blank" title="友情链接">友情链接</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="help.html" target="_blank" title="加入我们">加入我们</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="help.html" target="_blank" title="商务合作">商务合作</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="help.html" target="_blank" title="使用条款">使用条款</a>
			</p>
			<p>
				Copyright &copy; 2017 <a href="">IBeauty项目小组 </a>
			</p>
			<p>
				<img src="./static/img/paypal.png" />
			</p>
		</div>

	</div>
</body>
</html>
