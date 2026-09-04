select store_id, year, month, monthly_sales,
lag(monthly_sales) over(partition by store_id order by year, month) as previous_month_sale
from retail_sale2;

with sale_data as(
select store_id, month, year, monthly_sales,
lag(monthly_sales) over(partition by store_id order by year, month) as previous_month_sale
from retail_sale2
)
select store_id, month, monthly_sales, previous_month_sale,
monthly_sales - previous_month_sale as sale_change
from sale_data;

with sale_data as(
select store_id, month, year, monthly_sales,
lag(monthly_sales) over(partition by store_id order by year, month) as previous_month_sale
from retail_sale2
)
select store_id, month, monthly_sales, previous_month_sale
from sale_data
where monthly_sales > previous_month_sale;

with sale_data as(
select store_id, month, year, monthly_sales,
lag(monthly_sales) over(partition by store_id order by year, month) as previous_month_sale
from retail_sale2
)
select store_id, month, monthly_sales, previous_month_sale,
(monthly_sales - previous_month_sale)/ previous_month_sale * 100 as percent_change
from sale_data;

select store_id, year, month, monthly_sales,
lag(monthly_sales, 2) over (partition by store_id order by year, month) as sales_2_months_ago
from retail_sale2;

select store_id, year, month, monthly_sales,
lag(monthly_sales, 1) over (partition by store_id order by year, month) as previous_month_sale
from retail_sale2;

with sale_data as(
select store_id, month, year, monthly_sales,
lag(monthly_sales) over(partition by store_id order by year, month) as previous_month_sale
from retail_sale2
),
change_data as 
	(select store_id, month, monthly_sales, previous_month_sale,
	monthly_sales - previous_month_sale as sale_change
	from sale_data
)
select store_id, max(sale_change) as largest_increase
from change_data
group by store_id;

with sale_data as(
select store_id, month, year, monthly_sales,
lag(monthly_sales) over(partition by store_id order by year, month) as previous_month_sale
from retail_sale2
),
change_data as 
	(select store_id, month, monthly_sales, previous_month_sale,
	monthly_sales - previous_month_sale as sale_change
	from sale_data
)
select store_id, min(sale_change) as largest_decrease
from change_data
group by store_id;

