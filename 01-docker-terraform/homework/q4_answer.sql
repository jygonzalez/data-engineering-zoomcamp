-- pick up day with the longest trip distance
SELECT 
	CAST(t.lpep_pickup_datetime AS DATE) as "pickup_date",
	MAX(trip_distance) as "longest_trip"
FROM 
	green_taxi_trips t
GROUP BY 
	t.lpep_pickup_datetime
ORDER BY
	"longest_trip" DESC 
LIMIT 1;

	