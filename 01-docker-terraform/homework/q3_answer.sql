SELECT
    CASE
        WHEN trip_distance <= 1 THEN 'Up to 1 mile'
        WHEN trip_distance > 1 AND trip_distance <= 3 THEN '1~3 miles'
        WHEN trip_distance > 3 AND trip_distance <= 7 THEN '3~7 miles'
        WHEN trip_distance > 7 AND trip_distance <= 10 THEN '7~10 miles'
        ELSE '10+ miles'
    END AS segment,
    to_char(count(1), '999,999') AS num_trips
FROM
    green_taxi_trips
WHERE
    lpep_pickup_datetime >= '2019-10-01'
    AND lpep_pickup_datetime < '2019-11-01'
    AND lpep_dropoff_datetime >= '2019-10-01'
    AND lpep_dropoff_datetime < '2019-11-01'
GROUP BY
    segment