Use line below to backup .log files from the root directory. Stores at /backup_logs
'''
$ ./backup_log.sh
'''
Add an additional argument to specify which directory to backup. The tar file will be named 
'backup_log_,path,to,directory.tar.gz'
'''
$ ./backup_log.sh /home/user
'''
