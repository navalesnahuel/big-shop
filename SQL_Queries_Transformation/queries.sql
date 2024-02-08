1) Gender Distribution

SELECT 
SUM(CASE WHEN Gender = 'M' THEN 1 ELSE 0 END) AS Total_Men,
SUM(CASE WHEN Gender = 'F' THEN 1 ELSE 0 END) AS Total_Woman
FROM CustomerData;

2) Products sales per category

Select product_category, sum(quantity) as total_products
from customerdata
group by product_category
order by total_products desc

3) Ammount of purchases by location

SELECT location, count(location) as purchases
FROM CustomerData
group by location
order by purchases desc

4) Monthly Online Shopping Activity

select EXTRACT(MONTH FROM date) as month,
count(EXTRACT(MONTH FROM date)) as Month_activity
from customerdata
group by month
order by month_activity desc

5) Total sales quantity by month

select 
to_char(transaction_date, 'YYYY-MM') as transaction_date, sum(quantity) as total_products_sold
from customerdata
group by to_char(transaction_date, 'YYYY-MM')
order by transaction_date

6) Highest price purchase by customerid

select customerid, max(avg_price + delivery_charges) as product_price
from customerdata
group by customerid
order by product_price desc
limit 25

7) Purchase count by CustomerID

select customerid, sum(quantity) as quantity_purchased
from customerdata
group by customerid
order by quantity_purchased desc
limit 10

8) Tenure Months Count 

select tenure_data, count(customerid) from
	(select 
		customerid,
		case
			WHEN tenure_months <= 6 THEN '0-6 Months'
			WHEN tenure_months > 6 AND tenure_months <= 12 THEN '6-12 Months'
			WHEN tenure_months > 12 AND tenure_months <= 18 THEN '12-18 Months'
			WHEN tenure_months > 18 AND tenure_months <= 24 THEN '18-24 Months'
			WHEN tenure_months > 24 AND tenure_months <= 36 THEN '24-36 Months'
			WHEN tenure_months > 36 AND tenure_months <= 48 THEN '36-48 Months'
			WHEN tenure_months > 48 THEN '48+ Months'
	end as tenure_data
	from customerdata) a
group by tenure_data
order by tenure_data asc

9) Average Products Price

select avg(avg_price + delivery_charges) as avg_product_price
from customerdata

10) Total Spend by month

SELECT 
EXTRACT(MONTH FROM date) as month,
SUM(offline_spend + online_spend) AS total_spend
from customerdata
group by EXTRACT(MONTH FROM date)
order by month asc

11) Online Spend by month

SELECT 
EXTRACT(MONTH FROM date) as month,
SUM(online_spend) AS total_online_spend
from customerdata
group by EXTRACT(MONTH FROM date)
order by month ASC

12) Offline Spend by month

SELECT 
EXTRACT(MONTH FROM date) as month,
SUM(offline_spend) AS total_offline_spend
from customerdata
group by EXTRACT(MONTH FROM date)
order by month asc

13) Coupon Analisis

select coupon_status, count(customerid)
from customerdata
group by coupon_status

14) Coupon List
select coupon_code, discount_pct, count(customerid) as uses
from customerdata
where coupon_code is not null or discount_pct is not null
group by coupon_code, discount_pct
order by uses desc





