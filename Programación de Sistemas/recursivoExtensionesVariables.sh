#!/usr/bin/env bash

ayuda() {
    echo "cambiarExtension.sh  [-r] [extensiones...] extensiónFinal directorio"
    echo "Cambia de forma recursiva los archivos con ext1 por ext2 en directorio"
    echo "Parámetros:"
    echo "   directorio: directorio base a procesar"
    echo "	 extensiones: Minimo una extensión a cambiar"
    echo "	 extensiónFinal: Es la extensión a la que se desea cambiar las demás"
    echo "Opciones:"
    echo "   -r: hacer el proceso recursivo"
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

shift $((OPTIND-1))

agregar_nueva_ext() {
    local archivo="$1"
    local ext_final="$2"
    echo "${archivo%.*}.$ext_final"
}

cambiar_exts_directorio() {
    local directorio="$1"
    local ext1="$2"
    local ext_final="$3"
    for archivo in "$directorio"/*."$ext1"; do
		if test -f "$archivo"; then
			nuevo_nombre=$(agregar_nueva_ext "$archivo" "$ext_final")
			mv "$archivo" "$nuevo_nombre"
		 fi
    done
}

function procesar_directorios {
    local dir_base="$1";
    local ext1="$2";
    local ext_final="$3";
    cambiar_exts_directorio "$dir_base" "$ext1" "$ext_final";
    for sub_dir in "$dir_base"/*; do
2		test -d "$sub_dir" && procesar_directorios  "$sub_dir" "$ext1" "$ext_final"
    done
}

params=( "$@" )

directorio=${params[@]: -1}
ext_final=${params[@]: -2: 1}
longitud=${#params[@]}

let conteo=longitud-2

extensiones=( ${params[@]: 0: conteo})
echo "Directorio: $directorio"
echo "Extensión final: $ext_final"

test -d "$directorio" || { echo "El último parámetro debe ser un directorio"; ayuda ; exit 1; }


if test "$opcionR"; then
	for extension in "${extensiones[@]}"; do
    	procesar_directorios "$directorio" "$extension" "$ext_final"
    done
else
	for extension in "${extensiones[@]}"; do
    	cambiar_exts_directorio "$directorio" "$extension" "$ext_final"
    done
fi




