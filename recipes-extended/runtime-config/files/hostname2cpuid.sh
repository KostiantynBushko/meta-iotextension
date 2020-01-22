#!/usr/bin/env bash

CPUID=''
CPUID=$(echo $CPUID | cat /proc/cpuinfo | grep Serial | cut -d ' ' -f 2 | tr '[:lower:]' '[:upper:]')

echo "hostname to cpuid: ${CPUID}"
