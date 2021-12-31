sudo tail /var/log/uwsgi.log | grep 'master process'

sudo /usr/local/bin/uwsgi --ini /home/pi/sampleApp/uwsgi_config.ini --uid www-data --gid www-data --daemonize /var/log/uwsgi.log

sudo vi /home/pi/sampleApp/sample_app.py

#tylko cyfry
sudo tail /var/log/uwsgi.log | grep 'uWSGI master process' | grep -Eo "[0-9]{1,}"

#tylko dwie ostatnie linie wyniku
sudo cat /var/log/uwsgi.log | grep 'uWSGI master process' | grep -Eo "[0-9]{1,}" | tail -2

# przetwarzaj ostatnie dwie linie z każdego pliku
for f in $(find . -name "FILE_NAME"); do grep PATTERN $f | tail -1; done

#wyszukać proces i sprawdzić czy działalias
ps aux | grep {process-name} #numer procesu


#uprawnienia do uruchamiania przez ./
chmod a+x FILE_NAME

./FILE_NAME



check_address=`grep $address /etc/passwd`
   if [ -z "$check_address" ]
     then
   validuser=0
   else
       validuser=1
   fi


#czy grep coś zwraca
   if grep -q $address /etc/passwd
      then
        echo "OK";
      else
        echo "NOT OK";
    fi
