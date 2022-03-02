SELECT
    total_amount,
    tip_amount,
    fare_amount,
    tolls_amount,
    pickup_datetime AS pickup_time,
    dropoff_datetime AS dropoff_time,
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
    ABS(MOD(FARM_FINGERPRINT(CAST(pickup_datetime AS STRING)), 10000)) = 1;