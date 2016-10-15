#!/bin/sh

CONFIG_PATH=/usr/local/etc/redis
CONFIG_FILE=$CONFIG_PATH/redis.conf

if [ -z "$REDIS_PORT" ]; then
    echo 'REDIS_PORT must be defined'
    exit 1
fi

mkdir -p $CONFIG_PATH

tee $CONFIG_FILE <<EOF > /dev/null
port $REDIS_PORT
cluster-enabled yes
cluster-config-file nodes-$REDIS_PORT.conf
cluster-node-timeout 5000
appendonly yes
EOF

exec redis-server $CONFIG_FILE
