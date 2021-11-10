-- 1. Toàn bộ thông tin các loại hàng
    -- Mặt hàng thuộc loại hàng là 'Thắt lưng'
    -- Top 5 mặt hàng có giá bán cao nhất
    
    select * from loaihang;
    select * from mathang where MaLoai =4;
    
    select * from mathang 
    order by giaban desc limit 5 ;

    
-- 2. Đơn hàng
	-- Được bán trong ngày 28/11/2019
    -- Được bán từ ngày 28/11/2019 đến ngày 02/12/2019
    -- Được bán trong tháng 11/2019
    
    
    -- Được giao hàng tại Hòa Khánh
    select * from donhang where cast(NgayTao as date)  = '2019-11-28';
	select * from donhang where  cast(NgayTao as date) between '2019-11-28' and '2019-12-02';
     
	select * from donhang where DiaChiGiaoHang='Hòa Khánh';
    
    
-- 3. Giá của toàn bộ các mặt hàng sau khi được khuyến mãi 20%, làm tròn 2 chữ số thập phân

select *, 
round(GiaBan *1.2,2) as GiaMoi 
from mathang;

-- 4. Giảm giá 20% tất cả các mặt hàng trong ngày 25/11/2019
select MaMH,GiaBan, 
round(GiaBan *0.8,2) as GiaMoi 
from mathang 
where current_date() =str_to_date('03.11.2021', '%d.%m.%Y');

-- 5. Liệt kê tất cả các màu sắc của sản phẩm có bán trong cửa hàng.
select distinct MauSac from mathang;
-- 7. Liệt kê tất cả các mặt hàng (MaMH, TenMH, ThoiGianDatHang) được bán trong ngày 23/11/2019
select mh.MaMH,
mh.TenMH,
dh.NgayTao 
FROM mathang mh
join chitietdonhang ctdh 
on 	ctdh.MaMH=mh.MaMH
join donhang dh 
on dh.MaDH=ctdh.MaDH
where cast(dh.NgayTao as date)='2019-11-23';	  
	select mh.MaMH,
    mh.TenMH,mh.GiaBan,
    ctdh.SoLuong,
    dh.NgayTao
    from mathang mh 
    join chitietdonhang ctdh 
    on mh.MaMH=ctdh.MaMH
    join donhang dh
    on dh.MaDH=ctdh.MaDH
    where  cast(dh.NgayTao as date)='2019-11-23';
    
-- 8. Liệt kê các mặt hàng có giá bán từ 100 - 300
	select * from mathang where GiaBan between 100 and 300;
    
-- 9. Liệt kê tất cả các mặt hàng thuộc loại hàng là 'Mũ' và 'Thắt lưng'
select *
 from mathang 
 join loaihang 
 on mathang.MaLoai=loaihang.MaLoai 
 where TenLoai='Thắt lưng' or TenLoai='Mũ';
 
 SELECT * from mathang
	WHERE MaLoai in (SELECT MaLoai from loaihang
					WHERE TenLoai in('thắt lưng','mũ'));

-- 10. Liệt kê các đơn hàng được đặt trong ngày (28/11/2019, 14/12/2019)
select * 
from donhang 
where cast(NgayTao as date) between 2019-11-28 and 2019-12-02;
-- 11. Sắp xếp các mặt hàng với giá bán tăng dần
select *
from mathang
ORDER BY GiaBan ASC;

-- 12. Sắp xếp các mặt hàng với giá mua giảm dần
select *
from mathang
ORDER BY GiaMua DESC;
	
-- 13. Sắp xếp các mặt hàng với giá bán tăng dần, giá mua giảm dần
select *
from mathang
ORDER BY GiaMua DESC, GiaBan asc;

-- 14. Đếm số lượng các mặt hàng trong hệ thống
SELECT 'he thong'hethong, COUNT(mamh) soluongmathang
from mathang;
-- 15. Số lượng 'Giày da Nam' được bán trong ngày 23/11/2019
SELECT mh.MaMH,
mh.TenMH,
sum(ctdh.SoLuong) soluong
from mathang mh
join chitietdonhang ctdh
on ctdh.MaMH=mh.MaMH
join donhang dh 
on dh.MaDH=ctdh.MaDH
WHERE TenMH='Giày da nam' and
CAST(dh.NgayTao as date)='2020-12-18';
-- 16. Đếm số lượng các mặt hàng theo từng loại hàng
 --   MaLoai  TenLoai SoLuong
-- 1       Giày    20
-- 2       Áo      28
-- 16.1
SELECT mh.MaLoai,
lh.TenLoai,
GROUP_CONCAT(TenMH SEPARATOR ', ') danhsachmathang,
COUNT(mh.MaLoai) soluong
from loaihang lh
join mathang mh 
on mh.MaLoai = lh.MaLoai
GROUP BY mh.MaLoai;
-- 16.2
SELECT mh.MaLoai,
		lh.TenLoai,
 group_concat(DISTINCT concat(mh.tenmh,
                                '-',kcmh.soluong)
                                SEPARATOR ', ' ) danhsachmathang,
