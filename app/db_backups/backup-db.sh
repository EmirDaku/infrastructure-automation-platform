#!/bin/bash

DB_CONTAINER="dotnetapp-db"

BACKUP_DIR="./db_backups"

DB_NAME=${POSTGRES_DB:-dotnetapp}
DB_USER=${POSTGRES_USER:-dotnetappuser}
DB_PASSWORD=${POSTGRES_PASSWORD:-DDNnet@123}

mkdir -p $BACKUP_DIR

docker exec -e PGPASSWORD=$DB_PASSWORD $DB_CONTAINER pg_dump -U $DB_USER $DB_NAME > $BACKUP_DIR/dotnetapp_backup.sql

echo "Backup u krijua me sukses në $BACKUP_DIR/dotnetapp_backup.sql"
