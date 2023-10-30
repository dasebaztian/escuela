#!/home/dasebaztian/Analisis/bin/python3.11
import socket
import os
def ping(host):
        res = os.system(f"ping -c 3 {host}")
        if res == 0:
            print(f"Ping a {host}")
        else:
            print(f"No se pudo conectar a {host}")

    
if __name__ == "__main__":
    host = input("Direccion ip: ")           
    
    ping(host)
