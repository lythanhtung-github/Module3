use qlbh;

/*
1. Tạo các quan hệ và khai báo các khóa chính, khóa ngoại của bảng.
*/
/*
-- 2. Thêm vào thuộc tính GHICHU có kiểu dữ liệu varchar(20) cho bảng SANPHAM.
ALTER TABLE sanpham
ADD GHICHU VARCHAR(20);
*/
/*
-- 3. Thêm vào thuộc tính LOAIKH có kiểu dữ liệu là tinyint cho quan hệ KHACHHANG.
ALTER TABLE KHACHHANG
ADD LOAIKH TINYINT;
*/
/*
-- 4. Sửa kiểu dữ liệu của thuộc tính GHICHU trong quan hệ SANPHAM thành varchar(100).
ALTER TABLE sanpham
MODIFY COLUMN GHICHU VARCHAR(100);
*/
/*
-- 5. Xóa thuộc tính GHICHU trong quan hệ SANPHAM.
ALTER TABLE sanpham
DROP COLUMN GHICHU;
*/
/*
-- 6. Làm thế nào để thuộc tính LOAIKH trong quan hệ KHACHHANG có thể lưu các giá trị là: “Vang ai”, “Thuong xuyen”, “Vip”, …
ALTER TABLE khachhang
MODIFY COLUMN loaikh VARCHAR(100);
*/
/*
-- 7. Đơn vị tính của sản phẩm chỉ có thể là (“cây”,”hộp”,”cái”,”quyển”,”chục”)
ALTER TABLE sanpham
ADD CONSTRAINT check_dvt CHECK(DVT = "cay" or DVT = "cai" or DVT ="hop" or DVT ="quyen" or DVT ="chuc");
*/
/*
8. Giá bán của sản phẩm từ 500 đồng trở lên.
ALTER TABLE sanpham
ADD CONSTRAINT check_gia CHECK(gia >= 500);
*/
/*
-- 10. Ngày gia nhập của khách hàng thành viên phải lớn hơn ngày sinh của người đó.
ALTER TABLE khachhang
ADD CONSTRAINT check_ngaydangky CHECK(ngaydangki>ngaysinh);
*/

