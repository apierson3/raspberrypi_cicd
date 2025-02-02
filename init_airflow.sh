#!/bin/bash

# Initialize the Airflow database
airflow db upgrade

# Start the Airflow webserver to keep the container running
exec airflow webserver
