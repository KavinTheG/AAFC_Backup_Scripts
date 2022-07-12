#!/bin/bash 

src_dir=/

# Checks if an argument was given
if [ $# -eq 0 ]; then 
	echo "Source directory was not given. Assume /"
else 
	src_dir= $1 
	echo "Backuping log files at directory $src_dir"
fi


# Creates backup directory if none exists already
if [ ! -d /backup_logs ]; then
	mkdir /backup_logs
fi

# Make a new directory
mkdir /backup_logs/backup_log_"$(date +%F)"

# -a -> archive
# -v -> verbose
find $src_dir -type f -name "*.log" -exec rsync -av --exclude={/backups_logs} '{}' /backup_logs/backup_log_"$(date +%F)" \;

# -z -> gzip
# -c -> create archive
# -v -> verbose
# -f -> the name

if [[ -d /backup_logs/backup_log_"$(date +%F)" ]] 
then
	tar -zcvf /backup_logs/backup_log_$(date +%F).tar.gz /backup_logs/backup_log_$(date +%F) --remove-files

	# Remove new directory
	# rm -r /backup_logs/backup_log_"$(date +%F)"
else
	echo "Backup directory backup_log-$(date +%F) was not created"
fi
