#!/usr/bin/env bash

ayuda() {
    cat << EOF
fechaArchivosModificados.sh directorio
Te dice que archivos han sido modificados del directorio que se ha especificado
el proceso es recursivo
Parámetros:
   archivo: es un archivo que existe
EOF
}


calculoTiempo() {
	local archivo="$1" 
	fechaM="$(stat "$archivo" | grep -Po "^Modificación. \K[^.]+")"
	pasado=$(date --date="$fechaM" +"%s")
	presente=$(date +"%s")
	let dif=presente-pasado
	echo $dif
	if [ $dif -le 3600 ]; then
		echo "ya entre"		
	fi
}

archivo="$1"
calculoTiempo $archivo
#test -f "$archivo" || { ayuda; exit 1; }

#fechaM=$(stat "$archivo" | grep -Po "^Modificación. \K[^.]+")
#echo "$fechaM"
