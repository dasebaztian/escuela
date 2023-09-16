#!/bin/bash

# Hacer un script que recibe un directorio e imprime cuántos
# subdirectorios hay en ese directorio
# - validar parámetros
# - usar for e if

directory=$1
count=0
test -d "$directory" || { echo "El primer paráametro debe ser un directorio"; exit 1;}
test !"$2" || { echo "Solo se acepta un parámetro"; exit 1;}
for entry in $(ls $directory);do
	if test -d "$directory/$entry"; then
		let count=count+1
	fi
done
echo "La cantidad de subdirectorios fue de: $count"
exit 0
