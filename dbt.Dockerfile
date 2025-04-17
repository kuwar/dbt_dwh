FROM python:3.11

WORKDIR /usr/app/dbt_project

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    libpq-dev \
    build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install dbt-postgres (and other requirements)
COPY ./requirements.txt /usr/app/requirements.txt
RUN pip install --no-cache-dir -r /usr/app/requirements.txt
RUN echo $(pwd)
# Set up a basic project structure if none exists
COPY ./init_dbt_project.sh /usr/app/init_dbt_project.sh
RUN chmod +x /usr/app/init_dbt_project.sh

ENTRYPOINT ["/usr/app/init_dbt_project.sh"]

# Keep the container running (optional)
CMD ["tail", "-f", "/dev/null"]