#!/bin/bash

#Timezone adjustment
if [ -n "$TZ" ]; then
  echo ${TZ} > /etc/timezone
  rm -f /etc/localtime
  dpkg-reconfigure -f noninteractive tzdata > /dev/null 2>&1
fi