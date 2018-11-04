use SPJTest

/*
1.مشخصات تولید کنندگانی که در شهر اصفهان نیستند
*/
select * from S where city <>'اصفهان'
/*
2.مشخصات پروژه هایی را بیابید که برای مرمت آثار باستانی هستند
*/
select * from J where  name = 'مرمت آثار باستانی'
/*
3.مشخصات تمام پروژه های شهر اصفهان
*/
select * from J where city = 'اصفهان'
/*
هستند.4 j2 و برای پروژه  s1 را بیابید که تولید کنندگانشان p1 تعداد فروش های محصول 
*/
select count(*)as countall from SPJ where p#='p1' and s#='s1' and j#='j1' 
/*
5.لیستی از کد تولید کننده ها و میزان کل فروش هر تولید کننده
*/
select s# , sum(qty) as s#sumqty from SPJ group by s#
/*
6.کد تولید کنندگانی را بیابید که میانگین تولید بیش از 12000 کیلوگرم تولید داشته باشند
*/
select s# from SPJ group by s# having avg(qty)<12000
/*
7.لیستی از پروژه ها تهیه کنید به طوری که بر اساس ترتیب صعودی نام و نزولی شهر مرتب شده باشند
*/
select j#,city,name from J  order by city asc , name desc
/*
8.لیستی از کد تولید کننده ها و میزان کل تولید آنها که بر حسب نزولی مرتب شده است را تهیه کنید
*/
select s#,sum(qty) from SPJ group by s# order by sum(qty) desc 
/*
9.مشخصات پروژه هایی که در آنها عبارت مرمت به کار نرفته است را بیابید 
*/
select * from J where name NOT Like N'مرمت%' 
/*
10.لیستی از نام تولید کنندگان و پرو ژه ها تهیه کنید که تولیبد کننده محصولی را برای پروژه ی موردنظر تولید کرده باشد
*/
select distinct S.name ,P.name, J.name
from S,SPJ,J,P
where SPJ.s#=S.s# and SPJ.j# = J.j# and P.p#=SPJ.p#

