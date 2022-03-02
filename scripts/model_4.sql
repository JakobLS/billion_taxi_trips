CREATE OR REPLACE MODEL
    nyc_taxi_cabs.model_4 OPTIONS (model_type='linear_reg',
                                   input_label_cols=['total_amount'],
                                   data_split_method="SEQ",
                                   data_split_col="dropoff_time") AS
SELECT
    total_amount,
    dropoff_time,
    trip_distance,
    ROUND(ST_DISTANCE(ST_GEOGPOINT(pickup_longitude, pickup_latitude),
                      ST_GEOGPOINT(dropoff_longitude, dropoff_latitude)), 0) AS euclidean,
    rate_code,
    passenger_count,
    trip_duration,
    EXTRACT(HOUR FROM pickup_time) AS pickup_hour,
    EXTRACT(DAYOFWEEK FROM pickup_time) AS pickup_day,
    EXTRACT(MONTH FROM pickup_time) AS pickup_month,
    EXTRACT(YEAR FROM pickup_time) AS pickup_year,
    ML.FEATURE_CROSS(STRUCT(CAST(EXTRACT(DAYOFWEEK FROM pickup_time) AS STRING) AS pickup_day, 
                            CAST(EXTRACT(HOUR FROM pickup_time) AS STRING) AS pickup_hour)) AS day_hour,
    ML.FEATURE_CROSS(STRUCT(CAST(EXTRACT(MONTH FROM pickup_time) AS STRING) AS pickup_month, 
                        CAST(EXTRACT(HOUR FROM pickup_time) AS STRING) AS pickup_hour)) AS month_hour,
    pickup_longitude,
    pickup_latitude,
    dropoff_longitude,
    dropoff_latitude,
FROM
    nyc_taxi_cabs.taxi_data;