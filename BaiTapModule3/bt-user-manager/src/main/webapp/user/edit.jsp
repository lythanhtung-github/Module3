<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>User Management Application</title>
</head>
<body>
<center>
  <h1>User Management</h1>
  <h2>
    <a href="users">List All Users</a>
  </h2>
</center>
<div align="center">
  <form method="post">
    <table border="1" cellpadding="5">
      <caption>
        <h2>
          Edit User
        </h2>
      </caption>
      <c:if test="${user != null}">
        <input type="hidden" name="id" value="<c:out value='${user.getId()}' />"/>
      </c:if>
      <tr>
        <th>User Name:</th>
        <td>
          <input type="text" name="name" size="45"
                 value="<c:out value='${user.getName()}' />"
          />
        </td>
      </tr>
      <tr>
        <th>User Email:</th>
        <td>
          <input type="text" name="email" size="45"
                 value="<c:out value='${user.getEmail()}' />"
          />
        </td>
      </tr>
      <tr>
        <th>Country:</th>
        <td>
          <select name="countryId" id="">
            <c:forEach items="${applicationScope.countryList}" var="country">
              <c:choose>
                <c:when test="${country.getId() == user.getCountryId()}">
                  <option value="${country.getId()}" selected>${country.getName()}</option>
                </c:when>
                <c:otherwise>
                  <option value="${country.getId()}">${country.getName()}</option>
                </c:otherwise>
              </c:choose>
            </c:forEach>
          </select>
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center">
          <input type="submit" value="Save"/>
        </td>
      </tr>
    </table>
  </form>
</div>
</body>
</html>