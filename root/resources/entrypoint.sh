#!/bin/bash

bash /resources/usermod.sh
bash /resources/dir.sh
bash /resources/config.sh
bash /resources/timezone.sh

su bogus -c 'smokeping'
/usr/sbin/apache2ctl -D FOREGROUND