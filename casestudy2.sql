-- using SQL Server

-- 1.Total revenue for the current year
select sum(net_revenue)
from Customers.dbo.casestudy
group by year 
order by year
--The total revenue for the current year(2017) is 31417495.0300001
--The total revenue for the current year(2016) is 25730943.5900001
--The total revenue for the current year(2017) is 29036749.19

-- 2.New Customer Revenue 
-- for year 2017
select sum(net_revenue)
from Customers.dbo.casestudy
where customer_email not in (select customer_email from  Customers.dbo.casestudy where year ='2016')
and year ='2017'
-- for year 2016
select sum(net_revenue)
from Customers.dbo.casestudy
where customer_email not in (select customer_email from  Customers.dbo.casestudy where year ='2015')
and year ='2016';

--New Customer Revenue for 2017 is 21769213.01, for 2016 is 17206366.9.

-- 3.Existing Customer Growth
select sum(net_revenue) as existingrevenue2017
from Customers.dbo.casestudy
where customer_email in (select customer_email from Customers.dbo.casestudy where year ='2016')
group by year having year='2017'

select sum(net_revenue) as existingrevenue2016
from Customers.dbo.casestudy
where customer_email in (select customer_email from Customers.dbo.casestudy where year ='2015')
group by year having year='2016'

select 9648282.02000003-8524576.68999998 as Existing_customer_growth2017
-- Existing Customer Growth for year 2017 is 9648282.02000003-8524576.68999998= 1123705.33000005
-- For here, we can only calculate the Existing Customer Growth for year 2017 because we don't know the
-- existing revenue in year 2015, so we cannot get the Existing Customer Growth for 2016.


-- 4. Revenue lost from attrition
-- Here, we define the  Revenue lost from attrition is the customers who bought goods last year but don't buy
-- goods current year, and the lost is the value of goods they bought last year.

-- for year 2017
select sum(net_revenue) as lost_from_attrition2017
from Customers.dbo.casestudy
where year ='2016' and customer_email not in (select customer_email from Customers.dbo.casestudy where year='2017')

-- for year 2016
select sum(net_revenue) as lost_from_attrition2016
from Customers.dbo.casestudy
where year ='2015' and customer_email not in (select customer_email from Customers.dbo.casestudy where year='2016')

-- Thus, the revenue lost from attrition in 2017 is 16146518.63, in 2016 is 20551216.15.

-- 5.Existing Customer Revenue Current Year
select sum(net_revenue) as existingrevenue2017
from Customers.dbo.casestudy
where customer_email in (select customer_email from Customers.dbo.casestudy where year ='2016')
group by year having year='2017'

select sum(net_revenue) as existingrevenue2016
from Customers.dbo.casestudy
where customer_email in (select customer_email from Customers.dbo.casestudy where year ='2015')
group by year having year='2016'

-- The existing customer revenue for year 2017 is 9648282.02000002, and for year 2016 is 8524576.69.

-- 6.Existing Customer Revenue Prior Year
select sum(net_revenue) as existingrevenue2016
from Customers.dbo.casestudy
where customer_email in (select customer_email from Customers.dbo.casestudy where year ='2015')
group by year having year='2016'
-- For year 2017, the prior year is 2016, and the 2016 existing customer revenue is 8524576.69.

