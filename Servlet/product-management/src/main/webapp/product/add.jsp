<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add product</title>
    <style>
        .message {
            color: green;
        }
    </style>
</head>
<body>
<h1>Thêm sản phẩm</h1>
<p>
    <c:if test="${requestScope['message']!=null}">
        <span class="message">${requestScope['message']}</span>
    </c:if>
</p>
<p><a href="/product">Trở về</a></p>
<form method="post">
    <fieldset>
        <legend>Thông tin sản phẩm</legend>
        <table>
            <tr>
                <td>Tên sản phẩm:</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>Giá phẩm:</td>
                <td><input type="text" name="price"></td>
            </tr>
            <tr>
                <td>Số lượng:</td>
                <td><input type="number" name="quantity"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Add product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
