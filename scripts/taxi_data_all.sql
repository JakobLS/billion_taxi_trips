CREATE OR REPLACE TABLE
    nyc_taxi_cabs.taxi_data_all AS
SELECT
    (fare_amount + tolls_amount) AS total_amount,
    pickup_datetime AS pickup_time,
    dropoff_datetime AS dropoff_time,
    DATETIME_DIFF(dropoff_datetime, pickup_datetime, MINUTE) AS trip_duration,
    pickup_longitude,
    pickup_latitude,
    dropoff_longitude,
    dropoff_latitude,
    ROUND(trip_distance * 1.609344, 2) AS trip_distance, # Convert to km
    rate_code,
    passenger_count
FROM
    `nyc-tlc.yellow.trips`
WHERE
    fare_amount > 0 
    AND fare_amount <= 500
    AND tolls_amount BETWEEN 0 AND 25
    AND DATETIME_DIFF(dropoff_datetime, pickup_datetime, MINUTE) > 0
    AND DATETIME_DIFF(dropoff_datetime, pickup_datetime, MINUTE) <= 180
    AND NOT (pickup_latitude < 40.55 AND pickup_longitude > -73.9)
    AND NOT (dropoff_latitude < 40.55 AND dropoff_longitude > -73.9)
    AND (pickup_longitude BETWEEN -76 AND -73)
    AND (dropoff_longitude BETWEEN -76 AND -73)
    AND (pickup_latitude BETWEEN 40 AND 42)
    AND (dropoff_latitude BETWEEN 40 AND 42)
    AND passenger_count BETWEEN 1 AND 6
    AND trip_distance > 0
    AND ROUND(trip_distance * 1.609344, 2) < 160
    AND rate_code IN ('1', '2', '3', '4', '5')
    AND passenger_count BETWEEN 1 AND 6
ORDER BY dropoff_time ASC;