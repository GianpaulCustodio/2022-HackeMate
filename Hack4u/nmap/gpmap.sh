#!/bin/bash

function ctrl_c(){
	echo -e "\n Saliendo..."
	exit 1
}

trap ctrl_c SIGINT

#sleep 5

ip=$1
if [ $ip ]; then
	for i in {1..65535}
		do
			echo "" > /dev/tcp/$ip/$i && echo "Puerto $i: Existe"
		done 2>/dev/null
else
	echo "modo de uso"
fi





