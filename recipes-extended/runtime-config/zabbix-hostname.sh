#!/bin/sh

S=1
$1 | while read -r line; do
  if [[ "${line:6}" == "Error:" ]]; then
    exit 1
  fi
  if [[ "${line:0:10}" == "Device ID:" ]]; then
    grep -Fxq "Hostname=${line:11}" /etc/zabbix_agentd.conf 
    if [[ $? -eq 1 ]]; then 
      sed -i "s:^Hostname=Zabbix server:Hostname=${line:11}:g" /etc/zabbix_agentd.conf 
      systemctl restart zabbix-agent.service
      echo " ** SET HOSTNAME: ${line:11}" 
      S=0
      echo $S
      break
    else
      echo " ** Host Nmae was already SET"
      S=0
      echo $S
      break
    fi 
  fi
done < <$(find . -type f)

echo "STATUS ${S}"
if [[ "${S}" -ne 0 ]]; then
 echo " ** FAILED nead restart service"
 sleep 20
 systemctl restart zabbix-hostname.service
 exit 1 
fi

