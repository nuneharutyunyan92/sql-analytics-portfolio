--Հյուրանոցի տեսակներ(Resort Hotel,City Hotel)
SELECT 
*
FROM analytics.hotels;

--Սննդի տեսակներ(1,4-no meal,FB -fuul,BB-breakfast,HB-half board)
SELECT 
*
FROM analytics.meals;


--Երկրներ
SELECT 
*
FROM analytics.countries;

--Չեղարկվածների քանակը(canceled-44224,not canceled-75166)

SELECT 
	hotel_name,
    is_canceled, 
    COUNT(*) as count
FROM analytics.v_final_project_analysis
GROUP BY is_canceled,hotel_name;

-- Գտնել ամենաշատ ամրագրումներ ունեցող ամիսը(August - 8638)
SELECT 
    arrival_date_month,
    COUNT(*) as total_bookings
FROM analytics.v_final_project_analysis
WHERE is_canceled = 0 
GROUP BY arrival_date_month
ORDER BY total_bookings DESC
LIMIT 1;


--Գտնել ամենաշատ ամրագրումներ ունեցող հյուրանոցը(City Hotel 46228 )

SELECT 
	hotel_name,
    COUNT(*) as booking_count
FROM analytics.v_final_project_analysis
WHERE is_canceled = 0 
GROUP BY hotel_name
ORDER BY booking_count DESC
LIMIT 1;



--Ամենաշատ ընտրված սննդի փաթեթները("BB"	57800)

SELECT 
	meal_type,
    COUNT(*) as meal_count
FROM analytics.v_final_project_analysis
WHERE is_canceled = 0 
GROUP BY meal_type
ORDER BY meal_count DESC
LIMIT 1;


--Revenue

SELECT
	hotel_name,
	SUM(adr) as total_revenue
FROM analytics.v_final_project_analysis
WHERE is_canceled = 0 
GROUP BY hotel_name
ORDER BY total_revenue DESC;

--Ամենաշատը,որ երկրից են գալիս


SELECT 
    country, 
    SUM(stays_in_weekend_nights + stays_in_week_nights) AS total_nights_spent,
	SUM(adr) as total_revenue,
    COUNT(*) AS total_bookings
FROM analytics.hotel_bookings
WHERE is_canceled = 0 
  AND country IS NOT NULL
GROUP BY country
ORDER BY total_revenue DESC
LIMIT 10;

--Կրկնվող հյուրեր(3810)

SELECT 
	--country,
 	COUNT (*) is_repeated_guest
FrOM analytics.hotel_bookings
WHERE is_repeated_guest = 1
--GROUP BY country 
--ORDER BY is_repeated_guest DESC
;
