<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Calculate Discount</title>
</head>
<body>
<form action="/calculate" method="post">
    <label>Product Description: </label>
    <input type="text" name="description" placeholder="Nhập mô tả sản phẩm"/>
    <br>

    <label>List Price: </label>
    <input type="text" name="price" placeholder="Nhập giá niêm yết sản phẩm"/>
    <br>

    <label>Discount Percent: </label>
    <input type="text" name="discountPercent" placeholder="Nhập tỷ lệ chiết khấu (phần trăm)"/>
    <br>

    <input type = "submit" id = "submit" value = "Calculate Discount"/>
</form>
</body>
</html>