<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>注销界面</title>
  </head>
  
  <body>
    <%
       session.invalidate();
       response.sendRedirect("toIndex.do");
     %>
  </body>
</html>
