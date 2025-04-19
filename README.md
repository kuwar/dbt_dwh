# Introduction
This is ~Data Warehousing~ project, designed to integrate ~CSV~ data from diverse source. 
~DBT~ is used along with ~Madellion Architecture~ for ~Data Modelling~. Full load i.e.,
truncate and load pattern is followed.
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

## Understanding the source data


## Authentication & Authorization for different data warehouse users
) Schemas => bronze, silver and gold
) Roles => data_engineer, data_analytics
) Role assignment to schema => data_engineer -> bronze, silver, gold & data_analytics -> silver, gold
) Users => shaurave, kuwar
) Role assigned to user => data_engineer -> shaurave, data_analytics -> kuwar

For managing user, roles and schema consider the file `config/postgres/dw_schema_medallion.sql`
---

*NOTE:* `bronze` and `silver` layer are materialized to `table` and `gold` is materialized to `view`