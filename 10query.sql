use SPJTest

/*
1.مشخصات تولید کنندگانی که در شهری خاص(اصفهان) نیستند
*/
create PROCEDURE cnisfahan @city nvarchar(25)
As
select * from S where city <> @city
exec cnisfahan @city ='اصفهان'
/*
2.مشخصات پروژه هایی را بیابید که برای پروژه ای خاص (مرمت آثار باستانی) هستند
*/
create PROCEDURE Mproj @j# nvarchar(50)
As 
select * from J where  name = @j#
exec Mproj @j#='مرمت آثار باستانی'
/*
3. شهری پیش فرض یا اصفهان در نظر گرفته شودprocedureمشخصات تمام پروژه های شهری خاص برای مثال تهران و در این 
*/
create PROCEDURE cisfahan @city nvarchar(25) = 'اصفهان'
AS
select * from J where city = @city
exec cisfahan @city = 'تهران'
/*
هستند.4 j2 و برای پروژه  s1  را بیابید که تولید کنندگانشان p1تعداد فروش های محصول  
*/
create procedure countp1s1j2 @p# nvarchar(50), @s# nvarchar(50) , @j# nvarchar(50)
As
select count(*)as countall from SPJ where p#=@p# and  s#=@s# and j#=@j#
EXEC countp1s1j2  @p#='p1' , @s#='s1' , @j#='j2'
/*
5.لیستی از کد تولید کننده ها و میزان کل فروش هر تولید کننده
*/
create procedure sumqtys#
As
select s# , sum(qty) as s#sumqty from SPJ group by s#
exec sumqtys#
/*
6.کد تولید کنندگانی را بیابید که میانگین تولید بیش از عددی خاص یا 12000 کیلوگرم تولید داشته باشند
*/
create procedure  avgqtys#12000 @avgqty bigint
As
select s# from SPJ group by s# having avg(qty) < @avgqty
exec avgqtys#12000 @avgqty=12000 
/*
7.لیستی از پروژه ها تهیه کنید به طوری که بر اساس ترتیب صعودی نام و نزولی شهر مرتب شده باشند
*/
create procedure j#asccitydescname @asc nvarchar(50) , @desc nvarchar(50)
As
select * from J order by @asc asc,@desc desc
exec j#asccitydescname @asc = name , @desc =city
/*
8.لیستی از کد تولید کننده ها و محصولات و میزان کل آنها که برحسب تولید کننده گروهبندی شده باشند و بر حسب صعودی محصول مرتب شده است را تهیه کنید
*/
create procedure s#p#countall 
As
select s#,p#,sum(qty) from SPJ group by s#,p# order by s#
exec s#p#countall
/*
9.مشخصات پروژه هایی که در آنها عبارتی خاص به کار نرفته است را بیابید 
*/
create procedure projectnameno @word nvarchar (50)
As
select * from J where name NOT Like @word
exec projectnameno @word=N'مرمت%'
/*
10.لیستی از نام تولید کنندگان و پروژه ها تهیه کنید که تولیبد کننده محصولی را برای پروژه یی خاص تولید کرده باشد
*/
create procedure s#p#j @j# nvarchar(50)
As 
select distinct S.name ,P.name, J.name
from S,SPJ,J,P
where SPJ.s#=S.s# and P.p#=SPJ.p# and @j# = SPJ.j#
exec s#p#j @j#='مرمت آثار باستانی'