/*
--  1. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất.
SELECT * FROM sanpham WHERE NUOCSX = "Trung Quoc";
*/
/*
-- 2. In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cây”, ”quyển”.
SELECT MASP, TENSP, dvt FROM sanpham WHERE dvt = "cay" OR dvt = "quyen";
*/
/*
-- 3. In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
SELECT MASP, TENSP FROM sanpham WHERE MASP like "B%01";
*/
/*
-- 4. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 20.000 đến 30.000.
select MASP, TENSP FROM SANPHAM 
WHERE NUOCSX = "Trung Quoc" and (Gia >= 2000 and Gia <=30000);
*/
/*
-- 5. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” hoặc “Thái Lan” sản xuất có giá từ
-- 20.000 đến 30.000.
select MASP, TENSP FROM SANPHAM 
WHERE (NUOCSX IN ("Trung Quoc","Thai Lan")) and (Gia >= 20000 and Gia <=30000);

select MASP, TENSP FROM SANPHAM 
WHERE (NUOCSX = "Trung Quoc" or NUOCSX = "Thai Lan") and (Gia >= 20000 and Gia <=30000);
*/
/*
-- 6. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
select * from hoadon where ngaymuahang between '2007-01-01' and '2007-01-02';
*/
/*
-- 7. In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của óa đơn (giảm dần).
select * from hoadon where ngaymuahang like '2007-01%' order by ngaymuahang;
select * from hoadon where ngaymuahang like '2007-01%' order by ngaymuahang desc;
*/
/*
-- 8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
select kh.MAKH, kh.HOTEN from KHACHHANG kh
JOIN HOADON hd ON kh.MaKH = hd.MaKH
WHERE DATE(NgayMuaHang) = '2007-01-01'; 
*/
/*
-- 9. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyễn Văn A” mua trong Tháng 10/2006.
SELECT s.MASP, s.TENSP, hd.NgayMuaHang FROM SANPHAM s
JOIN CTHD ct ON s.MASP = ct.MASP
JOIN HOADON hd ON hd.SoHoaDon = ct.SoHD
JOIN KHACHHANG kh ON kh.MaKH  = hd.MaKH
WHERE kh.HOTEN = 'Nguyen Van A' AND hd.NgayMuaHang like '2006-10-%';
*/
/*
-- 10. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyễn Văn B” lập trong ngày 10/10/2006.
SELECT hd.SOHOADON, hd.TRIGIA, nv.HoTen, hd.NgayMuaHang FROM HOADON hd
JOIN NHANVIEN nv ON hd.MaNV = nv.MaNV
WHERE nv.HoTen = "Nguyen Van B" and DATE(NgayMuaHang) = '2006-10-10'
*/
/*
-- 11. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
SELECT * FROM HOADON hd
JOIN cthd ct ON hd.SoHoaDon = ct.SoHD
WHERE ct.MaSP = 'BB01' or ct.MaSP = 'BB02'
*/	
/*
12. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số ượng từ 10 đến 20.
SELECT * FROM HOADON hd
JOIN cthd ct ON hd.SoHoaDon = ct.SoHD
WHERE (ct.MaSP = 'BB01' or ct.MaSP = 'BB02') and (ct.SoLuong between 10 and 20);
*/
/*
13. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
SELECT * FROM HOADON hd
	JOIN cthd ct ON hd.SoHoaDon = ct.SoHD
	WHERE ct.MaSP = 'BB01'
	and (ct.SoLuong between 10 and 20)
    and hd.SoHoaDon IN (SELECT hd.SoHoaDon FROM HOADON hd
		JOIN cthd ct ON hd.SoHoaDon = ct.SoHD
		WHERE ct.MaSP = 'BB02');
*/
/*
14. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.
SELECT sp.MASP, sp.TENSP  FROM SANPHAM sp
JOIN cthd ct ON sp.MASP = ct.MASP
JOIN HOADON hd ON ct.SOHD = hd.SOHOADON   
WHERE sp.NuocSX = "Trung Quoc" or hd.NGAYMUAHANG = '2007-01-01'
*/
/*
15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
SELECT sp.MASP, sp.TENSP FROM SANPHAM sp WHERE sp.MASP NOT IN (SELECT ct.MASP FROM cthd ct);
*/
/*
16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
SELECT sp.MASP, sp.TENSP
FROM SANPHAM sp 
WHERE sp.MASP 
NOT IN (SELECT ct.MASP FROM cthd ct 
		JOIN HOADON hd ON ct.SoHD = hd.SoHoaDon
		WHERE hd.NgayMuaHang like "2006%");
*/
/*
17. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất không bán được trong năm 2006.
SELECT sp.MASP, sp.TENSP
FROM SANPHAM sp 
WHERE (sp.MASP NOT IN (SELECT ct.MASP FROM cthd ct 
			JOIN HOADON hd ON ct.SoHD = hd.SoHoaDon
			WHERE hd.NgayMuaHang like "2006%"))
        AND sp.NUOCSX = "Trung Quoc";
*/
/*
18. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
SELECT COUNT(SOHOADON) - COUNT(MaKH) as "Số hóa đơn không phải khách hàng đăng ký thành viên mua" 
FROM HOADON
*/
/*
-- 19. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
SELECT MAX(TRIGIA) FROM HOADON;
SELECT MIN(TRIGIA) FROM HOADON;
*/
/*
-- 20. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
SELECT ROUND(AVG(TRIGIA),2) FROM HOADON
WHERE YEAR(NGAYMUAHANG) LIKE '2006';
*/
/*
-- 21. Tính doanh thu bán hàng trong năm 2006.
SELECT SUM(TRIGIA) FROM HOADON
WHERE YEAR(NGAYMUAHANG) LIKE '2006';
*/
/*
-- 22. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
SELECT SOHOADON, TRIGIA FROM HOADON 
WHERE TRIGIA = (SELECT MAX(TRIGIA) FROM HOADON
WHERE YEAR(NGAYMUAHANG) LIKE '2006');
*/
/*
-- 23. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
SELECT kh.HOTEN, hd.TRIGIA FROM KHACHHANG kh JOIN HOADON hd ON kh.MAKH = hd.MAKH WHERE hd.SOHOADON IN
(SELECT SOHOADON FROM HOADON 
WHERE TRIGIA = (SELECT MAX(TRIGIA) FROM HOADON
WHERE YEAR(NGAYMUAHANG) LIKE '2006'));
*/
/*
-- 24. In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.
SELECT kh.MAKH, kh.HOTEN FROM KHACHHANG kh 
JOIN (SELECT distinct DOANHSO FROM KHACHHANG ORDER BY DOANHSO DESC LIMIT 0,3) AS maxDoanhSo
ON kh.DOANHSO = maxDoanhSo.DOANHSO;
*/
/*
-- 25. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
SELECT sp.MASP, sp.TENSP FROM SANPHAM sp 
JOIN (SELECT DISTINCT GIA FROM SANPHAM ORDER BY GIA DESC LIMIT 0,3) AS maxSanPham
ON sp.GIA = maxSanPham.GIA;
*/
/*
-- 26. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quốc” sản xuất có giá bằng 1 trong 3 mức Giá thấp nhất 
-- (của tất cả các sản phẩm).
SELECT sp.MASP, sp.TENSP, sp.GIA FROM SANPHAM sp 
JOIN (SELECT DISTINCT GIA FROM SANPHAM 
        ORDER BY GIA 
        LIMIT 0,3) AS maxSanPham
ON sp.GIA = maxSanPham.GIA
WHERE NuocSX = "Trung Quoc";
*/
/*
-- 27. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quốc” sản xuất có giá bằng 1 trong 3 mức Giá thấp nhất 
-- (của sản phẩm do “Trung Quốc” sản xuất).
SELECT sp.MASP, sp.TENSP, sp.GIA FROM SANPHAM sp 
JOIN (SELECT DISTINCT GIA FROM SANPHAM 
		WHERE NuocSX = "Trung Quoc"
        ORDER BY GIA 
        LIMIT 0,3) AS maxSanPham
ON sp.GIA = maxSanPham.GIA;
*/
/*
-- 28. * In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).
SELECT kh.MAKH, kh.HOTEN FROM KHACHHANG kh
JOIN (SELECT DISTINCT DOANHSO FROM KHACHHANG
		ORDER BY DOANHSO DESC
        LIMIT 0,3) AS maxKhanhHang
ON kh.DOANHSO  = maxKhanhHang.DOANHSO;
*/
/*
-- 29. Tính tổng số sản phẩm do “Trung Quốc” sản xuất.
SELECT COUNT(MASP) AS "TỔNG SỐ SP" FROM SANPHAM
WHERE NUOCSX = "Trung Quoc";
*/
/*
-- 30. Tính tổng số sản phẩm của từng nước sản xuất.
SELECT COUNT(MASP) AS "TỔNG SỐ SP", NUOCSX  FROM SANPHAM
GROUP BY NUOCSX;
*/
/*
-- 31. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
SELECT NUOCSX, MAX(GIA), MIN(GIA), ROUND(AVG(GIA),2) AS "TỔNG SỐ SP" 
FROM SANPHAM
GROUP BY NUOCSX;
*/
/*
-- 32. Tính doanh thu bán hàng mỗi ngày.
SELECT NGAYMUAHANG, SUM(TRIGIA) AS "DOANH THU"
FROM HOADON
GROUP BY DATE(NGAYMUAHANG);
*/
/*
-- 33. Tính tổng số lượng của từng sản phẩm bán ra trong ngày 28/10/2006.
SELECT SP.TENSP, SP.MASP , SUM(CT.SOLUONG) 
FROM CTHD CT 
JOIN SANPHAM SP ON SP.MASP = CT.MASP
JOIN HOADON HD ON CT.SOHD = HD.SOHOADON
WHERE HD.NGAYMUAHANG = "2006-10-28"
GROUP BY CT.MASP;
*/
/*
-- 34. Tính doanh thu bán hàng của từng tháng trong năm 2006.
SELECT MONTH(NGAYMUAHANG) AS "THÁNG", SUM(TRIGIA) AS "DOANH THU"
FROM HOADON
WHERE YEAR(NGAYMUAHANG) = "2006"
GROUP BY MONTH(NGAYMUAHANG)
ORDER BY NGAYMUAHANG;
*/
/*
-- 35. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
SELECT MAKH, HOTEN FROM KHACHHANG 
WHERE MAKH = (SELECT MAKH FROM HOADON GROUP BY MAKH ORDER BY COUNT(MAKH) DESC LIMIT 0,1);
*/
/*
-- 36. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
SELECT SP.MASP, SP.TENSP FROM SANPHAM SP
JOIN CTHD CT
ON CT.MASP = SP.MASP
WHERE CT.SOLUONG = (SELECT MIN(SOLUONG) FROM CTHD CT JOIN HOADON HD ON CT.SOHD = HD.SOHOADON WHERE HD.NGAYMUAHANG LIKE "2006%");
*/
/*
-- 37. Tháng mấy trong năm 2006, doanh số bán hàng thấp nhất ?
SELECT MONTH(NGAYMUAHANG) AS "THÁNG" FROM HOADON
WHERE YEAR(NGAYMUAHANG) = "2006"
GROUP BY MONTH(NGAYMUAHANG)
ORDER BY SUM(TRIGIA)
LIMIT 0,1;
*/
/*
-- 38. Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
SELECT SP.NUOCSX, SP.MASP, SP.TENSP, SP.GIA FROM SANPHAM SP
WHERE GIA IN (SELECT MAX(GIA) FROM SANPHAM GROUP BY NUOCSX)
GROUP BY SP.NUOCSX
*/
/*
-- 39. *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất.
SELECT HD.MAKH, KH.HOTEN, COUNT(HD.MAKH) FROM HOADON HD 
JOIN (SELECT MAKH, HOTEN, DOANHSO FROM KHACHHANG 
ORDER BY DOANHSO DESC LIMIT 0,10) AS MAXDOANHSO
ON HD.MAKH  = MAXDOANHSO.MAKH
JOIN KHACHHANG KH
ON HD.MAKH = KH.MAKH
GROUP BY HD.MAKH ORDER BY COUNT(HD.MAKH) DESC LIMIT 0,1
*/
/*
-- 40. *Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau
SELECT NUOCSX
FROM  SANPHAM
GROUP BY NUOCSX
HAVING COUNT(DISTINCT GIA)>=3
*/

