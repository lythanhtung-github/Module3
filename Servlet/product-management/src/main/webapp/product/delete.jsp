<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Delete</title>
</head>
<body>
<h1>Xóa sản phẩm</h1>
<form method="post">
  <h3>Bạn có chắc chắn muốn xóa không?</h3>
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
        <td><input type="submit" value="Xóa"></td>
        <td><a href="/product">Trở về</a></td>
      </tr>
    </table>
  </fieldset>
</form>
</body>
</html>
