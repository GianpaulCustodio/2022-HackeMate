#!/bin/bash
#Made by HackeMate

function ctrl_c(){
	echo -e "\n\nSaliendo..."
}

trap ctrl_c SIGINT

ip=$1
if [ $ip ]; then
	ping -c 1 $ip > tmp.txt
	a=`cat tmp.txt | head -n 2 | tail -n 1 | awk '{print $6}' FS=' ' | awk '{print $2}' FS='='`
	if [ $a -eq 64 ]; then
		echo "TTL 64 -> Linux"
	else
		echo "ERROR"
	fi
else
	echo "[*]Modo de uso: ./whichSystem.sh <IP>"
fi
	rm tmp.txt
