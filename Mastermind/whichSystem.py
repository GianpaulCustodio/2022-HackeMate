#!/usr/bin/python3
import re, sys, subprocess

#python3 whichSystem.py(1er argumento) 10.10.10.98(2do argumento)

if len(sys.argv) != 2:
	print('[*] Manual de uso: ' + sys.argv[0] + ' + <ip>')
	sys.exit(1)

def get_ttl(ip_address):
	proc = subprocess.Popen(['/usr/bin/ping -c 1 %s' % ip_address, ""], stdout=subprocess.PIPE, shell=True)
	(out,err) = proc.communicate()
	a = out.split()[12]
	b = a.decode('UTF-8')
	ttl_value = re.findall(r"\d{1,3}", b)[0]
	#print(ttl_value)
	return ttl_value

def get_os(ttl):
	c = int(ttl)
	if c >= 0 and c <= 64:
		return 'Linux'
	elif c >= 65 and c <= 128:
		return 'Windows'
	else:
		return 'TTL DESCONOCIDO'

if __name__ == '__main__':
	ip_address = sys.argv[1]
	ttl = get_ttl(ip_address)
	os_name = get_os(ttl)
	print('%s (ttl -> %s): %s' % (ip_address, ttl, os_name))
