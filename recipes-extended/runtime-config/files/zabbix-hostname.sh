#!/usr/bin/env bash

./$1 | while read -r line; do
  if [[ ${line} == *"Device ID: "* ]]; then
    sed -i "s:Hostname=Zabbix server:Hostname=${line:11}:g" /etc/zabbix_agentd.conf 
    exit 0
  fi
done

exit 1

