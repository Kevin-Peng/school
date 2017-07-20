<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
 <head> 
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" /> 
  <title>收藏</title> 
  <link rel="stylesheet" type="text/css" href="../static/css/collect.css" /> 
  <link rel="stylesheet" href="../static/css/style.css" /> 
  <!-- <link rel="stylesheet" href="https://assets.sephome.com/system/b2c/templates/default/css/common.css?t=a1496374685051"/>
    <link rel="stylesheet" href="https://assets.sephome.com/system/b2c/templates/default/css/modules.css?t=a1496374685051"/> --> 
  <!--下拉面板--> 
  <script type="text/javascript" src="../static/js/jquery-1.7.2.min.js?t=1496299121701"></script> 
  <script type="text/javascript" src="../static/js/jquery.bigautocomplete.js?t=1496299121701"></script> 
  <script type="text/javascript" src="../static/js/commonFooter.js?t=1496299121701"></script> 
  <!--head--> 
  <script type="text/javascript" src="../static/js/head.js"></script> 
 </head> 
 <body> 
 
   <!--——————————————————————要添加别的页面——————————————————————--> 
 <div class="main">  
   <jsp:include page="../header.jsp"/> 
 <!--用户中心首页开始--> 
  <div class="wrap"> 
   <table> 
    <tbody>
     <tr> 
      <td> 
       <!--个人中心左栏占位--> 
       <div class="com_left"> 
        <iframe src="./personalleft.jsp" background="black" scrolling="no" frameborder="0" marginheight="0px" marginwidth="0px" width="200px" height="400px"></iframe> 
       </div> 
       <!--个人中心左栏占位结束--> </td> 
      <td> 
       <!--右栏开始--> 
       <div class="com_right"> 
        <div class="crumb"> 
         <br />
         <a href="../personal.do">个人首页&gt;&gt;</a> 我的收藏 
        </div> 
        <div class="account-content address_manage"> 
         <div class="personal_account clearfix"> 
          <div class="commodity_consult"> 
           <div class="box-account order_list fav_list"> 
            <!--收藏列表title--> 
            <br />
            <div class="record">
             <h2>收藏列表</h2>
             <br />
            </div>
            <br /> 
            <div class="dtable">
            <table class="list" border="0" cellpadding="0" cellspacing="0"> 
             <tbody>
              <tr id="row1"> 
               <td class="c3">商品</td> 
               <td class="c4">名称</td> 
               <td class="c5">价格</td>  
               <td class="c8" style="text-align:center;">操作</td> 
              </tr>
              <%
				int q = 0;
				int pag = 1;
				%>
			<c:forEach items="${collectlist}" var="a">
			<%
              	q++;
				if (q % 5 == 0) {
					pag++;
				}
				%>
			</c:forEach>
              <c:forEach items="${mycollectlist}" var="b">
              <tr id="row2"> 
               <td class="c3"> <img src="../static/${b.ppic}" width="70px" height="70px" /> </td> 
               <td class="c4">${b.pname}</td> 
               <td class="c5"> ${b.pprice}</td> 
               <td class="c8" style="text-align:center;"> 
               <a href="../nocollect.do?pid=${b.pid}&userId=${b.userId}" target="_top">取消收藏</a><br />
                <a href="../collecttocart.do?pid=${b.pid}&userId=${b.userId}" target="_top">加入购物车</a> </td> 
              </tr> 
              </c:forEach>
             
              <tr id="row3"> 
               <td class="c3"></td> 
               <td class="c4"></td>  
               <td class="c5" colspan="2" style="text-align:right;"> 
                <div class="page_list"> 
                <br> 
                 <form action="../collectpage.do" method="post" name="form" onsubmit="return page();">
                 	<span>到第</span><input type="text" value="1" name="pagid" style="width:25px; height:20px;"/><span>页</span>
                 	<input type="submit" value="GO"/> 
                 	<%
                 if(true){
             	System.out.println("共有这么多页" + pag);
				session.setAttribute("pag", pag);
			%>
			<span>共</span><input type="text" value="${pag}" name="zongpag" style="border:0px;width:25px; height:20px;text-align:center;"/><span>页</span>
			<%
				}
			%>
                 </form>
                 
                <script src="../static/js/jquery-1.7.2.min.js" type="text/javascript"></script>
				<script type="text/javascript">
					function page(){
						var pag1 = parseInt(form.pagid.value);
						var pag2 = parseInt(form.zongpag.value);
						if(pag1>pag2){
							alert("输入不能大于总页数");
							return false;
						}
						else{
							return true;
						}
			}
		 		</script>
                </div>
                </td> 
              </tr> 
             </tbody>
            </table> 
            </div>
           </div> 
          </div> 
          <!--分页--> 
         </div> 
        </div> 
       </div> 
       <!--}右栏结束--> </td> 
     </tr> 
    </tbody>
   </table> 
  </div> 
  <!--}用户中心结束--> 
  <div>
   <!--——————————————————————要添加别的页面——————————————————————--> 
   <iframe src="../foot.jsp" scrolling="no" frameborder="0" marginheight="0px" marginwidth="0px" height="284px" width="100%"></iframe> 
  </div>  
  </div>
 </body>
</html>