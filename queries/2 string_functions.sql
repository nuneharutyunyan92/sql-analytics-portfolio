SELECT
	raw_phone,
	LENGTH (raw_phone) AS phone_length,
	TRIM(raw_phone) AS trimmed_phone,
	LENGTH(TRIM(raw_phone)) AS trimmed_length
FROM transactions_text_demo
GROUP BY raw_phone, LENGTH(TRIM(raw_phone));



SELECT
  raw_phone,
 TRIM(REGEXP_REPLACE(raw_phone, '[^0-9]', '', 'g')) AS trimmed_phone
FROM transactions_text_demo;



SELECT
	
 	raw_phone,
 TRIM(REGEXP_REPLACE(raw_phone, '[^0-9]', '', 'g')) AS trimmed_phone,
SUBSTRING(TRIM(REGEXP_REPLACE(raw_phone, '[^0-9]', '', 'g')),
length(TRIM(REGEXP_REPLACE(raw_phone, '[^0-9]', '', 'g')))-7) AS last_8_digits,
CONCAT('$',quantity*price) AS revenue_per_transaction
FROM transactions_text_demo;




SELECT
	TRIM(category_raw) AS category_clean,
	SUM(quantity*price) AS revenue
FROM transactions_text_demo
GROUP BY category_raw
ORDER BY revenue DESC;



SELECT
	TRIM(REGEXP_REPLACE(category_raw, '\([^)]*\)', '', 'g')) 
   AS category_clean,
	SUM(price*quantity) AS revenue_raw_category,
	COUNT(DISTINCT raw_phone) AS raw_unique_customers,
	COUNT(DiSTINCT SUBSTRING(TRIM(REGEXP_REPLACE(raw_phone, '[^0-9]', '', 'g')),
		length(TRIM(REGEXP_REPLACE(raw_phone, '[^0-9]', '', 'g')))-7 )) 
		AS clean_unique_customers
FROM transactions_text_demo
GROUP BY category_clean;


