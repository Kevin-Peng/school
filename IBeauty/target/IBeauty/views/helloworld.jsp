<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/6/3 0003
  Time: 0:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>你好</title>
</head>
<body>
<h1>jsp页面</h1>
<tr><td>asdsadsa</td></tr>
<c:forEach items="${books}" var="book">
    <tr>
        <td>这是书名</td>
        <td>${book.title}</td>
    </tr>
</c:forEach>



</body>
</html>