-- 7.Total Customers Current Year
 select count(distinct customer_email) as customers2017
 from Customers.dbo.casestudy
 where year ='2017'

 select count(distinct customer_email) as customers2016
 from Customers.dbo.casestudy
 where year ='2016'

 select count(distinct customer_email) as customers2015
 from Customers.dbo.casestudy
 where year ='2015'

 --The total customers for current year 2017 is 249987£¬for year 2016 is 204646, for year 2015 is 231294.

 -- 8.Total Customers Previous Year
 select count(distinct customer_email) as customers2016
 from Customers.dbo.casestudy
 where year ='2016'

 select count(distinct customer_email) as customers2015
 from Customers.dbo.casestudy
 where year ='2015'
 --Thus, for year 2017, the previous year is 2016, the total customers is 204646.
 -- for year 2016, the previous year is 2015, the total customers is 231294.

 -- 9.New Customers
 -- for year 2017
 select sum(case when year ='2017' then 1 else 0 end) as customernumber2017
 from Customers.dbo.casestudy 
 where customer_email not in (select customer_email from Customers.dbo.casestudy where year ='2016')
 

 select top 10 customer_email as new_customer2017
 from Customers.dbo.casestudy
 where year ='2017' and customer_email not in (select customer_email from Customers.dbo.casestudy where year ='2016')
 
 -- The total number of new customers for 2017 is 173449 and the top 10 of new customers is below.
 /*
fuyjaexmoh@gmail.com
qvjfterwnk@gmail.com 
uxilnjipqh@gmail.com
bcxekwoaor@gmail.com
zhlvymbfwx@gmail.com
fdkiioqtli@gmail.com
vcihdhamko@gmail.com
mqptqupwfa@gmail.com
zxdpwkylvf@gmail.com
vpsfdhgrfo@gmail.com */

-- for year 2016
  select sum(case when year ='2016' then 1 else 0 end) as customernumber2016
 from Customers.dbo.casestudy 
 where customer_email not in (select customer_email from Customers.dbo.casestudy where year ='2015')

 select top 10 customer_email as new_customer2016
 from Customers.dbo.casestudy
 where year ='2016' and customer_email not in (select customer_email from Customers.dbo.casestudy where year ='2015')
  -- The total number of new customers for 2016 is 136891 and the top 10 of new customers is below.
 /* 
mwrossuukz@gmail.com
gkwsoupawk@gmail.com
vlyigtgfzs@gmail.com
yfirychuhk@gmail.com
trnzgqinuu@gmail.com
hhxxpwlakg@gmail.com
xshhioxkjs@gmail.com
xypcivocfw@gmail.com
hoyilazseb@gmail.com
dkbsemibna@gmail.com */

-- 10.Lost Customers
-- for year 2017
select sum(case when year='2016' then 1 else 0 end) as customerlost_number2017
from Customers.dbo.casestudy 
where customer_email not in (select customer_email from Customers.dbo.casestudy where year ='2017')

select top 10 customer_email as customerlost_2017
from Customers.dbo.casestudy
where year ='2016' and customer_email not in (select customer_email from Customers.dbo.casestudy where year ='2017')
-- for year 2017, the number of lost customers is 128108, and the top 10 of the lost customers is below.
/*
gkwsoupawk@gmail.com
trnzgqinuu@gmail.com
hhxxpwlakg@gmail.com
lfeafnigbu@gmail.com
cemerinvsn@gmail.com
wkgndosxgd@gmail.com
xshhioxkjs@gmail.com
ujelzbtqer@gmail.com
gmsayrrlrm@gmail.com
whnnmusxsc@gmail.com
*/

--for year 2016
select sum(case when year='2015' then 1 else 0 end) as customerlost_number2016
from Customers.dbo.casestudy 
where customer_email not in (select customer_email from Customers.dbo.casestudy where year ='2016')

select top 10 customer_email as customerlost_2016
from Customers.dbo.casestudy
where year ='2015' and customer_email not in (select customer_email from Customers.dbo.casestudy where year ='2016')
-- for year 2016, the number of lost customers is 163539, and the top 10 of the lost customers is below.
/*
sxabypbfhj@gmail.com
cyksxkrbby@gmail.com
fosfxhsnqg@gmail.com
yuozotbyus@gmail.com
lrafxvxavj@gmail.com 
zufomelpjp@gmail.com
ihvfzxfjyd@gmail.com
nhknapwsbx@gmail.com
irvstayzjd@gmail.com
jawkygcvwx@gmail.com
*/
