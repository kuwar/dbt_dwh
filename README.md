# Introduction

This is *Data Warehousing* project, designed to integrate *CSV* data from 
diverse source. 
The project employs *DBT* (Data Build Tool) to transform and
analyze the data,
creating a structured data mart for sales analysis.
The project is built using a *Madellion Architecture* approach,
which organizes the data into three layers: Bronze, Silver, and Gold.
The Bronze layer contains raw data, the Silver layer integrates and cleanses the data,
and the Gold layer presents the data in a business-friendly format.
The project is containerized using *Docker* and *docker-compose*,
allowing for easy deployment and management of the data pipeline.

---

# Root - Before running docker-compose up - initial project structure
```
├── config
│   └── postgres
│       └── postgresql.conf
├── CONTRIBUTING.md
├── dbt_project
├── dbt.Dockerfile
├── docker-compose.yml
├── init_dbt_project.sh
├── README.md
├── requirements.txt
└── RUN.sh
```
*NOTE:* To start your own project from scratch, use the tag v1.0.0 for scafolding.

---

# Understanding the Data

- [Source data catalog](/docs/RAW_DATA_CATALOG.md)
- [Data Mart (sales) catalog](/docs/SALES_DATAMART_CATALOG.md)

---

# What problem is solved

### Building the Data Warehouse (Data Engineering)

*Objective:*

- **Data Sources:** Import data from two source systems (ERP and CRM) provided as CSV files.
- **Data Quality:** Cleanse and resolve data quality issues prior to analysis.
- **Integration:** Combine both sources into a single, user-friendly data model designed for analytical queries.
- **Scope:** Focus on the latest dataset only; historization of data is not required.
- **Documentation:** Provide clear documentation of the data model to support both business stakeholders and analytics teams.

### Analytics & Reporting (Data Analysis)

*Objective:*

- **Data Mart:** Create a data mart for sales analysis, focusing on customer and product dimensions.
- Develop SQL-based analytics to deliver detailed insights into:
    - Customer Behavior
    - Product Performance
    - Sales Trends

These insights empower stakeholders with key business metrics, enabling strategic decision-making.

---

# How to run project

- From the root directory, run docker-compose up -d
- To run the dbt commands inside docker container
    - [DOCKER COMMANDS] [DBT COMMANDS]
    - e.g., docker-compose exec dbt dbt run
    - to generate documents
    ```bash
    docker-compose --profile docs up dbt-docs
    ```

---

# Tools and Technology used

- *Madellion Architecture* for *Data Modelling*
- Full Load i.e., truncate and load pattern is followed
- *DBT*
- Docker and docker-compose
- Postgres

---

# Data Warehouse Schemas
- Schemas => bronze, silver and gold
- Roles => data_engineer, data_analytics
- Role assignment to schema => data_engineer -> bronze, silver, gold & data_analytics -> silver, gold
- Users => shaurave, kuwar
- Role assigned to user => data_engineer -> shaurave, data_analytics -> kuwar

For managing user, roles and schema consider the file `config/postgres/dw_schema_medallion.sql`

**NOTE:** DBT will automatically prefixes all the schema with public_ in the database; e.g., public_bronze, public_silver, public_gold
- The schema public_ is the default schema in PostgreSQL, and it is automatically created when a new database is created.

---

# Contributing

- [Guide to contribution](docs/CONTRIBUTING.md)

---

# References
- https://www.youtube.com/watch?v=9GVqKuTVANE
- https://github.com/DataWithBaraa/sql-data-warehouse-project

---

# License

This project is licensed under the [MIT License](LICENSE). You are free to use, modify, and share this project with proper attribution.

---

# About Me

I'm a Data Engineer with strong experience in Data Pipeline using Apache Airflow.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/shaurave)

---
