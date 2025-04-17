#!/bin/bash

# Start the Services
docker-compose up -d
# docker-compose up --build --force-recreate -d

# Connect to the dbt Container
docker-compose exec dbt bash
# Run dbt Commands
dbt debug    # Verify connection
dbt run      # Run your models
# also run dbt commands directly using dbt service
# docker-compose exec dbt [DBT_COMMANDS]

# Once inside the container, generate docs
cd /usr/app
dbt docs generate
# The documentation will be generated in 
# the ./dbt_project/target directory, which 
# you can then view using any static file 
# server or by opening the HTML files directly.
# Serve the docs on port 8080
dbt docs serve --port 8080
# Access the documentation in your web browser at 
# http://localhost:8080

# run dbt-docs service on demand
docker-compose --profile docs up dbt-docs