# Use the official Airflow image as the base image
FROM apache/airflow:2.10.4

# Set the working directory
WORKDIR /usr/local/airflow

# Copy the requirements file into the container
COPY requirements.txt .

# Install the dependencies from the requirements file
RUN pip install -r requirements.txt

# Create the airflow user and group
# RUN groupadd -r airflow && useradd -r -g airflow airflow

# Copy the entrypoint script into the container
# COPY --chmod=755 entrypoint.sh /usr/local/airflow/entrypoint.sh

# Copy the docker compose script into the container
# COPY --chmod=755 docker-compose.yml /usr/local/airflow/docker-compose.yml

# RUN docker-compose up airflow-init

# Make the entrypoint script executable
# RUN chmod +x /usr/local/airflow/entrypoint.sh

# Set the entrypoint script as the default command
# ENTRYPOINT ["/usr/local/airflow/entrypoint.sh"]
