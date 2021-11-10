-- B. DELETE
-- 1. Xóa nhân viên có tên 'Văn Hoàng' trong hệ thống
-- 2. Xóa bộ phận giao hàng trong hệ thống
-- 3. Xóa tất cả các mặt hàng có mã loại bằng 4
-- 4. Xóa tất cả các mặt hàng trong hệ thống
-- 5. Vì hệ thống bị lỗi. Hủy tất cả các đơn hàng ngày 23/11/2019
-- Thực hiện xóa các đơn hàng bị lỗi

set FOREIGN_KEY_CHECKS=1;
SELECT * FROM nhanvien;
DELETE FROM nhanvien WHERE TenNV = 'Lê Na';
SELECT * FROM mathang;
DELETE FROM mathang
WHERE MaLoai=4;

rollback;
DELETE FROM mathang;
select NgayTao,
       cast(NgayTao as Date) NTN,
       cast(NgayTao as TIME) GPG 
from donhang;

SELECT * FROM donhang;
DELETE FROM donhang
WHERE CAST(NgayTao as DATE) ='2020-12-17';


-- C. UPDATE
-- 1. Cập nhật tên mới cho phòng ban có MaPB = 2 thành 'Bộ phận quản lý'
-- 2. Cập nhật ghi chú của đơn hàng 01 thành 'Giao hàng sau 10H sáng'
-- b1: them
-- b2 capnhat
alter table donhang
add ghichu varchar(255) not null;

update donhang set ghichu = 'giao hang sau 10h' where MADH=01;

-- 3. Đơn hàng 01 đã được giao hàng thành công. Thực hiện cập nhật
--    MaTT = 03, TrangThai = 'Đã giao', ThoiGian = Thời gian hiện tại
-- 4. Cập nhật số tiền cần thanh toán trong bảng hóa đơn thành 890 cho đơn hàng 01
-- 5. Cập nhật tất cả các mặt hàng thuộc loại hàng là 'Mũ' với giá bán là 199K

-- 
alter table nhanvien
add matkhau text not null;

SELECT *  from nhanvien;
select * from nhanvien
where Email = ?
and matkhau = ?




