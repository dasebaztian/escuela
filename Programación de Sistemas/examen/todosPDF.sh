#!/usr/bin/env bash
ayuda() {
	echo "TodosPDF.sh directorio [directorioN]"
	echo "Parámetros: "
	echo "Parámetros: "
	echo "	-directorio: Un directorio sobre el que se quieren imprimir los pdfs"
	echo "	-directorioN: Cantidad N de directorios sobre los que también se quiere buscar"	
}


procesar_directorio() {
	local dir_base=$1
	for sub_dir in "$dir_base/"*.pdf; do
		echo "$sub_dir";
	done
	
}

test -d "$1" || { echo "Debes de pasar al menos un directorio" ; ayuda ; exit 1 ; }
params=( "$@" );


directorios=( ${params[@]: 0} )


for dir in " ${directorios[@]} "; do
	if test -d $dir; then
		procesar_directorio $dir
	fi
done
