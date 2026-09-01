select *
from retail_sale2;

select avg(monthly_sales) AS avg_mon, store_id
from retail_sale2
group by store_id
having avg_mon > 4000;

select sum(monthly_sales) AS total_mon, store_id
from retail_sale2
group by store_id
having total_mon > 50000;


select avg(foot_traffic) AS avg_traffic, store_id
from retail_sale2
group by store_id
having avg_traffic > 4000;

select avg(ad_spend) AS avg_ad, store_id 
from retail_sale2
group by store_id
having avg_ad > 15000;

select avg(returns_rate) AS avg_return, store_id 
from retail_sale2
group by store_id
having avg_return > 0.04;

SELECT store_id, COUNT(*) AS record_count
FROM retail_sale2
GROUP BY store_id
HAVING record_count > 10;

select avg(foot_traffic) AS avg_traffic, avg(monthly_sales) AS avg_mon, store_id
from retail_sale2
group by store_id
having avg_traffic > 4000 and
avg_mon > 4000;

select monthly_sales,
case
	when monthly_sales >= 4000 then "high"
    when monthly_sales >= 2000 then "medium"
    when monthly_sales <2000 then "low"
end as sales_category
from retail_sale2;


select foot_traffic,
case
	when foot_traffic >= 5000 then "high traffic"
    when foot_traffic >= 3000 then "medium traffic"
    when foot_traffic < 3000 then "low traffic"
end AS traffic_category
from retail_sale2;


select returns_rate,
case
	when returns_rate > 0.04 then "high returns"
    when returns_rate >= 0.03 then "medium returns"
    else "low returns"
end as return_category
from retail_sale2;

select ad_spend,
case
	when ad_spend >= 20000 then "high"
    when ad_spend >= 10000 then "medium"
    when ad_spend < 10000 then "low"
end as ad_spend_category
from retail_sale2;

select foot_traffic, monthly_sales,
CASE
    WHEN monthly_sales >= 4000
         AND foot_traffic >= 5000
        THEN 'Excellent'

    WHEN monthly_sales >= 4000
         OR foot_traffic >= 5000
        THEN 'Good'

    ELSE 'Needs Improvement'
END AS store_performance
from retail_sale2;


SELECT *
FROM retail_sale2
WHERE monthly_sales > (
    SELECT AVG(monthly_sales)
    FROM retail_sale2
);

select *
from retail_sale2
where foot_traffic >(
	select avg(foot_traffic)
	from retail_sale2
);

select *
from retail_sale2
where ad_spend > (
	select avg(ad_spend)
    from retail_sale2);
    

select store_id, monthly_sales
from retail_sale2
where monthly_sales = (
	select max(monthly_sales) 
    from retail_sale2
);


select store_id, monthly_sales
from retail_sale2
where monthly_sales = (
	select min(monthly_sales) 
    from retail_sale2
);

select *
from retail_sale2
where monthly_sales > (
	select max(monthly_sales)
    from retail_sale2
    where store_id = 1
);

select store_id, avg(monthly_sales) as avg_month_sale
from retail_sale2
group by store_id
having avg(monthly_sales) > (
	select avg(monthly_sales)
    from retail_sale2
    
);
