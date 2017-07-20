<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>更改支付密码</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"> 
    
    <link rel="stylesheet" href="../static/css/style.css" /> 
    <link rel="stylesheet" type="text/css" href="../static/css/collect.css"/>
    <link rel="stylesheet" type="text/css" href="../static/css/payregist.css"/>
   <!--下拉面板-->
  <script type="text/javascript" src="../static/js/jquery-1.7.2.min.js?t=1496299121701"></script> 
  <script type="text/javascript" src="../static/js/jquery.bigautocomplete.js?t=1496299121701"></script> 
  <script type="text/javascript" src="../static/js/commonFooter.js?t=1496299121701"></script> 
  <!--head-->
  <script type="text/javascript" src="../static/js/head.js"></script> 

  </head>
  
  <script type="text/javascript">
  	function ispaypwd(){
  		var message='<%=session.getAttribute("paypwdstatus")%>';
  		if(message!="null"){
			document.getElementById("oldpassword").style.display="block";
			document.getElementById("nopwd").style.display="none";
		}else{
			document.getElementById("oldpassword").style.display="none";
			document.getElementById("nopwd").style.display="block";
		}
  	}
  </script>
  
  <body onload="ispaypwd()">
    <div class="main"> <!--——————————————————————要添加别的页面——————————————————————-->
       <jsp:include page="../header.jsp" />

	<!--用户中心首页开始-->
    
            <div class="wrap">
                <table>
                <tr>
                <td>
                <!--个人中心左栏占位-->
                <div class="com_left">
                	<iframe src="./personalleft.jsp" background="black" scrolling="no" frameborder="0" marginheight="0px" marginwidth="0px" width="200px" height="400px"></iframe> 
                </div>
                <!--个人中心左栏占位结束-->
				</td>
				<td>
			
			<script type="text/javascript">
				function checkspace(){
					var oldpwd=document.getElementById("oldpwd");
					if(oldpwd.style.display=="block"&&oldpwd.value==""){
						alert("原密码不能为空");
						return false;
					}
					var newpwd=document.getElementById("newpwd");
					if(newpwd.value==""){
						alert("新密码不能为空");
						return false;
					}
					var repwd=document.getElementById("repwd");
					if(repwd.value==""){
						alert("重复密码不能为空");
						return false;
					}
				}
			</script>
        
                <!--右栏开始-->
                <div class="com_right">  
                <form action="../payregist.do" method="post"  onsubmit="return checkspace()" target="_self">
                	<div class="pwd">
                	<p id="nopwd" style="font-size:20px;color:red;">您还未设置支付密码，请尽快设置</p>
                   <div class="old-password" id="oldpassword">
                   <br><br>
                   <label>原密码：</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   		<input name="oldpwd" id="oldpwd" size="30" type="password"
							placeholder="请输入原来的支付密码">
					<br><br><p style="font-size:14px;color:red;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					${oldpwderror}</p>
                   </div>
                   <br><br><br>
                   <div class="new-password">
                   <label>新密码：</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   		<input name="newpwd" id="newpwd" size="30" type="password" placeholder="请输入支付密码">
                   	<br><br>
                   	<label>重复密码：</label>&nbsp;&nbsp;
                   		<input name="repwd" id="repwd" size="30" type="password" placeholder="重复密码">
                   		<br><br><p style="font-size:14px;color:red;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					${repwderror}</p>
                   </div>
                   <br><br>
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   <input class="submit-btn" type="submit" value="提交"/>
                   </div>
                   </form>
                </div>

         
                <!--}右栏结束-->
                </td>
                </tr>
                </table>
            </div>
      
    <!--}用户中心结束-->

	
  <script type="text/javascript" src="https://assets.sephome.com/libs/jquery-plugin/jquery.url/1.0/url.min.js?t=1496374617499"></script>
<script type="text/javascript" src="https://assets.sephome.com/libs/jquery-plugin/jquery.superslide/2.1.1/jquery.superslide.min.js?t=1496374617499">
</script>
<script type="text/javascript" src="https://assets.sephome.com/system/b2c/templates/default/js/common.js?t=1496374617499">
</script>
<!-- <script type="text/javascript" src="https://assets.sephome.com/libs/sfm/0.1/util.js?t=1496374617499">
</script> -->
<script type="text/javascript" src="https://assets.sephome.com/libs/jquery-plugin/jquery.xdomainrequest/jquery.xdomainrequest.min.js"> </script>
<script type="text/javascript" src="https://assets.sephome.com/libs/sfm/0.1/stats.js?t=1496374617499"> </script>
<script type="text/javascript" src="https://assets.sephome.com/libs/jquery-plugin/jquery.cookie/1.4.1/jquery.cookie.min.js"> </script>
<script type="text/javascript" src="https://assets.sephome.com/system/b2c/js/common/commonFooter.js?t=1496374617499"> </script>




	<div><!--——————————————————————要添加别的页面——————————————————————--> 
   <iframe src="../foot.jsp" scrolling="no" frameborder="0" marginheight="0px" marginwidth="0px" height="284px" width="100%"></iframe>   
  </div>
  </div>

<script type="text/javascript" src="https://assets.sephome.com/system/b2c/js/app/my_sidebar.js?t=1496374685051"> </script>
<script type="text/javascript" src="https://assets.sephome.com/system/b2c/js/common/page.js?t=1496374685051"> </script>
<script type="text/javascript">
    $(document).ready(function () {
        SFM.Page($("#my_order_page"), $("#my_order_page").attr("data-bind-first-page-url"));
        ///评论页加载
        $(".uc_order .tabs li").click(function () {
            $(".uc_order .tabs li").removeClass("current");
            $(this).addClass("current");

            var firstPageUrl = $(this).find("a").attr("data-bind-first-page-url");
            var targetObj = $("#my_order_page");
            SFM.Page(targetObj, firstPageUrl);
        });
    });
</script>

<script>
    (function(){
        var bp = document.createElement('script');
        var curProtocol = window.location.protocol.split(':')[0];
        if (curProtocol === 'https') {
            bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';
        }
        else {
            bp.src = 'http://push.zhanzhang.baidu.com/push.js';
        }
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(bp, s);
    })();
</script>


  </body>
</html>
