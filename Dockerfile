# Use the official Airflow image as the base image
FROM apache/airflow:2.10.4

# Set the working directory
WORKDIR /

# Copy the requirements file into the container
COPY requirements.txt .

# Install the dependencies from the requirements file
RUN pip install -r requirements.txt

# Copy the entrypoint script into the container
COPY entrypoint.sh .

# Make the entrypoint script executable
RUN chmod +x entrypoint.sh

# Set the entrypoint script as the default command
ENTRYPOINT ["./entrypoint.sh"]
