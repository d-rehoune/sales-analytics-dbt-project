FROM apache/airflow:3.1.7-python3.11

USER airflow

COPY requirements.txt /

RUN pip install --no-cache-dir -r /requirements.txt \
    && pip install --no-cache-dir dbt-bigquery==1.7.5