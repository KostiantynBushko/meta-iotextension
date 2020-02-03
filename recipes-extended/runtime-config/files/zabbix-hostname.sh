#!/bin/sh

S=1
$1 > /tmp/aktualizr-info-tmp
while read -r line; do
  if [[ "${line:0:10}" == "Device ID:" ]]; then
    grep -Fxq "Hostname=${line:11}" /etc/zabbix_agentd.conf 
    if [[ $? -eq 1 ]]; then 
      sed -i "s:^Hostname=Zabbix server:Hostname=${line:11}:g" /etc/zabbix_agentd.conf 
      systemctl restart zabbix-agent.service
    fi 
    S=0
  fi
done < "/tmp/aktualizr-info-tmp"

rm /tmp/aktualizr-info-tmp

if [[ "${S}" -ne 0 ]]; then
 echo "ERROR: Reading aktualizr info failed. Restart service!"
 sleep 20
 systemctl restart zabbix-hostname.service
 exit 1 
fi

