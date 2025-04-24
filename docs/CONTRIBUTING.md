# Naming Conventions
- Use lowercase letters and underscores for file names
- Use descriptive names that reflect the content of the file
- Avoid spaces and special characters
- Use singular nouns for model names
- Use plural nouns for table names
- Use a consistent naming pattern for all models and sources
- Use suffixes to indicate the layer of the model (e.g., `**_bronze`, `**_silver`, `**_gold`)
- Use prefixes to indicate the type of model (e.g.,`dim_**`, `fact_**`)
- Use a consistent naming pattern for all sources (e.g., `source_[source_name]`)
- Use a consistent naming pattern for all tests (e.g., `test_[test_name]`)
- Use a consistent naming pattern for all macros (e.g., `macro_[macro_name]`)
- Use a consistent naming pattern for all snapshots (e.g., `[snapshot_name]_snapshot`)
- Use a consistent naming pattern for all seeds (e.g., `seed_[seed_name]`)
- Use a consistent naming pattern for all analyses (e.g., `[analysis_name]_analysis`)
- Use a consistent naming pattern for all tests (e.g., `test_[test_name]`)

---

# Column Naming Conventions

## Surrogate Keys

All primary keys in dimension tables must use the suffix _key.
<table_name>_key
<table_name>: Refers to the name of the table or entity the key belongs to.
_key: A suffix indicating that this column is a surrogate key.
Example: customer_key → Surrogate key in the dim_customers table.

## Technical Columns

All technical columns must start with the prefix dwh_, followed by a descriptive name indicating the column's purpose.
dwh_<column_name>
dwh: Prefix exclusively for system-generated metadata.
<column_name>: Descriptive name indicating the column's purpose.
Example: dwh_load_date → System-generated column used to store the date when the record was loaded.

---

# Sources

- Use the seeds directory to place the CSV files
- Raw data as CSV files
- Modular sources.yml files used for each CSV file i.e., same name as the CSV file

---

# Bronze Layer (Raw Data)

- Create model definition in modular sources.yml files
- Just load the data as-is, without any transformation for historical reference
- Include metadata columns like _ingestion_timestamp, _source_file

---

# Silver Layer (Integrated Data)

- Cleanse and validate data
- Apply business rules
- Resolve duplicates
- Join related datasets
- Standardize formats and values
- Implement data quality tests

---

# Gold Layer (Business Logic)

- Create aggregates and summaries
- Implement business metrics
- Design dimensional models (facts/dimensions)
- Optimize for specific use cases and performance
- Create views for analytical queries

---

# Modular sources.yml files

Separate [XYZ].yml files for each CSV file or group of any models files. 
This approach is called "modular sources" in dbt, and it can have several 
impacts on your project.

---

*NOTE:* `bronze` and `silver` layer are materialized to `table` and `gold` is materialized to `view`
