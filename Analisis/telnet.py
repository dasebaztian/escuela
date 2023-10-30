#!/home/dasebaztian/Analisis/bin/python3.11
import socket

print("Iniciando servidor...")
ip="148.226.80.156"
port=56789
socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
socket.bind((ip, port))
socket.listen()
mensaje=("Holaaa desde: %s" % (ip))
print(mensaje)
print("Servidor escuchando en %s:%s" % (ip, port))

while True:
    conn, addr = socket.accept()
    conn.send(mensaje.encode('UTF-8'))
    conn.send("Adios".encode('UTF-8'))
    print("Conexión recibida de:", addr)
    conn.close()
