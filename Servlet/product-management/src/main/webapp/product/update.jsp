<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update</title>
    <style>
        .message{
            color:green;
        }
    </style>
</head>
<body>
<h1>Cập nhật sản phẩm</h1>
<p class =".message">
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p><a href="/product">Trở về</a></p>
<form method="post">
    <fieldset>
        <legend>Thông tin sản phẩm</legend>
        <table>
            <tr>
                <td>Id: </td>
                <td><input type="text" name="id" value="${requestScope["product"].getId()}" readonly></td>
            </tr>
            <tr>
                <td>Tên sản phẩm: </td>
                <td><input type="text" name="name" value="${requestScope["product"].getName()}"></td>
            </tr>
            <tr>
                <td>Giá: </td>
                <td><input type="text" name="price" value="${requestScope["product"].getPrice()}"></td>
            </tr>
            <tr>
                <td>Số lượng: </td>
                <td><input type="number" name="quantity" value="${requestScope["product"].getQuantity()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Cập nhật"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
