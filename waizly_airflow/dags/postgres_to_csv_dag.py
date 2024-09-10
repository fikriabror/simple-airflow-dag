from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.hooks.postgres_hook import PostgresHook
import pandas as pd
from datetime import datetime

# Define the function to extract data from PostgreSQL and save it to a CSV
def postgres_to_csv():
    # Initialize Postgres hook with the connection ID
    pg_hook = PostgresHook(postgres_conn_id='local_postgres')
    
    # Define your SQL query
    sql = "SELECT * FROM telecom_customer_churn;"
    
    # Run the query and fetch the results
    df = pg_hook.get_pandas_df(sql)
    
    # Save the results to a CSV file
    df.to_csv('/opt/airflow/data/telecom_output_file.csv', index=False)

# Define the default arguments
default_args = {
    'owner': 'fikri',
    'start_date': datetime(2024, 9, 10),
    'retries': 1,
}

# Define the DAG
with DAG(
    dag_id='postgres_to_csv_dag',
    default_args=default_args,
    schedule_interval='@daily',  # or any other schedule you prefer
    catchup=False,
) as dag:

    # Define the task
    extract_to_csv = PythonOperator(
        task_id='extract_postgres_to_csv',
        python_callable=postgres_to_csv,
    )

# Set the task sequence
extract_to_csv
