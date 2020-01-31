#!/usr/bin/env bash

./$1 | while read -r line; do 
  if [[ ${line} == *"Device ID: "* ]]; then
    grep -Fxq "^Hostname=${line:11}" /etc/zabbix_agent.conf 
    if [[ $? -eq 1 ]]; then 
      sed -i "s:^Hostname=Zabbix server:Hostname=${line:11}:g" /etc/zabbix_agentd.conf 
      systemctl restart zabbix-agent.service
    fi 
    exit 0
  fi
done

exit 1

