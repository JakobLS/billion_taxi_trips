SELECT 
    *, 
    SQRT(loss) AS train_rmse
FROM
    ML.TRAINING_INFO(MODEL nyc_taxi_cabs.model_1)