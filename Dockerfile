# Use the official Apache Airflow image
FROM apache/airflow:2.3.0

# Set the Airflow user
USER root

# Copy the requirements file into the container
COPY requirements.txt .

# Install Python packages from requirements file
RUN pip install --no-cache-dir -r requirements.txt

# Copy the initialization script into the container
COPY init_airflow.sh /usr/local/bin/init_airflow.sh

# Debugging: List contents of /usr/local/bin to confirm the script is copied
RUN ls -l /usr/local/bin

# Make the script executable
RUN chmod +x /usr/local/bin/init_airflow.sh

# Debugging: List contents of /usr/local/bin to confirm the script is executable
RUN ls -l /usr/local/bin

# Expose necessary ports (default: 8080)
EXPOSE 8080

# Set the entrypoint to use the initialization script
ENTRYPOINT ["/usr/local/bin/init_airflow.sh"]

# Switch back to the Airflow user
USER airflow
