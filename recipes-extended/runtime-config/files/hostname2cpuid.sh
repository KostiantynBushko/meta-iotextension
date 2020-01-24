#!/usr/bin/env bash

DEVICE_ID=""

$1 | while read -r line; do
  if [[ ${line} == *"Device ID: "* ]]; then
    DEVICE_ID=${line:11} 
  fi 
done

if [[ -z ${DEVICE_ID} ]]; then
  echo ${DEVICE_ID} > /etc/hostname 
  cat /etc/hostname
fi

exit 0
