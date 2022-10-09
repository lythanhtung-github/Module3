<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 10/9/2022
  Time: 3:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>show</title>
</head>
<body>
  <h1>SHOW</h1>
    <%
      String think = request.getParameter("think");
    %>
    <h3><%=think%></h3>
</body>
</html>
