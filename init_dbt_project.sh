#!/bin/bash
set -euo pipefail  # Strict error handling

# =============================================================================
# Configuration
# =============================================================================
# THIS SCRIPTS IS RESPONSIBLE FOR SCAFOLDING THE DBT PROJECT IF NOT EXIST
#
# IF THE PROJECT IS ALREADY INITIATED I.E., ${PROJECT_DIR}/dbt_project.yml FILE
# EXIST, PROJECT CONTINUE TO SERVE USING THE EXISTING SETTINGS
#
# -----------------------------------------------------------------------------
PROJECT_DIR="/usr/app/dbt_project"
DWH_NAME="crm_erp_dwh"
PROFILES_FILE="${PROJECT_DIR}/profiles.yml"

# =============================================================================
# Ensure Directories Exist
# =============================================================================
mkdir -p "${PROJECT_DIR}"

# =============================================================================
# Initialize DBT Project (if none exists)
# =============================================================================
if [[ ! -f "${PROJECT_DIR}/dbt_project.yml" ]]; then
    echo "========================================="
    echo ">>>>> Initializing new dbt project <<<<<"
    echo "========================================="
    pwd

    # Create in temporary directory first
    TEMP_DIR=$(mktemp -d)
    echo "Using temp dir: ${TEMP_DIR}"
    # changing to temp directory
    cd "${TEMP_DIR}"
    
    # Initialize project
    dbt init "${DWH_NAME}" \
        --skip-profile-setup
    # Two folders are created 
    # 1. dbt_data_warehouse (name of project spedified after dbt init) 
    # 2. logs
    # Change to project directory
    cd "${PROJECT_DIR}"

    # Move files to persistent storage
    echo "Moving project files to ${PROJECT_DIR}"
    mv "${TEMP_DIR}/${DWH_NAME}/"* "${PROJECT_DIR}/"
    
    rm -rf "${TEMP_DIR}"

    # =========================================================================
    # Create profiles.yml
    # =========================================================================
    echo "Creating profiles.yml with environment variables"
    cat > "${PROFILES_FILE}" << EOF
---

${DWH_NAME}:
  outputs:
    dev:
      type: postgres
      host: "{{ env_var('POSTGRES_HOST') }}"
      user: "{{ env_var('POSTGRES_USER') }}"
      password: "{{ env_var('POSTGRES_PASSWORD') }}"
      port: "{{ env_var('POSTGRES_PORT') | int }}"
      dbname: "{{ env_var('POSTGRES_DB') }}"
      schema: public
      threads: 4
      keepalives_idle: 0
  target: "{{ env_var('DBT_PROFILE_TARGET') }}"
EOF

    # Set appropriate permissions
    chmod 0644 "${PROFILES_FILE}"
fi

# =============================================================================
# Execute Command
# =============================================================================
echo "Starting dbt with command: $@"
exec "$@"