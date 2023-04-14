#!/bin/bash

function ctrl_c(){
	echo -e "\n\nSaliendo.."
	exit 1
}

trap ctrl_c SIGINT
sleep 10
