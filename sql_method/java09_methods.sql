-- 1. Viết phương thức liệt kê các mặt hàng
delimiter $$
	create PROCEDURE getItems()
    begin 
		-- code
		SELECT * from mathang;
    end $$
 delimiter ;
 
 call getItems();
 
 

-- 2. Viết phương thức liệt kê tên các mặt hàng theo loại hàng
delimiter $$
	create PROCEDURE getItemsById(p_id int)
    begin 

		SELECT * from mathang where maloai=p_id;
    end $$
 delimiter ;
call getItemsById(2);

-- 3. Viết phương thức thêm n rows dữ liệu test cho bảng LoaiHang
--   1  R1 || 3  R3
--   2  R2 || 4  R4
--   5  R5 || n  R5
select * from loaihang;
delimiter $$
	create PROCEDURE addGroupitems(nors int)
    begin 
		declare rowId int default 1;
        declare maxid int default (select max(maloai) from loaihang);
        -- set rowId = 1;
        
		
		while rowId <=nors do 
        insert into loaihang(maloai, tenloai)
        select maxId +rowId, concat("content",maxId +rowId);
        set rowId = rowId+1;
        end while;
    end $$
 delimiter ;
 select * from loaihang;
 call addGroupitems(12);
 


-- 4. Viết phương thức liệt kê các phần tử chẵn nhỏ hơn 10
 -- lable_signature:
  delimiter $$
	create PROCEDURE getEvenNumbers(p_digit int)
    begin 
	 -- n = 5 => 2 4 
     declare i int default 0;
     declare result VARCHAR (255) default '';
     while (i< p_digit) do
		if (i % 2 = 0) then 
			set result = concat(result,' ',i);
        END IF;
        set i =i+1;
     end while;
     select result as Even_numbers;
    end $$
 delimiter ;
  call getEvenNumbers(10);
  
  -- b 
  delimiter $$
	create PROCEDURE getEvenNumbersLoop(p_digit int)
    begin 

     declare i int default 0;
     declare result VARCHAR (255) default '';
		
        loop_label:loop -- while(true)
        
        if i = p_digit then 
			leave loop_label; -- = break
        end if ;
			set result = concat(result,' ',i);
			set i =i+2;
        end loop;
     select result as Even_numbers;
    end $$
 delimiter ;
 
 call getEvenNumbers(13);
-- 5. Viết phương thức liệt kê các phần tử chẵn nhỏ hơn 10
delimiter $$
	create PROCEDURE isPrimeNumbers(p_input int)
    begin 
	declare is_prime bit(1) default 1;
     declare i int default 2;
     declare result VARCHAR (255) default '';
    
		if p_input < 2 then 
			set is_prime = 0 ;
        else 
			while_label:while i <= sqrt(p_input) do
					if(p_input) mod i = 0 then
						set is_prime=0;
						leave while_label;   
                    end if;
                    set i = i+1;
			end while;
         end if;   
         select case 
			when is_prime = 0 then concat(p_input,' khong phai la so nguyen to') 
            else concat(p_input,'la so nguyen to')
          end as Is_Prime;   
         end $$
 delimiter ;
 
 call isPrimeNumbers(49)

   