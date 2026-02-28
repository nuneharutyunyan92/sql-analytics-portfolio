SELECT

	SUM(total_sales) AS total_revenue,
	EXTRACT (Month from order_date_date) AS month,
	EXTRACT (YEAR from order_date_date) AS year,
	EXTRACT (QUARTER  from order_date_date) AS quarter

FROM sales_analysis
GROUP BY EXTRACT (QUARTER  from order_date_date),
		EXTRACT (Month from order_date_date),
		EXTRACT (YEAR from order_date_date) 

ORDER BY total_revenue DESC
LIMIT 10;
-- strongest growth period 2021 tvakani 4rd kvartalum e dektember amsin 43986.56

SELECT

	SUM(total_sales) AS total_revenue,
	EXTRACT (Month from order_date_date) AS month,
	EXTRACT (YEAR from order_date_date) AS year,
	EXTRACT (QUARTER  from order_date_date) AS quarter

FROM sales_analysis
GROUP BY EXTRACT (QUARTER  from order_date_date),
		EXTRACT (Month from order_date_date),
		EXTRACT (YEAR from order_date_date) 

ORDER BY total_revenue 
LIMIT 5;
--weakest period 2023 tvakan 3rd quarter 9rd month 4264.64


SELECT
	
	customer_name,
	MAX(order_date_date) AS last_transaction_date,
	CURRENT_DATE - MAX(order_date_date) AS days_since_last,
	AGE(MAX(order_date_date)) AS recency
FROM sales_analysis
GROUP BY customer_name
ORDER BY days_since_last DESC
LIMIT 10;


	