#!/bin/bash

DATAVOL=/usr/local/var/lib/gvm/
#OV_PASSWORD=${OV_PASSWORD:-admin}

# Restart redis
service redis-server restart

echo "Testing redis status..."
X="$(redis-cli -s /var/run/redis/redis-server.sock ping)"
while  [ "${X}" != "PONG" ]; do
        echo "Redis not yet ready..."
        sleep 1
        X="$(redis-cli -s /var/run/redis/redis-server.sock ping)"
done
echo "Redis ready."


#if [ -n "$SETUPUSER" ]; then
#  echo "Setting up user"
#  /usr/sbin/openvasmd openvasmd --create-user=admin
#  /usr/sbin/openvasmd --user=admin --new-password=$OV_PASSWORD
#fi


#echo "Checking setup"
#./openvas-check-setup --v9


openvassd ;\
gvmd ;\
gsad 

# Do some if then here.
#greenbone-certdata-sync ;\
#greenbone-scapdata-sync


if [ -z "$BUILD" ]; then
  echo "Tailing logs"
  tail -F /usr/local/var/log/gvm/*
fi
