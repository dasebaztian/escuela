#!/bin/bash

directorio="$1"
cadena="$2"
# Validación de parametros
test -d "$directorio" || { echo "El primer parámetro debe de ser un directorio"; exit 1; }

test "$2" || { echo "Se esperaban al menos dos parámetros"; exit 1; }

for archivo in $(ls $directorio);do
	if test -f "$directorio/$archivo"; then
		cat "$directorio/$archivo" | grep "$cadena"  &> /dev/null && echo "$archivo"
	fi
done
