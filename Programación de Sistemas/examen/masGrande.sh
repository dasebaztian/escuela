#!/bin/bash
ayuda() {
	echo "masGrande.sh directorio";
	echo "masGrande.sh Imprime en pantalla el archivo mas grande de un directorio dado"
	echo "Parámetros: ";
	echo "	-directorio: Directorio del cual se obtendra el archivo más grande";
}

count=0
directory="$1"
maximo=1
test -d "$directory" || { echo "El primer parámetro debe de ser un directorio" ; ayuda ; exit 1 ; }

for entry in $(ls $directory -S);do
	test $count -lt $maximo && echo "El archivo mas grande en el directorio $directory es : $entry"	
	let count=count+1
done
