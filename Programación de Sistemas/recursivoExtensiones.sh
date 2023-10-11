#!/bin/bash

ayuda() {
	echo "comprimeRecursivo.sh directorio archivoDestino"
	echo "==============================="
	echo "Parámetros: "
	echo " -directorio: Directorio que contiene los archivos a comprimir"
	echo " -primera extensión: Es la extensión de los archivos que se desea cambiar"
	echo " -segunda extensióm: Es la extensión de los archivos por la que se desea cambiar"	
}

test -d "$1" || { echo "El primer parámetro debe de ser un directorio"; ayuda ; exit 1 ; }
test -n "$2" || { echo "El segundo parámetro no puede estar vació" ; ayuda ; exit 1 ; }
test -n "$3" || { echo "El tercer parámetro no puede estar vació"; ayuda ; exit 1 ; }

sin_recursiva() {
	local dir_base="$1"
	local param2="$2"
	local param3="$3"
	for archivo in "$dir_base"/*; do
		a_mover=${archivo%.$param2}; 
		mv "$a_mover.$param2" "$a_mover.$param3"			
	done
	exit 0
} 

recursiva () {
    local dir_base="$1";
    local param2="$2"
    local param3="$3"
    echo "$param3"
    for archivo in "$dir_base"/*; do
		test -d "$archivo" && recursiva "$archivo" "$param2" "$param3";
		a_mover=${archivo%.$param2} 
		mv "$a_mover.$param2" "$a_mover.$param3";		
    done
    exit 0
}

recursiva "$1" "$2" "$3"
