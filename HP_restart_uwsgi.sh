#!/bin/bash

echo "Starting Uwsgi server management...."

for i in (sudo cat /var/log/uwsgi.log | grep 'uWSGI master process' | grep -Eo "[0-9]{1,}" | tail -2);
do
  echo $i;
done
