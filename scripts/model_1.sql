CREATE OR REPLACE MODEL
    nyc_taxi_cabs.model_1 OPTIONS (model_type='linear_reg', 
                                   input_label_cols=['total_amount'],
                                   data_split_method="SEQ",
                                   data_split_col="dropoff_time") AS
SELECT
    total_amount,
    dropoff_time,
    trip_distance,
    rate_code,
    passenger_count
FROM
    nyc_taxi_cabs.taxi_data;