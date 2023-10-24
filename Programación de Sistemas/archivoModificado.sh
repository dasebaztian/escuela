#!/usr/bin/env bash
ayuda() {
cat << EOF
archivoModificado.sh
Regresa los archivos de un directorio que han sido modificados en la ultima hora
Parámetros:
	directorio: directorio que existe, en donde se analizaran los archivos
EOF
}
ayuda

calculoTiempo() {
	local archivo
	fechaM="$(stat "$archivo" | grep -Po "^Modificación. \K[^.]+")"
	pasado=$(date --date="$fechaM"+"%s")
	presente=$(date +"%s")
	let dif=presente-pasado
	echo dif
	let tiempoFinal=$dif/3600
	echo tiempoFinal
	#if tiempo final menor a 3600 imprimir nombre del archivo
}

archivo=/home/vanessagrapain/programacionRedes/comprimirR.sh
fechaM=$(stat "$archivo" | grep -Po "^Modificación. \K[^.]+")
echo "$fechaM"
#directorio="$1"


