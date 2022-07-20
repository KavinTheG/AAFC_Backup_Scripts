#!/bin/bash 

# Path to desired backup directory
src_dir=/

# Extension
ext=.log

# Title of directory
dir_title=backup_log_$(date +%F)

# Checks if an argument was given
if [ $# -eq 0 ]; then 
	echo "Source directory was not given. Backing up $ext files from root ($src_dir)"
	dir_title=backup_log_,_$(date +%F)
else 
	src_dir=$1 
	echo "Backuping log files at directory $src_dir"

	# Replace '/' with '|'
	dir_title=backup_log_"${src_dir////,}"_"$(date +%F)"
fi


# Creates backup directory if none exists already
if [ ! -d /backup_logs ]; then
	mkdir /backup_logs
fi

# Make a new directory
echo "Making directory $dir_title"
sleep 3
mkdir /backup_logs/$dir_title

# -a -> archive
# -v -> verbose
find $src_dir -type f -name "*.log" -exec rsync -av --exclude={/backups_logs} '{}' /backup_logs/"$dir_title" \;

# -z -> gzip
# -c -> create archive
# -v -> verbose
# -f -> the name

if [[ -d /backup_logs/$dir_title ]] 
then
	tar -zcvf /backup_logs/$dir_title.tar.gz /backup_logs/$dir_title --remove-files
else
	echo "Backup directory $dir_title was not created"
fi
