
//BẠN SỬA MÃNG BÊN DƯỚI, MỖI PHẦN TỬ LÀ MỘT KÍ TỰ TÍNH LUỐN KÍ TỰ TRẮNG NHÉ! BẠN CÓ THỂ THÊM NHIỀU PHẦN TỬ HƠN KHÔNG NHẤT THIẾT LÀ 28
//XEM KĨ VIDEO CỦA MÌNH HƠN Ở PHẦN NÀY NHÉ!

status="duminhphongadv"
var a=new Array(),n=""
a[1]='Đ';
a[2]='ơ';
a[3]='n';
a[4]=' ';
a[5]='g';
a[6]='i';
a[7]='ả';
a[8]='n';
a[9]='!';
a[10]=' ';
a[11]='V';
a[12]='ì';
a[13]=' ';
a[14]='A';
a[15]='N';
a[16]='H';
a[17]=' ';
a[18]='T';
a[19]='R';
a[20]='Ư';
a[21]='Ờ';
a[22]='N';
a[23]='G';
a[24]=' ';
a[25]='Đ';
a[26]='Ẹ';
a[27]='P';
a[28]=' ';
a[29]='T';
a[30]='R';
a[31]='A';
a[32]='I';
a[33]=' ';
a[34]='H';
a[35]='I';
a[36]='H';
a[37]='I';
a[38]='♥';


function one()
{
t=document.f.txt.value
j=t.length
if(j>0)
{
for(var i=1;i<=j;i++)
{
n=n+a[i]
if(i==38)
{
document.f.txt.value=""
n=""
}
}
}
document.f.txt.value=n
n=""
setTimeout("one()",1)
}
function s()
{
}
function on()
{
one()
}

        $(document).ready(function() {
            $('#k').hide();
            $('h1').click(function() {
                $('.active').removeClass('active');
                $('#k').slideUp('fast');
                if($(this).next('#k').is(':hidden') == true) {
                $(this).addClass('active');
                $(this).next('#k').slideDown('fast');
                }
            });
        });
					function Yeu()
					{
					$("#divResult").fadeOut(0);
					//PHẦN NÀY LÀ PHẦN HIỆN KHI BẠN BẤM "GỞI ĐI" LINK Ở SAU LÀ ICON MẶT CƯỜI XÓA BỎ CŨNG ĐƯỢC CÒN TEXT THÌ BẠN SỬA LẠI THEO Ý CỦA BẠN.
				
					$("#divResult").fadeIn(2000,function()
							{
							$("#divResult2").fadeOut(0);
							$("#divResult2").html("<p>ANH Trường : ♥ ỪA THÌ ANH BIẾT ANH ĐẸP TRAI ,EM NÓI VẬY THÌ ANH CŨNG ĐÀNH YÊU EM VẬY.<img src='http://duminhphongadv.com/files/assets/4.png'/></p></br>");
							$("#divResult2").fadeIn(2000,function()
									{
									$("#divResult3").fadeOut(0);
									$("#divResult3").html("<p>VẬY HÃY ĐỂ TRÁI TIM ANH THUỘC VỀ EM  NHÉ!  <img src='http://duminhphongadv.com/files/assets/5.png'/></p></br>");
									$("#divResult3").fadeIn(2000);
									}
								);
							}
						);
					}
				