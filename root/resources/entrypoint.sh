#!/bin/bash

bash /resources/usermod.sh
bash /resources/dir.sh
bash /resources/config.sh
bash /resources/timezone.sh

touch /var/log/smokeping.log
chown bogus /var/log/smokeping.log
su bogus -c 'smokeping --logfile=/var/log/smokeping.log'
/usr/sbin/apache2ctl start

cleanup() {
    apache2ctl stop
	su bogus -c 'service smokeping stop'

	while :; do
		if pgrep -x "apache2" >/dev/null && pgrep -x "smokeping" >/dev/null
		then
		    echo "Waiting for Apache & Smokeping to shutdown"
		else
		    exit 0
		fi

		sleep 1s
	done
}

trap cleanup INT TERM

while :; do
    #never ending loop
    sleep 1s
done