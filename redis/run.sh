#!/bin/bash

# 清除所有数据库数据
redis-cli -h 192.168.56.101 -p 6380 -a foobared flushall

pkill redis

sleep 1

cp redis_6380.conf.bak redis_6380.conf
cp redis_6381.conf.bak redis_6381.conf
cp redis_6382.conf.bak redis_6382.conf
cp sentinel_26380.conf.bak sentinel_26380.conf
cp sentinel_26381.conf.bak sentinel_26381.conf
cp sentinel_26382.conf.bak sentinel_26382.conf

redis-server redis_6380.conf
redis-server redis_6381.conf
redis-server redis_6382.conf

sleep 1

redis-sentinel sentinel_26380.conf &
redis-sentinel sentinel_26381.conf &
redis-sentinel sentinel_26382.conf &

