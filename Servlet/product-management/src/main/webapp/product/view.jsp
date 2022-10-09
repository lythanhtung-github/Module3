<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>view</title>
</head>
<body>
    <fieldset>
        <legend>Thông tin sản phẩm</legend>
        <table>
            <tr>
                <td>Id: </td>
                <td>${requestScope["product"].getId()}</td>
            </tr>
            <tr>
                <td>Tên sản phẩm: </td>
                <td>${requestScope["product"].getName()}</td>
            </tr>
            <tr>
                <td>Giá: </td>
                <td>${requestScope["product"].getPrice()}</td>
            </tr>
            <tr>
                <td>Số lượng: </td>
                <td>${requestScope["product"].getQuantity()}</td>
            </tr>
            <tr>
                <td><a href="/product">Trở về</a></td>
            </tr>
        </table>
    </fieldset>
</body>
</html>
