import socket
from cryptography.fernet import Fernet

def receive_file(filename, key):
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.bind(('0.0.0.0', 12345))  # Escucha en todas las interfaces en el puerto 12345
    server_socket.listen(1)  # Espera una conexión

    print("Esperando conexión...")
    client_socket, client_address = server_socket.accept()
    print(f"Conexión aceptada desde {client_address}")

    with open(filename, 'wb') as file:
        while True:
            data = client_socket.recv(1024)
            if not data:
                break
            file.write(data)

    client_socket.close()
    server_socket.close()
    print("Archivo recibido con éxito")

if __name__ == "__main__":
    key = Fernet.generate_key()
    receive_file("archivo_recibido.txt", key)

