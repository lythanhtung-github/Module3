USE quanlybanhang;

INSERT INTO customer(cName, cAge) 
VALUE ("Minh Quan", 18),
("Ngoc Oanh", 20),
("Hong Ha", 50);

INSERT INTO order_order(cID, oDate, oTotalPrice)
VALUE (1,'2006-03-21', NULL),
(2,'2006-03-23', NULL), 
(1,'2006-03-16', NULL);

INSERT INTO product(pName, pPrice) 
VALUE ('May Giat',3),
('Tu lanh',5),
('Dien Hoa',7),
('Quat',1),
('Bep Dien',2);

INSERT INTO orderdetail(oID, pID , odQTY)
VALUE (1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT oID, oDate, oTotalPrice FROM order_order;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
SELECT DISTINCT c.cID as "ID", 
c.cName as "Name", 
c.cAge  as "Age", 
p.pName as "Product",
p.pPrice as "Price",
od.odQTY as "Quantity",
o.oDate as "Date", 
o.oTotalPrice as "Total"
FROM customer c 
INNER JOIN order_order o ON c.cID = o.cID
INNER JOIN orderdetail od ON o.oID = od.oID 
INNER JOIN product p ON p.pID = od.pId;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT c.cID as "ID", 
c.cName as "Name", 
c.cAge  as "Age"
FROM customer c 
WHERE c.cID NOT IN
(SELECT c.cID FROM (customer 
INNER JOIN order_order o 
ON c.cID = o.cID));

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
-- Giá bán của từng loại được tính = odQTY*pPrice)
SELECT
o.oID as "Order ID",
o.oDate as "Date",
sum(od.odQTY * p.pPrice) as "Total"
FROM ((orderdetail od inner join product p on od.pID = p.pID)
inner join order_order o on od.oID = o.oID)
GROUP BY o.oID;