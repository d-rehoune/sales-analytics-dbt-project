from airflow import DAG
from airflow.providers.standard.operators.bash import BashOperator
from airflow.providers.standard.operators.empty import EmptyOperator
from datetime import datetime, timedelta

default_args = {
    'owner': 'airflow-dbt',
    'retries': 0,
    'retry_delay': timedelta(minutes=1),
}

with DAG(
    dag_id='dbt_pipeline_dag',
    default_args=default_args,
    description='Exécute la pipeline dbt',
    schedule="@daily",
    start_date=datetime(2025, 1, 1),
    catchup=False,
    tags=['dbt', 'bigquery', 'analytics-engineering']
) as dag:

    start = EmptyOperator(task_id="start")

    run_staging = BashOperator(
        task_id='run_staging',
        bash_command="cd /opt/airflow/dbt && dbt run --select staging --profiles-dir ./.dbt_profiles",
    )

    test_staging = BashOperator(
    task_id="test_staging",
    bash_command="cd /opt/airflow/dbt && dbt test --select staging --profiles-dir ./.dbt_profiles",
    )   

    run_intermediate = BashOperator(
        task_id='run_intermediate', 
        bash_command="cd /opt/airflow/dbt && dbt run --select intermediate --profiles-dir ./.dbt_profiles",
    )

    test_intermediate = BashOperator(
        task_id='test_intermediate',    
    bash_command="cd /opt/airflow/dbt && dbt test --select intermediate --profiles-dir ./.dbt_profiles",
    )

    run_marts = BashOperator(
        task_id='run_marts', 
        bash_command="cd /opt/airflow/dbt && dbt run --select marts --profiles-dir ./.dbt_profiles",    
    )

    test_marts = BashOperator(
        task_id='test_marts',   
        bash_command="cd /opt/airflow/dbt && dbt test --select marts --profiles-dir ./.dbt_profiles",
    )

    generate_docs = BashOperator(
        task_id='generate_docs',    
    bash_command="cd /opt/airflow/dbt && dbt docs generate --profiles-dir ./.dbt_profiles",
    )

    end = EmptyOperator(task_id="end")

    start >> run_staging >> test_staging >> run_intermediate >> test_intermediate >> run_marts >> test_marts >> generate_docs >> end

