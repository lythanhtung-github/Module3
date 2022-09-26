use qlbh;
-- In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 20.000 đến 30.000.
select MASP, TENSP FROM SANPHAM 
WHERE NUOCSX = "Trung Quoc" and (Gia >= 2000 and Gia <=30000);

-- In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” hoặc “Thái Lan” sản xuất có giá từ
-- 20.000 đến 30.000.
select MASP, TENSP FROM SANPHAM 
WHERE (NUOCSX IN ("Trung Quoc","Thai Lan")) and (Gia >= 20000 and Gia <=30000);

select MASP, TENSP FROM SANPHAM 
WHERE (NUOCSX = "Trung Quoc" or NUOCSX = "Thai Lan") and (Gia >= 20000 and Gia <=30000);

/*
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

*/

-- In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
select k.MaKH, k.HOTEN, s.TenSP, cthd.SoLuong, s.Gia, cthd.SoLuong * s.Gia as TongTien
from KHACHHANG k 
join HOADON h on k.MaKH = h.MaKH 
join cthd on cthd.SoHD = h.SoHoaDon
join sanpham s on cthd.MaSP = s.MaSP
where h.NgayMuaHang = '2007-01-01 00:00:00';

-- 9. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyễn Văn A” mua trong Tháng 10/2006.
SELECT s.MASP, s.TENSP, hd.NgayMuaHang FROM SANPHAM s
JOIN CTHD ct ON s.MASP = ct.MASP
JOIN HOADON hd ON hd.SoHoaDon = ct.SoHD
JOIN KHACHHANG kh ON kh.MaKH  = hd.MaKH
WHERE kh.HOTEN = 'Nguyen Van A' AND hd.NgayMuaHang like '2006-10-%';

-- 20. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
SELECT ROUND(AVG(TriGia),3) as "Giá trị trung bình (VNĐ)" FROM HoaDon
WHERE NgayMuaHang like '2006%';

SELECT ROUND(AVG(TriGia),3) as "Giá trị trung bình (VNĐ)" FROM HoaDon
WHERE YEAR(NgayMuaHang) = '2006';

select avg (hoadon.trigia)
from hoadon
where NgayMuaHang like '2006-%-%';

-- 26. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quốc” sản xuất có giá bằng 1 trong 3 mức giá thấp nhất (của tất cả các sản phẩm).
SELECT GIA FROM SANPHAM 
WHERE NUOCSX = "Trung Quoc" 
ORDER BY GIA
LIMIT 0,3;

SELECT sp.MASP, sp.TENSP, sp.GIA FROM SANPHAM sp
JOIN (
	SELECT distinct * FROM SANPHAM WHERE NuocSX = "Trung Quoc" ORDER BY GIA LIMIT 0,3
	) AS spMin 
	ON sp.GIA = spMin.GIA
WHERE sp.NuocSX = "Trung Quoc";