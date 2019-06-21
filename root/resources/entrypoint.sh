#!/bin/bash

timestamp() {
  date +"%Y-%m-%d %H:%M:%S"
}

bash /resources/header.sh

echo "$(timestamp): Loading startup scripts"
bash /resources/usermod.sh
bash /resources/dir.sh
bash /resources/config.sh
bash /resources/timezone.sh

touch /var/log/smokeping.log
chown bogus /var/log/smokeping.log

echo "$(timestamp): Starting Smokeping..."
su bogus -c 'smokeping --logfile=/var/log/smokeping.log' >/dev/null

echo "$(timestamp): Starting Apache..."
/usr/sbin/apache2ctl start

cleanup() {
	echo "$(timestamp): initiating shutdown..."
	echo "$(timestamp): Stopping Apache"
    apache2ctl stop
	echo "$(timestamp): Stopping Smokeping"
	su bogus -c 'service smokeping stop' >/dev/null

	while :; do
		if pgrep -x "apache2" >/dev/null && pgrep -x "smokeping" >/dev/null
		then
		    echo "$(timestamp): Waiting for Apache & Smokeping to shutdown"
		else
			echo "$(timestamp): Bye..."
		    exit 0
		fi

		sleep 1s
	done
}

trap cleanup INT TERM

while :; do
    #main threat loop
    sleep 1s
done