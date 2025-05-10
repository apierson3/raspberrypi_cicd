from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.operators.bash import BashOperator
from datetime import datetime

def my_python_function():
    """Prints a simple message to the logs."""
    print("Hello from the PythonOperator!")

with DAG(
    dag_id='test_dag',
    schedule_interval='0 0 * * *',  # Run once a day at midnight
    start_date=datetime(2023, 1, 1),  # Adjust this to a past date
    catchup=False,  # Do not run for past missed schedules
    tags=['example'],
) as dag:
    python_task = PythonOperator(
        task_id='python_hello',
        python_callable=my_python_function,
    )

    bash_task = BashOperator(
        task_id='bash_hello',
        bash_command='echo "Hello from the BashOperator!"',
    )

    python_task >> bash_task