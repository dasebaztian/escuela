#!/bin/bash

directory="$1"
contenido="$2"

if test "$2";then
	for archivo in $(ls $directory);do
		if grep "$contenido" "$directory/$archivo"; then
			echo "$archivo"
			fi
	done
else
	echo "Se esperaban al menos dos parametros"
fi
