SELECT 
    *, 
    SQRT(mean_squared_error) AS eval_rmse
FROM
    ML.EVALUATE(MODEL nyc_taxi_cabs.model_1)