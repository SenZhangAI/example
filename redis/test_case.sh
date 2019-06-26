#!/bin/bash

set -x

redis-cli -h 192.168.56.101 -p 6380 -a foobared keys "*"
redis-cli -h 192.168.56.101 -p 6380 -a foobared keys "*"
redis-cli -h 192.168.56.101 -p 6380 -a foobared keys "*"

redis-cli -h 192.168.56.101 -p 6380 -a foobared get aaa
redis-cli -h 192.168.56.101 -p 6381 -a foobared get aaa
redis-cli -h 192.168.56.101 -p 6382 -a foobared get aaa


rand=$RANDOM

redis-cli -h 192.168.56.101 -p 6380 -a foobared set aaa $rand
redis-cli -h 192.168.56.101 -p 6381 -a foobared set aaa $rand
redis-cli -h 192.168.56.101 -p 6382 -a foobared set aaa $rand


redis-cli -h 192.168.56.101 -p 6380 -a foobared get aaa
redis-cli -h 192.168.56.101 -p 6381 -a foobared get aaa
redis-cli -h 192.168.56.101 -p 6382 -a foobared get aaa

redis-cli -h 192.168.56.101 -p 26380 -a foobared set aaa $rand
redis-cli -h 192.168.56.101 -p 26381 -a foobared set aaa $rand
redis-cli -h 192.168.56.101 -p 26382 -a foobared set aaa $rand


redis-cli -h 192.168.56.101 -p 26380 -a foobared get aaa
redis-cli -h 192.168.56.101 -p 26381 -a foobared get aaa
redis-cli -h 192.168.56.101 -p 26382 -a foobared get aaa

redis-cli -h 192.168.56.101 -p 6380 -a foobared INFO replication
redis-cli -h 192.168.56.101 -p 6381 -a foobared INFO replication
redis-cli -h 192.168.56.101 -p 6382 -a foobared INFO replication
