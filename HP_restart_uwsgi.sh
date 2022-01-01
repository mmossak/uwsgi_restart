#!/bin/bash

echo 'Starting Uwsgi server management....'

file = sample_app.sock
#check last 4 instances of master uwsgi process
echo "found uwsgi master processes in log file"
for i in $(cat /var/log/uwsgi.log | grep 'uWSGI master process' | grep -Eo "[0-9]{1,}" | tail -4);
do
  echo "$i";
  if ps -p $i > /dev/null 
    then 
     echo "found running  process with pid: $i"
     kill $i
     echo "process $i killed"
     echo "starting uwsgi server again"
     /usr/local/bin/uwsgi --ini /home/pi/sampleApp/uwsgi_config.ini --uid www-data --gid www-data --daemonize /var/log/uwsgi.log 
  fi
done
#check if sock file exists in tmp
echo "checking if sock file exists"
if ls /tmp/ | grep "$file"  > /dev/null
#$? dollar hold last command output 
 if [ $? -eq 0 ]; 
   then echo "command ok" 
 fi 
 then
    echo "sock file found - succes !"
  else
    echo  "sock file not found - failed restart"
 fi
