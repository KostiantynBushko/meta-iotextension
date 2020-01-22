#!/usr/bin/env bash

CPUID=''
CPUID=$(echo $CPUID | cat /proc/cpuinfo | grep Serial | cut -d ' ' -f 2 | tr '[:lower:]' '[:upper:]')

if [ -z ${CPUID} ]; then
  echo "ERROR: Impossible obtain CPUID"
  exit 1
fi

echo ${CPUID} > /etc/hostname 
cat /etc/hostname

exit 0
