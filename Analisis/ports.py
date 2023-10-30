#!/home/dasebaztian/Analisis/bin/python3.11

import socket
import time

def check_ports(ip_address, port):
    try:
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(1)
        
        result = sock.connect_ex((ip_address, port))

        if result == 0:
            print(f"Puerto {port} abierto en {ip_address}")
            
        sock.close()

    except socket.error as e:
        print(f"Error al realizar el ping: {ip_address}")


def check_all_ports(ip_address):
    try:
        for i in range(1,65535):
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sock.settimeout(1)
            result = sock.connect_ex((ip_address, i))
            if result == 0:
                print(f"Puerto {i} abierto en {ip_address}")                
            sock.close()
                
    except socket.error as e:
            print(f"Error al realizar el ping: {ip_address}")

if __name__ == "__main__":
    ip_address = input("Ingresa la dirección IP a la que deseas hacer ping: ")
    # port = int(input("Ingresa el número de puerto: "))

    check_all_ports(ip_address)
