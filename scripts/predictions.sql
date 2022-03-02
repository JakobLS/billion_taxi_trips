SELECT
    *,
    (predicted_total_amount - total_amount) AS prediction_error
FROM
  ML.PREDICT(MODEL nyc_taxi_cabs.model_all,
    (
    SELECT
      *
    FROM
      `nyc_taxi_cabs.taxi_data_all`
    LIMIT 1000000))