#!/bin/bash

ayuda() {
    cat << EOF
fechaArchivosModificados.sh directorio segundos
Te dice que archivos han sido modificados del directorio que se ha especificado
el proceso es recursivo
Parámetros:
   directorio: Es un directorio sobre el que se va a escanear los archivos
   segundos: Es el tiempo en segundos sobre el que se quiere saber los archivos modiicados
EOF
}


calculoTiempo() {
	local archivo="$1" 
	local segundos="$2"
	fechaM="$(stat "$archivo" | grep -Po "^Modificación. \K[^.]+")"
	pasado=$(date --date="$fechaM" +"%s")
	presente=$(date +"%s")
	let dif=presente-pasado
	let segundos=segundos
	if [ $dif -le $segundos ]; then
		echo "$archivo Fue modificado hace: $dif segundos"
	fi
}

recursivo(){
	local directorio="$1"
	local segundos="$2"
	for archivo in "$directorio"/*; do
		test -f "$archivo" && calculoTiempo "$archivo" "$segundos"
		test -d "$archivo" && recursivo "$archivo" "$segundos"	
	done 
}

directorio="$1"
segundos="$2"
test -d "$directorio" || { echo "El primer parámetro debe de ser un directorio" ; ayuda ; exit 1 ; }
test "$segundos" || { echo "El segundo parámetro no puede estar vacio" ; ayuda ; exit 1 ; }
recursivo "$directorio" "$segundos"

