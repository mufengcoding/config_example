#!/bin/bash
#function:cut nginx log files

#set the path to nginx log files
log_files_path="/root/app_logs/"
log_files_dir=${log_files_path}
#set nginx log files you want to cut
log_files_name=(www.njbuyshine.com )
#set the path to nginx.
nginx_sbin="/usr/local/nginx/sbin/nginx"
#Set how long you want to save
save_days=7
############################################
#Please do not modify the following script #
############################################

log_files_num=${#log_files_name[@]}

#cut nginx log files
for((i=0;i<$log_files_num;i++));do
mv ${log_files_path}${log_files_name[i]}.log ${log_files_dir}${log_files_name[i]}.log_$(date -d "yesterday" +"%Y-%m-%d")
done

#delete 30 days ago nginx log files
find $log_files_path -mtime +$save_days -exec rm -rf {} \; 

#向nginx主进程发信号重新打开日志
/usr/local/nginx/sbin/nginx -s reload
#kill -USR1 `cat /usr/local/nginx/logs/nginx.pid`
