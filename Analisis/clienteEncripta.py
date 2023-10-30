import socket
from cryptography.fernet import Fernet

def send_file(filename, server_ip, key):
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_address = (server_ip, 12345)

    client_socket.connect(server_address)
    print(f"Conectado al servidor en {server_ip}")

    with open(filename, 'rb') as file:
        while True:
            data = file.read(1024)
            if not data:
                break
            client_socket.send(data)

    client_socket.close()
    print("Archivo enviado con éxito")

if __name__ == "__main__":
    server_ip = "127.0.0.1" 
    key = Fernet.generate_key()
    send_file("ping.py", server_ip, key)
