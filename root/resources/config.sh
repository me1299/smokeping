#!/bin/bash

#General
if [ -n "${OWNER}" ]; then
  sed -i -e "/owner.*=/ s/= .*/= ${OWNER}/" /data/config/General
fi

if [ -n "${OWNER_EMAIL}" ]; then
  sed -i -e "/contact.*=/ s/= .*/= ${OWNER_EMAIL}/" /data/config/General
fi

#Targets
if [ -n "${TITLE}" ]; then
  sed -i -e "0,/title.*=/{s/title = .*/title = ${TITLE}/}" /data/config/Targets
fi

#Database
if [ -n "${STEP}" ]; then
  sed -i -e "/step.*=/ s/= .*/= ${STEP}/" /data/config/Database
fi

if [ -n "${PINGS}" ]; then
  sed -i -e "/pings.*=/ s/= .*/= ${PINGS}/" /data/config/Database
fi
