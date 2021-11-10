-- tao co so du lieu java09_shopping
-- Drop schema java09_shopping_manually;
create schema java09_shopping_manually default char set UTF8MB4;
use java09_shopping_manually;
-- tao table mat hang loai hang
-- c1: loai hang => loaihang
-- c2: mathang => add FK
create table LoaiHang (
	MaLoai int,
    TenLoai text not null,
    constraint PK_LoaiHang primary key(MaLoai)
);
create table MatHang (
	MaMh int primary key,
    TenMh varchar(255) not null,
	MauSac varchar(255) not null,
    ChatLieu varchar(255) not null,
    GiaBan double not null,
    GiaMua double not null,
    HinhAnh text not null,
    MaLoai int not null,
    foreign key (MaLoai) references LoaiHang (MaLoai)
);
-- 3 tao rang buoc pk, fk cho 2 table tren 
-- b1 drop fk_mathang
-- b2 add new fk_mathang
Alter table MatHang
 drop foreign key mathang_ibfk_1 ;
 
Alter table MatHang 
add constraint FK_Mathang_MaLoai 
foreign key(MaLoai) references LoaiHang(MaLoai);

ALTER TABLE LoaiHang
add  NgayTao DATETIME DEFAULT CURRENT_TIMESTAMP() NOT NULL ;


CREATE TABLE KichCo (
KiHieu VARCHAR(5) PRIMARY KEY,
MoTa TEXT NOT NULL
);
alter TABLE	 KichCo
CHANGE KiHieu Size VARCHAR(5) ;

alter TABLE Loaihang DROP COLUMN NgayTao;



  








