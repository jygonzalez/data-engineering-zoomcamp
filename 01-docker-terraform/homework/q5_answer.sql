-- top 3 pickup locations with over 13,000 in total_amount (across all trips) for 2019-10-18
WITH temp_table AS (
	SELECT 
		CONCAT(zpu."Borough", ' | ', zpu."Zone") AS "pickup_location",
		SUM(total_amount) AS "date_total"
	FROM 
		green_taxi_trips t
		JOIN zones zpu ON t."PULocationID" = zpu."LocationID"
	WHERE 
		t.lpep_pickup_Datetime >= '2019-10-18' AND t.lpep_pickup_Datetime < '2019-10-19'
	GROUP BY 
		pickup_location
	ORDER BY 
		date_total DESC
)

SELECT 
	t.pickup_location,
	CONCAT('$', to_char(t.date_total, '999,999.00')) as total
FROM 
	temp_table t 
WHERE 
	date_total > 13000

	