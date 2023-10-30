
#Servidor
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


#cliente
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
    server_ip = "192.168.1.100"  # Cambia esto a la dirección IP del servidor
    key = Fernet.generate_key()  # Genera una clave para la encriptación
    send_file("archivo_a_enviar.txt", server_ip, key)
