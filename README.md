# Introduction

This is *Data Warehousing* project, designed to integrate *CSV* data from 
diverse source. 
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

# What problem is solved

# How to run project

- From the root directory, run docker-compose up -d
- To run the dbt commands inside docker container
    - [DOCKER COMMANDS] [DBT COMMANDS]
    - e.g., docker-compose exec dbt dbt run
    - to generate documents
    ```bash
    docker-compose --profile docs up dbt-docs
    ```

# Tools and Technology used

- *Madellion Architecture* for *Data Modelling*
- Full Load i.e., truncate and load pattern is followed
- *DBT*
- Docker and docker-compose
- Postgres

# Authentication & Authorization for different data warehouse users
- Schemas => bronze, silver and gold
- Roles => data_engineer, data_analytics
- Role assignment to schema => data_engineer -> bronze, silver, gold & data_analytics -> silver, gold
- Users => shaurave, kuwar
- Role assigned to user => data_engineer -> shaurave, data_analytics -> kuwar

For managing user, roles and schema consider the file `config/postgres/dw_schema_medallion.sql`
---

*NOTE:* `bronze` and `silver` layer are materialized to `table` and `gold` is materialized to `view`

# Contributing

[Guide to contribution](/CONTRIBUTING.md)

# References
- https://www.youtube.com/watch?v=9GVqKuTVANE
- https://github.com/DataWithBaraa/sql-data-warehouse-project
- 

# About Me

I'm a Data Engineer with strong experience in Data Pipeline using Apache Airflow.
