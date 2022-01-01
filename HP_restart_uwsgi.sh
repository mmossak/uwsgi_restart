#!/bin/bash

echo 'Starting Uwsgi server management....'

#check last 4 instances of master uwsgi process
for i in $(cat /var/log/uwsgi.log | grep 'uWSGI master process' | grep -Eo "[0-9]{1,}" | tail -4);
do
  echo "$i";
  if ps -p $i > /dev/null 
    then 
     echo "found process with pid: $i"
     kill $i
     echo "process $i killed"
     echo "starting uwsgi server again"
     /usr/local/bin/uwsgi --ini /home/pi/sampleApp/uwsgi_config.ini --uid www-data --gid www-data --daemonize /var/log/uwsgi.log 
  fi
done
