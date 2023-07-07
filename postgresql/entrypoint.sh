#!/bin/bash

set -e

# Execute SQL script
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" -f /create_table.sql

# Start CKAN
exec "$@"
