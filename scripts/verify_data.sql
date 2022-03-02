SELECT
    MIN(total_amount) AS min_total_amount,
    MAX(total_amount) AS max_total_amount,
    MIN(trip_duration) AS min_trip_duration,
    MAX(trip_duration) AS max_trip_duration,
    MIN(pickup_longitude) AS min_pickup_longitude,
    MAX(pickup_longitude) AS max_pickup_longitude,
    MIN(pickup_latitude) AS min_pickup_latitude,
    MAX(pickup_latitude) AS max_pickup_latitude,
    MIN(dropoff_longitude) AS min_dropoff_longitude,
    MAX(dropoff_longitude) AS max_dropoff_longitude,
    MIN(dropoff_latitude) AS min_dropoff_latitude,
    MAX(dropoff_latitude) AS max_dropoff_latitude,
    MIN(trip_distance) AS min_trip_distance,
    MAX(trip_distance) AS max_trip_distance,
    MIN(rate_code) AS min_rate_code,
    MAX(rate_code) AS max_rate_code,
    MIN(passenger_count) AS min_passenger_count,
    MAX(passenger_count) AS max_passenger_count

FROM `level-library-342009.nyc_taxi_cabs.taxi_data_full`;