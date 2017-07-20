<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>个人中心</title>
  <link rel="stylesheet" type="text/css" href="../static/css/personal.css"/>
  <link rel="stylesheet" href="../static/css/style.css" /> 


  <!-- <link rel="stylesheet" href="https://assets.sephome.com/system/b2c/templates/default/css/common.css?t=a1496374685051"/>
    <link rel="stylesheet" href="https://assets.sephome.com/system/b2c/templates/default/css/modules.css?t=a1496374685051"/> -->
    
  <!--header样式-->
  <script type="text/javascript" src="../static/js/jquery-1.7.2.min.js?t=1496299121701"></script> 
  <script type="text/javascript" src="../static/js/jquery.bigautocomplete.js?t=1496299121701"></script> 
  <script type="text/javascript" src="../static/js/commonFooter.js?t=1496299121701"></script> 
  <!--head-->
  <script type="text/javascript" src="../static/js/jquery.min.js"></script>
  <script type="text/javascript" src="../static/js/head.js"></script>
  <style type="text/css">
	body{
		background-color:white;
	}
	</style>
</head>
<body>
<!--————————————————————要添加别的页面————————————————————-->
   <div class="main">
    <jsp:include page="../header.jsp"/> 
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
        
           <!--右栏开始-->
        <div class="com_right">
        <table class="right">
       
        <tr class="tr1">
         <td width="220px" height="200px" align="left" valign="top" class="tdd">
            &nbsp;&nbsp;
            <a href="" onclick="shangchuan()">点击上传</a>
            <br/><br/>
            <input type=file name="doc" id="doc" onchange="javascript:setImagePreview();"> 
          </td>
          </tr>
          <tr class="tr2">
        <td width="1000px" align="left" height="200px">
        <div class="account-content">
          <div class="account_cover clearfix">
            <div class="basic">
                <div class="username">
                    <br>亲爱的<strong>
                        <label for="name">${user}</label>
                    </strong>，欢迎您！<br><br>
                </div>
                <div class="info clearfix">
              <div class="fl_l">
                <a href="/my/accountInfo">完善个人资料</a> &nbsp;&nbsp;
                <a href="../address/queryAllAddress.do?id=${userid}">收货地址管理</a> &nbsp;&nbsp;
              </div>
            </div>
            </div>
          </div>
        </div>
        </td>
        </tr>
        <tr class="tr3">
          <td width="1000px"  align="left" valign="top" height="200px">
            <div class="info clearfix">
              <div class="fl_l">
                <h4>相关进度</h4>
                <a href="../unpay.do">待付款</a> &nbsp;&nbsp;
                <a href="../unreceive.do">待收货</a> &nbsp;&nbsp;
                <a href="../unping.do">待评价</a> &nbsp;&nbsp;
              </div>
            </div>
          </td>
        </tr>
        </table>
      </div>
        <!--右栏结束-->
        </td>
      </tr>
    </table>
  </div>
  <iframe src="../foot.jsp" scrolling="no" frameborder="0" marginheight="0px" marginwidth="0px" height="350px" width="100%"></iframe>
  </div>
 
	<!--用户中心首页开始-->     
    <!--用户中心结束-->
<!--http://html-color-codes.info/chinese/-->
</body>
<script> 
var filename;
function setImagePreview() { 
var docObj=document.getElementById("doc"); 
//var imgObjPreview=document.getElementById("preview"); 
if(docObj.files && docObj.files[0]){ 
//火狐下，直接设img属性 
//imgObjPreview.style.display = "block"; 
//imgObjPreview.style.width = "100px"; 
//imgObjPreview.style.height = "100px"; 
//imgObjPreview.src = docObj.files[0].getAsDataURL(); 
//火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式 

//imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]); 
filename=docObj.files[0].name;
}else{ 
//IE下，使用滤镜 
docObj.select(); 
var imgSrc = document.selection.createRange().text; 
var localImagId = document.getElementById("localImag"); 
//必须设置初始大小 
localImagId.style.width = "100px"; 
localImagId.style.height = "100px"; 
//图片异常的捕捉，防止用户修改后缀来伪造图片 
try{ 
localImagId.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)"; 
localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc; 
}catch(e){ 
alert("您上传的图片格式不正确，请重新选择!"); 
return false; 
} 
imgObjPreview.style.display = 'none'; 
document.selection.empty(); 
} 

return true; 
} 

</script> 
<script>
function shangchuan(){
   
 $.ajax({   
		    url:'../shangchuan.do?filename='+filename,
		    async:false,
		    success:function(data){
		         
		         window.location.href='www.baidu.com';
		    }
	});	  
}
</script>
</html>