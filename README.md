# Backup Script
The script in this repo will allow users to backup files with a .log extension. The backed up archives will be found in ~/backup_logs. Any archive that is 5 weeks or older will be deleted.  

## Installation 
```
git clone https://github.com/KavinTheG/AAFC_Scripts.git
```

## Usage
Use line below to backup .log files from the root directory. Stores at /backup_logs
```
$ ./backup_log.sh
```
Add an additional argument to specify which directory to backup. The tar file will be named 'backup_log_path_to_directory.tar.gz' located in /backup_logs
```
$ ./backup_log.sh /home/user
```

## Cron
Use the line below to modify cron jobs
```
crontab -e
```

To automate this script to backup log files from a directory, add the line below.
```
0 9 * * 0 /path/to/backup_log.sh
```
