#!/usr/bin/env bash

./$1 | while read -r line; do
  if [[ ${line} == *"Device ID: "* ]]; then
    echo "${line:11}" 
    exit 0
  fi
done

exit 1