sum(kcmh.soluong) soluong
from loaihang lh
join mathang mh 
on mh.MaLoai = lh.MaLoai
join kichcomathang kcmh 
on kcmh.MaMH=mh.MaMH
GROUP BY mh.MaLoai;

-- 17. Tìm mặt hàng có giá bán cao nhất trong loại hàng 'Giày'
-- 17 c1 sub query
SELECT *
from mathang
WHERE GiaBan = (select max(GiaBan) giabancaonhat 
from mathang
where MaLoai = (select maloai
				from loaihang 
				where TenLoai like '%giày%'));
-- 17 c2 cte:common table expession 
WITH giabancaonhat AS (select max(GiaBan) giaban 
from mathang 
where MaLoai = (select maloai
				from loaihang 
				where TenLoai like '%giày%')
                )
SELECT * from mathang mh
-- WHERE GiaBan = (SELECT GiaBan from giabancaonhat);                
join giabancaonhat gbcn 
on gbcn.GiaBan = mh.GiaBan ;
-- 18. Tìm mặt hàng có giá bán cao nhất của mỗi loại hàng
select mh.MaMH, 
		lh.TenLoai,
        max(mh.GiaBan)giabancaonhat 
from mathang mh
join loaihang lh 
on lh.MaLoai = mh.MaLoai
 GROUP BY mh.MaLoai;

-- 19. Hiển thị tổng số lượng mặt hàng của mỗi loại hàng trong hệ thống
SELECT mh.MaLoai,
		lh.TenLoai,
 group_concat(DISTINCT concat(mh.tenmh,
                                '-',kcmh.soluong)
                                SEPARATOR ', ' ) danhsachmathang,
sum(kcmh.soluong) soluong
from loaihang lh
join mathang mh 
on mh.MaLoai = lh.MaLoai
join kichcomathang kcmh 
on kcmh.MaMH=mh.MaMH
GROUP BY mh.MaLoai
;
-- 20. Hiển thị tổng số lượng mặt hàng của mỗi loại hàng trong hệ thống
 --   Điều kiện tổng số lượng > 20 mặt hàng
SELECT mh.MaLoai,
		lh.TenLoai,
 group_concat(DISTINCT concat(mh.tenmh,
                                '-',kcmh.soluong)
                                SEPARATOR ', ' ) danhsachmathang,
sum(kcmh.soluong) soluong
from loaihang lh
join mathang mh 
on mh.MaLoai = lh.MaLoai
join kichcomathang kcmh 
on kcmh.MaMH=mh.MaMH
GROUP BY mh.MaLoai
having soluong >20;
-- 21. Hiển thị mặt hàng có số lượng nhiều nhất trong mỗi loại hàng
WITH mathangchitiet as (SELECT mh.TenMH,mh.MaMH,
						max(kcmh.soluong) soluong
						from mathang mh
						join loaihang lh 
						on mh.MaLoai = lh.MaLoai
						join kichcomathang kcmh 
						on kcmh.MaMH=mh.MaMH 
						GROUP BY mh.MaMH
ORDER BY soluong DESC)
SELECT   mh.MaMH,mh.TenMH,
		 group_concat(concat(mh.tenmh,'-',mhct.soluong)
						ORDER BY mhct.soluong DESC)chitiet,
         max(mhct.soluong) soluong
from	 mathang mh
join 	 mathangchitiet mhct
on		 mh.mamh = mhct.MaMH
GROUP BY mh.MaLoai;
SELECT mh.TenMH,mh.MaMH,
						max(kcmh.soluong) soluong
						from mathang mh
						join loaihang lh 
						on mh.MaLoai = lh.MaLoai
						join kichcomathang kcmh 
						on kcmh.MaMH=mh.MaMH 
						GROUP BY mh.MaMH
ORDER BY soluong DESC;
-- 22. Hiển thị giá bán trung bình của mỗi loại hàng
select mh.MaLoai,lh.TenLoai,avg(GiaBan) trungbinh 
from loaihang lh
join mathang mh
on mh.maloai = lh.maLoai
GROUP BY mh.MaLoai;
-- 23. In ra 3 loại hàng có số lượng hàng còn lại nhiều nhất ở thời điểm hiện tại
select lh.TenLoai,lh.MaLoai,sum(kcmh.soluong) soluongton
from loaihang lh
join mathang mh 
on mh.MaLoai = lh.MaLoai	
join kichcomathang kcmh 
on kcmh.MaMH=mh.MaMH
GROUP BY lh.MaLoai
ORDER BY(kcmh.soluong)DESC
LIMIT 3;

