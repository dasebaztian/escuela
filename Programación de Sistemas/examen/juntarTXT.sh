#!/bin/bash

ayuda() {
	echo "juntarTXT.sh directorioBase directorioDestino"
	echo "juntarTXT.sh recorre el directorio base buscando archivos con extensión txt, cuando encuentra alguno toma su contenido y lo guarda"
	echo "Parámetros: "
	echo "	-directorioBase:  Directorio sobre el cual se leeran los archivos txt"
	echo "	-directorioDestino: Directorio sobre el cual se creara el archivo fusion.txt"
}

opcionR=""
while getopts ":rh" opt; do
    case $opt in
	r)
	    opcionR="1";
	    ;;
	h)
	    ayuda;
	    exit;
	    ;;
	
	"?")
	    echo "Opción inválida -$OPTARG";
	    ayuda;
	    exit 1;
	    ;;
    esac
done

shift $((OPTIND-1)) #borrar todos los params que ya procesó getopts

buscar_txt_directorio() {
    local directorio="$1"
    local directorioDest="$2"
    mkdir -p "$directorioDest$directorio"
    for archivo in "$directorio"/*.txt; do
		if test -f "$archivo"; then
			while read -r linea; do
			    echo "$linea" >> "$directorioDest$directorio/fusion.txt";
			done < "$archivo"
		 fi
    done
}

function procesar_directorios {
    local directorio="$1";
    local directorioDest="$2"
    buscar_txt_directorio "$directorio" "$directorioDest"
    for sub_dir in "$directorio"/*; do
		test -d "$sub_dir" && procesar_directorios "$sub_dir" "$directorioDest"
    done
}

test -d "$1" || { echo "El primer parámetro debe de ser un directorio" ; ayuda ; exit 1 ; }
test -d "$2" || { echo "El segundo parámetro debe de ser un directorio" ; ayuda ; exit 1 ; }

if test "$opcionR"; then 
	procesar_directorios "$1" "$2"
	echo "entre en recursiva"
else
	buscar_txt_directorio "$1" "$2"
	echo "Entre sin recursiva"
fi
