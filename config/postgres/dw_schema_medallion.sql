-- Database administrator creates these roles
CREATE ROLE data_engineer;
CREATE ROLE data_analytics;
CREATE ROLE reporting_role;

-- Grant connection privileges
GRANT CONNECT ON DATABASE crm_erp_dwh TO data_engineer, data_analytics, reporting_role;

-- Create application users with passwords
CREATE USER shaurave WITH PASSWORD 'CrM3RPdw4';
CREATE USER kuwar WITH PASSWORD 'CrM3RPdw4';

-- Assign users to roles
GRANT data_engineer TO shaurave;
GRANT data_analytics TO kuwar;

-- Set up schemas
CREATE SCHEMA bronze;
CREATE SCHEMA silver;
CREATE SCHEMA gold;

-- Grant schema usage
GRANT USAGE ON SCHEMA bronze TO data_engineer;
GRANT USAGE ON SCHEMA silver TO data_engineer, data_analytics;
GRANT USAGE ON SCHEMA gold TO data_engineer, data_analytics;

-- Grant object creation permissions to data_engineer
GRANT CREATE ON SCHEMA bronze, silver, gold TO data_engineer;

-- Grant read access to appropriate roles
GRANT SELECT ON ALL TABLES IN SCHEMA bronze TO data_engineer;
GRANT SELECT ON ALL TABLES IN SCHEMA silver TO data_engineer, data_analytics;
GRANT SELECT ON ALL TABLES IN SCHEMA gold TO data_engineer, data_analytics;

-- Set default privileges for future tables
ALTER DEFAULT PRIVILEGES IN SCHEMA bronze GRANT SELECT ON TABLES TO data_engineer;
ALTER DEFAULT PRIVILEGES IN SCHEMA silver GRANT SELECT ON TABLES TO data_engineer, data_analytics;
ALTER DEFAULT PRIVILEGES IN SCHEMA gold GRANT SELECT ON TABLES TO data_engineer, data_analytics;