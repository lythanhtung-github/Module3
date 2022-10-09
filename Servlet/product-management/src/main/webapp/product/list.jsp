<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
    <style>
        table{
            width: 50%;
        }
        table, td, tr{
            border:1px solid black;
        }
        table thead{
            background-color: black;
            color: white;
            font-size: 18px;
        }
    </style>
</head>
<body>
<h1>DANH SÁCH SẢN PHẨM</h1>
<p><a href="/product?action=add">Thêm sản phẩm mới</a></p>
<table>
    <thead>
    <tr>
        <td>Id</td>
        <td>Tên SP</td>
        <td>Giá</td>
        <td>Số lượng</td>
        <td colspan="2">Thao tác</td>
    </tr>
    </thead>

    <c:forEach items="${requestScope['products']}" var="product">
        <tr>
            <td>${product.getId()}</td>
            <td><a href="/product?action=view&id=${product.getId()}">${product.getName()}</a></td>
            <td>${product.getPrice()}</td>
            <td>${product.getQuantity()}</td>
            <td><a href="/product?action=update&id=${product.getId()}">Sửa</a></td>
            <td><a href="/product?action=delete&id=${product.getId()}">Xóa</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>