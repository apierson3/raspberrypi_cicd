#!/bin/bash

# initialize the database
airflow db init

# Create an admin user if it doesn't already exist
airflow users create \
    --username admin \
    --firstname Admin \
    --lastname User \
    --role Admin \
    --email admin@example.com \
    --password admin

# Start the Airflow scheduler in the background
airflow scheduler &

# Start the Airflow web server in the foreground
exec airflow webserver
