#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER odoo CREATEDB password 'odoo';
    CREATE DATABASE odoo;
    GRANT ALL PRIVILEGES ON DATABASE odoo TO odoo;
EOSQL