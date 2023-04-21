#!/bin/bash

function ctrl_c(){
	echo -e "\n\nSaliendo..."
	exit 1
}

hosts=$1

if [ $hosts ]; then
	for i in {1..255}
		do
			timeout 1 bash -c "ping -c 1 192.168.1.234" &>/dev/null && echo "[*] IP Disponible: 192.168.1.$i"
		done
else
	echo "Modo de uso: ./SearchHosts2.sh"

trap ctrl_c SIGINT

