#!/bin/bash

function ctrl_c(){
	echo -e "\n\nSaliendo..."
	exit 1
}

trap ctrl_c SIGINT

hosts=$1
if [ $hosts ]; then
	for i in {1..255}
		do
			timeout 1 bash -c "ping -c 1 192.168.1.$i" &>/dev/null && echo "[+] Host: 192.168.1.$i Disponible"
		done

else
	echo "Modo de uso: ./searchHosts.sh"
fi

#sleep 10
