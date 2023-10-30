#!/bin/bash

ayuda() {
 cat << EOF
respaldoCron directorioRespaldo directorioDestino
El script comprime el directorioRespaldo y lo envia al directorioDestino mediante rsync
EOF
}

comprimirYEnviar() {
	local directorioRespaldo="$1"
	local directorioDestino="$2"
	fecha=$(date)
	nombrezip="$directorioRespaldo$fecha"
	for archivo in "$directorioRespaldo"/*; do
		zip "$nombrezip" "$archivo"
	done
	rsync -avz "$nombre" "$directorioDestino"
}

directorioRespaldo="$1"
directorioDestino="$2"
test -d "$directorioRespaldo" || { echo "El primer parametro debe de ser un directorio" ; ayuda ; exit 1 ; }
test "$directorioDestino" || { echo "El segundo parámetro no puede estar vació" ; ayuda ; exit 1 ; }  

comprimirYEnviar "$directorioRespaldo" "directorioDestino"