-- 24. Liệt kê những mặt hàng có MaLoai = 2 và thuộc đơn hàng 100100
-- c1
select mh.TenMH 
from mathang mh
join chitietdonhang ctdh 
on ctdh.MaMH = mh.MaMH
where mh.MaLoai =2 and ctdh.MaDH=01;
-- c2 
select TenMH 
from mathang
WHERE MaLoai = 2 and maMH IN (SELECT mamh 
							  from chitietdonhang
                              WHERE madh=01)
;
-- 25. Tìm những mặt hàng có Mã Loại = 2 và đã được bán trong ngày 28/11
select * 
from mathang mh
join chitietdonhang ctdh 
on mh.MaMH = ctdh.MaMH	
join donhang dh 
on dh.MaDH=ctdh.MaDH
WHERE mh.MaLoai=2 and  cast(dh.NgayTao as date) = '2020-12-18';

-- 26. Liệt kê những mặt hàng là 'Mũ' không bán được trong ngày 14/02/2019
select *
from mathang mh
join chitietdonhang ctdh 
on mh.MaMH = ctdh.MaMH	
join donhang dh 
on dh.MaDH=ctdh.MaDH
WHERE mh.TenMH like '%Áo%' and cast(dh.ngaytao as date) != '2020-12-18';

-- 27. Cập nhật giá bán của tất cả các mặt hàng thuộc loại hàng 'Áo' thành 199
	-- update mathang 
    -- SET giaban = 220
    -- WHERE maloai = 1;
	update mathang 
    SET giaban = 199
    WHERE maloai in (SELECT MaLoai 
						from loaihang
							WHERE tenmh like '%áo%');
-- 28. Backup data. Tạo table LoaiHang_BACKUP(MaLoai, TenLoai)
	Create table Loaihang_saoluu(
		maloai int PRIMARY KEY,
        tenloai varchar(255) not null UNIQUE,
        mota text
    );
    INSERT into loaihang_saoluu(maloai, tenloai, mota)
    SELECT maloai, tenloai, concat(tenloai,' ',tenloai)
    from loaihang;
 --   Sao chép dữ liệu từ bảng LoaiHang sang LoaiHang_BACKUP

-- 29. Tìm những mặt hàng có Mã Loại = 2 (T-Shirt) và đã được bán trong ngày 23/11
-- duplicate
-- 30. Liệt kê 2 sản phẩm (có số lượng tồn kho nhiều nhất) của loại hàng 'Áo' và 'Quần'
-- c1
select mh.MaMH,mh.TenMH,sum(kcmh.soluong) soluongtonkho
from mathang mh
join loaihang lh 
on mh.MaLoai = lh.MaLoai	
join kichcomathang kcmh 
on kcmh.MaMH=mh.MaMH
where lh.TenLoai IN ('quần','áo')
GROUP BY mh.MaMH
ORDER BY soluongtonkho DESC
LIMIT 2;
-- c2
WITH hangtonkho as (
select lh.TenLoai, mh.MaMH,mh.TenMH,sum(kcmh.soluong) soluongtonkho
from mathang mh
join loaihang lh 
on mh.MaLoai = lh.MaLoai	
join kichcomathang kcmh 
on kcmh.MaMH=mh.MaMH
GROUP BY mh.MaMH
ORDER BY soluongtonkho DESC
)
(SELECT * 
from hangtonkho
where tenloai ='áo' limit 1)
union
(SELECT * 
from hangtonkho
where tenloai ='quần' limit 1)
;

-- 31. Tính tổng tiền cho đơn hàng 02
 --   Với tổng tiền được tính bằng tổng các sản phẩm và số lượng của sản phẩm tương ứng
 SELECT ctdh.MaDH,
		mh.TenMH,
		sum(mh.GiaBan*ctdh.SoLuong) tongtien
 from mathang mh
 join chitietdonhang ctdh 
 on mh.MaMH = ctdh.MaMH
 WHERE ctdh.MaDH = 2
 group by mh.Mamh;
 

-- 32. Xuất thông tin hóa đơn của đơn hàng 02 với thông tin như sau.
-- SoDH ChiTietDonHang           TongTien
 --   02   TenMH:GiaBan:SoLuong     100
 SELECT ctdh.MaDH,
		GROUP_CONCAT(concat(mh.tenmh,':',
                            mh.giaban,':',
                            ctdh.soluong) SEPARATOR ' ,')chitiet,
		sum(mh.GiaBan*ctdh.SoLuong) tongtien
 from mathang mh
 join chitietdonhang ctdh 
 on mh.MaMH = ctdh.MaMH
 WHERE ctdh.MaDH = 2
 group by mh.Mamh;
