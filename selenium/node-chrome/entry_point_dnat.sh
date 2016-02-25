#!/bin/bash

ip addr show|grep 172.17.0
result=$?
while [ $result != 0 ];
do
  sleep 5s
  echo "Looking for a 172.17.0.* IP"
  ip addr show|grep 172.17.0
  result=$?
done

exec /opt/bin/entry_point.sh
