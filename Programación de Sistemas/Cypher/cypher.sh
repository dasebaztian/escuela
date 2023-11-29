#!/bin/bash

ayuda() {
cat << EOF
cypher.sh directorio
Párametros:
Directorio: Directorio que se va cifrar recursivamente
Este script cifra recursivamente un directorio, usando contraseñas generadas aleatoriamente
por cada archivo, las contraseñas se guardan en un archivo cifrado por una contraseña maestra
en la ruta en la que se ejecuta el script		
EOF
}
directorio="$1"
ruta_ejecucion="${0%/*}"
test -d "$directorio" || { echo "El primer parámetro debe de ser un directorio"; ayuda; exit 1; }

recursiva() {
    dir_base="$1";
    for sub_dir in "$dir_base"/*; do
	test -d "$sub_dir" && recursiva "$sub_dir"
	file_pass=$(tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 10)
	export file_pass
	echo "$sub_dir|$file_pass" >> "$ruta_ejecucion/passwords.txt"
	ccrypt -e -E file_pass "$sub_dir"
    done
}

main() {
	read -p "Contraseña maestra para desencriptar el archivo de contraseñas: " -s contra
	export contra
	echo "$contra"
	recursiva "$directorio"
}

main
