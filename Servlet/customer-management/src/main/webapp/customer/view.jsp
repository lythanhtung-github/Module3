<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>View customer</title>
</head>
<body>
<h1>Customer details</h1>
<p>
  <a href="/customer">Back to customer list</a>
</p>
<table>
  <tr>
    <td>Name: </td>
    <td>${requestScope["customer"].getName()}</td>
  </tr>
  <tr>
    <td>Email: </td>
    <td>${requestScope["customer"].getEmail()}</td>
  </tr>
  <tr>
    <td>Address: </td>
    <td>${requestScope["customer"].getAddress()}</td>
  </tr>
</table>
</body>
</html>
