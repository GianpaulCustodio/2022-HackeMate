#!/bin/bash
#Si quieres hacer el testeo desde una bash tienes que hacerlo desde root y desde bash.
#Por default los puertos están desactivados, puedes activar uno: sudo service ssh start (22).

function ctrl_c(){
	echo -e "\n\nSaliendo..."
	exit 1
}

#ctrl+C
trap ctrl_c SIGINT

ip=$1
if [ $ip ]; then
	for i in {1..65535}
		do
			echo "" > /dev/tcp/$1/$i && echo "[+]Puerto $i: Abierto"
		done 2>/dev/null
else
	echo "[*]Modo de uso: ./nmapbyme.sh <IP>"
fi

#sleep 10
