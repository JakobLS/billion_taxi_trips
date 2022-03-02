# Pickup hour
nyc_trips["pickup_hour"] = nyc_trips["pickup_time"].dt.hour

# Pickup day in the week (Monday = 0)
nyc_trips["day_of_week"] = nyc_trips["pickup_time"].dt.dayofweek

# Pickup month
nyc_trips["pickup_month"] = nyc_trips["pickup_time"].dt.month

# Pickup year
nyc_trips["pickup_year"] = nyc_trips["pickup_time"].dt.year

# Trip duration, in minutes
nyc_trips["trip_duration"] = np.round(((nyc_trips["dropoff_time"] - nyc_trips["pickup_time"]).dt.total_seconds() / 60), 0)