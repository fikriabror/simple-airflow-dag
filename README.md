# waizly-project

# Project Pipeline Documentation

## Environment

- **Operating System:** Mac OS M1 Apple Silicon chip
- **Pentaho Installation:** [Guide to Install Pentaho on Macbook M2 Apple Silicon](https://medium.com/@gabriella.mayang/how-to-install-and-open-pentaho-data-integration-on-macbook-m2-apple-silicon-4081c2875a02)
- **Dataset:** [Telecom Customer Churn Dataset from Kaggle](https://www.kaggle.com/datasets/shilongzhuang/telecom-customer-churn-by-maven-analytics)
- **Airflow:** Running inside Docker container
- **Database:** PostgreSQL
- **Output File Format:** CSV

## 1. Project Pipeline Using Pentaho

This project uses a local database and the CSV file `telecom_customer_churn.csv` from Kaggle's telecom data.

- **Objective:** Create a data pipeline with ETL (Extract, Transform, Load) process.
- **Process:** 
  - **Input:** Table from CSV
  - **Transformation:** Data is transformed and loaded into PostgreSQL
  - **Job Schedule:** Process the data daily at 12 AM
- **Files:**
  - **Transformation File:** `waizly_trf.ktr`
  - **Job File:** `waizly_job.kjb`

## 2. Project Pipeline Using Airflow

Airflow is used to pipeline data from PostgreSQL (local) to a CSV file using a Docker container. 

- **Running Airflow:**
  - Access the Airflow UI at [http://localhost:8080/](http://localhost:8080/)
  - Set up the connection to the database where the `telecom_customer_churn` data is inserted.
  - The output file will be stored inside the local container.

- **Copying File to Local Machine:**
  
  docker cp <container_id>:/opt/airflow/data/telecom_output_file.csv ~/Documents


## 3. Database query results from data ingestion in point 1 or point 2
Query result from pentaho processing jobs
The query cover 7 query models:
1. Overall Churn Rate
2. Customer Segmentation
3. Contract and Payment Analysis
4. Revenue and Charges Analysis
5. Service Usage Analysis
6. Geographic Analysis
7. Churn Reason Analysis
 It's all saved in the file waizly_churn_analysis.sql



# 4. Data analysis of the results from point 1/2/3 using Excel
Data analysis from csv file extracted using airflow DAG
Inside the file waizly_data_analysis.xlsx
 ```sh
