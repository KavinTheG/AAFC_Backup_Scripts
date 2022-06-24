#!/bin/bash

# Make a new directory
mkdir /backup_logs/backup_log-"$(date +%F)"

# -a -> archive
# -v -> verbose
find / -type f -name "*.log" -exec rsync -av --exclude={/backups_logs} '{}' /backup_logs/backup_log-"$(date +%F)" \;

# -z -> gzip
# -c -> create archive
# -v -> verbose
# -f -> the name
tar -zcvf "backup_log-$(date +%F).tar.gz" /backup_logs/backup_log-"$(date +%F)"

# Remove new directory
rm -r /backup_logs/backup_log-"$(date +%F)"
