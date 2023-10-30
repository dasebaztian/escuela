#!/home/dasebaztian/Analisis/bin/python3.11
import http.server
import socketserver
import socket
handler = \
        http.server.SimpleHTTPRequestHandler

with socketserver.TCPServer(
    ('0.0.0.0', 8000), handler) as httpd:
    httpd.serve_forever()
