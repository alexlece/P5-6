#!/bin/bash
# Alejandro Adell Pina :735061

echo "Nº de usuarios y carga media de trabajo:" | logger -p local0.info &&
uptime | cut -d ',' -f 2,3,4,5 | logger -p local0.info

echo -e "\nMemoria ocupada y libre, swap utilizado:" | logger -p local0.info &&
free | grep 'Mem' | awk '{print $1 "	" $3 "	" $4}' | logger -p local0.info &&
free | grep 'Swap' | awk '{print $3}' | logger -p local0.info

echo -e "\nEspacio ocupado y libre:"| logger -p local0.info && 
df -hT | awk '{print $1 "       " $3 "       " $4}' | logger -p local0.info

echo -e "\nPuertos abiertos y conexiones establecidas:"| logger -p local0.info && 
netstat -a | egrep 'Proto|LISTEN' | logger -p local0.info && 
netstat -tpn | logger -p local0.info

echo -e "\nNº de programas en ejecución:"| logger -p local0.info && 
ps | grep -vc 'PID' | logger -p local0.info
