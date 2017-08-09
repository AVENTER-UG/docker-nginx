#!/bin/bash

find /var/www/html/ -type d -exec chmod 755 {} \;
find /var/www/html/ -type f -exec chmod 644 {} \;

set -e
exec /usr/bin/svscan /etc/s6.d
