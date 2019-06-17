#!/bin/bash

mkdir -p /data/config
mkdir -p /data/data

cd /etc/smokeping/config.d
for file in *
do
  if [ ! -e /data/config/${file} ]; then
    echo /data/config/${file}
    cp ${file} /data/config/${file}
  fi
done

chown -R bogus:bogus /data/
chown bogus:bogus /var/run/smokeping
