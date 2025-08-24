-- For the passengers picked up in October 2019 in the zone named "East Harlem North" which was the drop off zone that had the largest tip?
SELECT 
	zdo."Zone" AS "dropoff_zone",
	MAX(t.tip_amount) AS "max_tip"
FROM 
	green_taxi_trips t
	JOIN zones zpu ON t."PULocationID" = zpu."LocationID"
	JOIN zones zdo ON t."DOLocationID" = zdo."LocationID"
WHERE 
	t.lpep_pickup_Datetime >= '2019-10-01' AND t.lpep_pickup_Datetime < '2019-11-01' AND
	zpu."Zone" = 'East Harlem North'
GROUP BY 
	dropoff_zone
ORDER BY 
	max_tip DESC
LIMIT 1

	