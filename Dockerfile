# Use the official Apache Airflow image
FROM apache/airflow:2.3.0

# Set the Airflow user
USER airflow

# Copy the requirements file into the container
COPY requirements.txt .

# Install Python packages from requirements file
RUN pip install --no-cache-dir -r requirements.txt

# Expose necessary ports (default: 8080)
EXPOSE 8080

# Set the entrypoint to use the Airflow command
ENTRYPOINT ["airflow"]

# Set default command to start the webserver
CMD ["webserver"]
