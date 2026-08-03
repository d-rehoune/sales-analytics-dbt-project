# Étape 1 : Base image Airflow
FROM apache/airflow:3.1.7-python3.11

# Étape 2 : Définir l'utilisateur pour Airflow - Installer dbt + clients BigQuery
USER airflow
RUN pip install --no-cache-dir dbt-bigquery==1.7.5

# Étape 3 : Installer les dépendances Airflow additionnelles 
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Étape 4 : Copier le code Airflow et dbt dans le conteneur 
COPY dags/ /opt/airflow/dags/
COPY dbt/ /opt/airflow/dbt/