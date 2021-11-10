	select  lh.maloai,
			lh.tenloai,
			sum(kcmh.soluong) soluongmathang	
	from	loaihang lh
	join  	Mathang mh
			on lh.MaLoai = mh.MaLoai
	join 	kichcomathang kcmh
			on kcmh.MaMH = mh.mamh
	GROUP BY lh.MaLoai ;    
    
    -- create table chi tiet mat hang
    create table ChiTietMatHang(
    MaCTMH INT,
    NhaSanXuat varchar(255),
    ThongTin varchar(255),
    MaMH INT,
    Constraint PK_CTMH primary key (mactmh),
    Constraint FK_CHTMH_MH foreign key (mamh) references mathang(mamh)
    );
    INSERT into chitietmathang(MaCTMH, NhaSanXuat, ThongTin, MaMH)
    SELECT Mamh,
			concat('NSX ', Mamh),
			concat('TT', mamh),
            mamh
    from mathang;        
    
    
    