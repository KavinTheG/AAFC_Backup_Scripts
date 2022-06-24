#!/bin/bash

$expiry_date = date --date="5 week ago" +%F

# Remove tar archives from 5 weeks ago
find /backup_logs/  -name "backup_log-$expiry_date.tar.gz" -exec rm {} \;