/* BÀI TẬP THÊM
#IN : Trong 1 danh sách, trong 1 câu lệnh select
select MASP, TENSP FROM SANPHAM 
WHERE (NUOCSX IN (
	select nuocsx 
    from sanpham
    where nuocsx = "Thai Lan" 
    or nuocsx = "Trung Quoc"
    group by nuocsx
    )) 
and (Gia >= 20000 and Gia <=30000);

select MASP, TENSP FROM SANPHAM 
WHERE (
		NUOCSX IN (
		select distinct nuocsx 
		from sanpham
		where nuocsx = "Thai Lan" or nuocsx = "Trung Quoc"
		)
    ) 
and (Gia >= 20000 and Gia <=30000);



-- In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
select k.MaKH, k.HOTEN, s.TenSP, cthd.SoLuong, s.Gia, cthd.SoLuong * s.Gia as TongTien
from KHACHHANG k 
join HOADON h on k.MaKH = h.MaKH 
join cthd on cthd.SoHD = h.SoHoaDon
join sanpham s on cthd.MaSP = s.MaSP
where h.NgayMuaHang = '2007-01-01 00:00:00';




-- 20. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
-- SELECT ROUND(AVG(TriGia),3) as "Giá trị trung bình (VNĐ)" FROM HoaDon
-- WHERE NgayMuaHang like '2006%';

-- SELECT ROUND(AVG(TriGia),3) as "Giá trị trung bình (VNĐ)" FROM HoaDon
-- WHERE YEAR(NgayMuaHang) = '2006';

-- select avg (hoadon.trigia)
-- from hoadon
-- where NgayMuaHang like '2006-%-%';

-- -- 26. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quốc” sản xuất có giá bằng 1 trong 3 mức giá thấp nhất (của tất cả các sản phẩm).
-- SELECT GIA FROM SANPHAM 
-- WHERE NUOCSX = "Trung Quoc" 
-- ORDER BY GIA
-- LIMIT 0,3;

-- SELECT sp.MASP, sp.TENSP, sp.GIA FROM SANPHAM sp
-- JOIN (
-- 	SELECT distinct * FROM SANPHAM WHERE NuocSX = "Trung Quoc" ORDER BY GIA LIMIT 0,3
-- 	) AS spMin 
-- 	ON sp.GIA = spMin.GIA
-- WHERE sp.NuocSX = "Trung Quoc";
*/