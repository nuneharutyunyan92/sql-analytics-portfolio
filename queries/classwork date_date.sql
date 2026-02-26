SELECT
  order_date_date,
    (DATE_PART('year', CURRENT_DATE) - DATE_PART('year', order_date_date)) * 12
  + (DATE_PART('month', CURRENT_DATE) - DATE_PART('month', order_date_date))
  - CASE
      WHEN DATE_PART('day', CURRENT_DATE)
        < DATE_PART('day', order_date_date)
      THEN 1 ELSE 0
  END AS full_months
FROM sales_analysis
ORDER BY order_date_date DESC
LIMIT 10;




SELECT
	DATE_TRUNC('month',order_date_date) AS month

FROM sales_analysis;

SELECT
	DATE_TRUNC('quarter',order_date_date) AS quarter

FROM sales_analysis;

SELECT
	SUM(total_sales) as total_revenue,
	DATE_TRUNC('month',order_date_date) AS month
	FROM sales_analysis
	GROUP BY DATE_TRUNC('month',order_date_date)
	ORDER BY total_revenue DESC
	LIMIT 3;


	SELECT
	SUM(total_sales) as total_revenue,
	DATE_TRUNC('quarter',order_date_date) AS quarter
	FROM sales_analysis
	GROUP BY DATE_TRUNC('quarter',order_date_date)
	ORDER BY total_revenue DESC;

	
SELECT
  order_date_date,
  CURRENT_DATE - order_date_date AS days_since_transaction
FROM sales_analysis
	ORDER BY days_since_transaction DESC ;


	SELECT
  COUNT(*) AS recent_transactions
FROM sales_analysis
WHERE order_date_date >= CURRENT_DATE - INTERVAL '60 days';