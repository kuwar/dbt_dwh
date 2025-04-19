# Bronze Layer (Raw Data)

Use the seeds directory to place your CSV files
Create source definitions in bronze/sources.yml
Raw models should do minimal transformations (basic type casting, column renaming)
Include metadata columns like _loaded_at, _source_file

# Silver Layer (Integrated Data)

Cleanse and validate data
Apply business rules
Resolve duplicates
Join related datasets
Standardize formats and values
Implement data quality tests

# Gold Layer (Business Logic)

Create aggregates and summaries
Implement business metrics
Design dimensional models (facts/dimensions)
Optimize for specific use cases and performance