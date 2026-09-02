WITH CTE_EXAMPLE AS(
	select avg(monthly_sales) as avg_month_sale
    from retail_sale2
)
SELECT *
FROM retail_sale2
where monthly_sales > (
	select avg_month_sale
    from CTE_EXAMPLE

);

WITH CTE_EXAMPLE AS(
	select store_id, sum(monthly_sales)  as total_monthly_sale
    from retail_sale2
    group by store_id
)
select *
from CTE_EXAMPLE
where total_monthly_sale > 50000;


with cte_example as(
	select avg(monthly_sales) avg_month_sale, store_id
	from retail_sale2
    group by store_id
)
select * 
from cte_example
order by avg_month_sale asc;

WITH cte_example AS (
    SELECT 
        store_id,
        AVG(monthly_sales) AS avg_month_sale,
        AVG(foot_traffic) AS avg_foot_traffic
    FROM retail_sale2
    GROUP BY store_id
)
SELECT *
FROM cte_example
WHERE avg_month_sale > (
    SELECT AVG(monthly_sales)
    FROM retail_sale2
)
AND avg_foot_traffic > (
    SELECT AVG(foot_traffic)
    FROM retail_sale2
);

with cte_example as(
	select store_id, sum(monthly_sales) as total_sale
	from retail_sale2
    group by store_id
    )
select *
from cte_example
order by total_sale desc
limit 5;

with cte_example as(
	select store_id, max(monthly_sales) as max_sale
    from retail_sale2
    group by store_id
)
select *
from cte_example
where max_sale > 100000;

with cte_example as(
	select store_id, sum(monthly_sales) as total_sale, avg(monthly_sales) as avg_sale
	from retail_sale2
    group by store_id
)
select *
from cte_example
where total_sale < 50000 
AND
avg_sale < 50000;
 
 
 with cte_example as(
	select store_id, sum(monthly_sales) as total_sale, sum(foot_traffic) as total_foot_traffic
	from retail_sale2
    group by store_id
 )
 select *
 from cte_example
  order by total_sale/ total_foot_traffic desc
 limit 5;
 
select monthly_sales,
rank() over(order by monthly_sales desc)
from retail_sale2;

with cte_example as
(
	select store_id, sum(monthly_sales)total_sale
	from retail_sale2
	group by store_id
)
select store_id, total_sale,
rank() over(order by total_sale desc) as sale_rank
from cte_example;

with cte_example as(
	select store_id, avg(monthly_sales) as avg_sale
    from retail_sale2
    group by store_id
)
select store_id, avg_sale,
rank() over(order by avg_sale desc) as sale_rank
from cte_example;

select store_id, monthly_sales,
rank() over(partition by month order by monthly_sales desc) as sale_rank
from retail_sale2
order by month, sale_rank;

with cte_example as(
	select year, store_id, sum(monthly_sales) as total_sale
    from retail_sale2
    group by year, store_id
)
select year, store_id, total_sale,
rank() over(partition by year order by total_sale desc) as sale_rank
from cte_example;

WITH ranked_stores AS (
    SELECT month, store_id, monthly_sales,
        RANK() OVER ( PARTITION BY month ORDER BY monthly_sales DESC) AS store_rank
    FROM retail_sale2
)
SELECT month, store_id, monthly_sales, store_rank
FROM ranked_stores
WHERE store_rank <= 3
ORDER BY month, store_rank;