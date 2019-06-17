#!/bin/bash

PUID=${PUID:-911}
PGID=${PGID:-911}

useradd bogus > /dev/null 2>&1
groupmod -o -g "$PGID" bogus > /dev/null 2>&1
usermod -o -u "$PUID" bogus > /dev/null 2>&1
usermod -a -G bogus smokeping