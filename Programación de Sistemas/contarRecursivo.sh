#!/usr/bin/env bash

ayuda() {
    echo "contarRecursivo.sh" directorio
    echo "Regresa el número de archivos de un directorio base, el proceso es recursivo"
    echo "Parámetros:"
    echo "   -directorio: directorio base a procesar"
}

test -d "$1" || { echo "Tienes que pasar un directorio"; ayuda; exit 1; }


function contar_archivos {
    local dir="$1";
    local contador=0;
    for archivo in "$dir"/*; do
	test -f "$archivo" && let contador=contador+1
    done
    echo "$contador";
}

function recursiva {
    dir_base="$1";
    local contador=$(contar_archivos "$dir_base");
    let contador_global=contador_global+contador;
    for sub_dir in "$dir_base"/*; do
	test -d "$sub_dir" && recursiva "$sub_dir"
	
    done
}

contador_global=0
directorio="$1"
recursiva "$directorio"
echo "$contador_global"
