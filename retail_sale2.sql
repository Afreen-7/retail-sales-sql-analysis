SELECT *
FROM retail_sales_demo_data;

CREATE TABLE retail_sale2 AS
SELECT *
FROM retail_sales_demo_data;

SELECT *
FROM retail_sale2;

SELECT *
FROM retail_sale2
LIMIT 10;

select count(*)
from retail_sale2;


--DATA CLEANING--

SELECT *
FROM retail_sale2
where ad_spend is null
or ad_spend = '' ;

SELECT *
FROM retail_sale2
where promo_days is null
or promo_days = '';


SELECT *
FROM retail_sale2
WHERE store_id IS NULL
   OR year IS NULL
   OR month IS NULL
   OR month_index IS NULL
   OR is_holiday_month IS NULL
   OR ad_spend IS NULL
   OR foot_traffic IS NULL
   OR avg_price IS NULL
   OR staff_count IS NULL
   OR store_size_sqft IS NULL
   OR promo_days IS NULL
   OR competitors_within_3km IS NULL
   OR inventory_fill_rate IS NULL
   OR returns_rate IS NULL
   OR local_income_index IS NULL
   OR parking_spaces IS NULL
   OR store_age_years IS NULL
   OR monthly_sales IS NULL;
   
   
SELECT *
FROM retail_sale2
WHERE  ad_spend = '';
   
delete
FROM retail_sale2
WHERE  ad_spend = '';


SELECT COUNT(*) as monthly_sales
from retail_sale2;

select count(distinct foot_traffic) as monthly_sales 
from retail_sale2;

select count(*) as  total_record
from retail_sale2;

SELECT *
FROM retail_sale2;

select count(distinct store_id) as stores
FROM retail_sale2;

select distinct year
FROM retail_sale2
order by year;

SELECT SUM(monthly_sales) AS total_sales
FROM retail_sale2;


select round(avg(monthly_sales),2) as avg_month_sale
FROM retail_sale2;

select MIN(monthly_sales), max(monthly_sales)
FROM retail_sale2;

SELECT SUM(foot_traffic) AS total_foot_traffic
FROM retail_sale2;

select round(avg(foot_traffic),2) as avg_sale
FROM retail_sale2;


select round(avg(avg_price),2) as average_price
from retail_sale2;

select round(avg(staff_count),2) as staff
FROM retail_sale2;


select sum(monthly_sales)  as total_sale, store_id
from retail_sale2
group by store_id
order by total_sale desc
limit 10;

SELECT
    store_id,
    SUM(monthly_sales) AS total_sales
FROM retail_sale2
GROUP BY store_id
ORDER BY total_sales ASC
LIMIT 10;

SELECT
    store_id,
    AVG(monthly_sales) AS average_monthly_sales
FROM retail_sale2
GROUP BY store_id
ORDER BY average_monthly_sales DESC
LIMIT 1;

select sum(foot_traffic) as total_foot_traffic, store_id
from retail_sale2
group by store_id
order by total_foot_traffic desc
limit 1;

select *
from retail_sale2;

SELECT
    store_id,
    ROUND(
        SUM(monthly_sales) / AVG(staff_count),
        2
    ) AS sales_per_employee
FROM retail_sale2
GROUP BY store_id
ORDER BY sales_per_employee DESC
LIMIT 10;

select max(store_size_sqft) as lager_str_size, store_id
from retail_sale2
group by store_id
order by lager_str_size desc
limit 1;

select max(parking_spaces) as lager_pkr_size, store_id
from retail_sale2
group by store_id
order by lager_pkr_size desc
limit 1;

SELECT
    CASE
        WHEN MAX(store_size_sqft) < 2000 THEN 'Small'
        WHEN MAX(store_size_sqft) < 5000 THEN 'Medium'
        ELSE 'Large'
    END AS store_size_category,
    AVG(monthly_sales) AS average_sales
FROM retail_sale2
GROUP BY store_id
ORDER BY average_sales DESC;

select sum(monthly_sales) as total_sales, year
from retail_sale2
group by year;

select avg(monthly_sales) as avg_sales, year
from retail_sale2
group by year;

select sum(monthly_sales) as total_sales, year
from retail_sale2
group by year
order by total_sales desc
limit 1;


SELECT month, AVG(monthly_sales) AS average_sales
FROM retail_sale2
GROUP BY month
ORDER BY average_sales DESC
LIMIT 1;

SELECT month, AVG(monthly_sales) AS average_sales
FROM retail_sale2
GROUP BY month
ORDER BY average_sales ASC
LIMIT 1;

SELECT year, month, SUM(monthly_sales) AS total_sales
FROM retail_sale2
GROUP BY year, month
ORDER BY year, month;

select year, month, store_id, monthly_sales
from retail_sale2
order by monthly_sales desc
limit 1;

select year, month, store_id, monthly_sales
from retail_sale2
order by monthly_sales asc
limit 1;
