# Use the official Airflow image as the base image
FROM apache/airflow:2.10.4

# Set the working directory
WORKDIR /usr/local/airflow

# Copy the requirements file into the container
COPY requirements.txt .

# Install the dependencies from the requirements file
RUN pip install -r requirements.txt

# Create the airflow user and group
RUN groupadd -r airflow && useradd -r -g airflow airflow

# Copy the entrypoint script into the container
COPY entrypoint.sh /usr/local/airflow/entrypoint.sh

# Change the ownership of the entrypoint script
RUN chown airflow:airflow /usr/local/airflow/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /usr/local/airflow/entrypoint.sh

# Set the entrypoint script as the default command
ENTRYPOINT ["/usr/local/airflow/entrypoint.sh"]
