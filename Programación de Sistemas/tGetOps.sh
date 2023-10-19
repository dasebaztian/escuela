#!/usr/bin/bash

opcionC=""
paramC=""
opcionB=""
opcionM=""
paramMH=""
opcionH=""
ayuda(){
	echo "MultiFuncion: Copiar, borrar o mover"
	echo "tGetOps.sh archivo [-cmb]"
	echo "Opciones: "
	echo " -c: Copiar, copia el archivo a un directorio destino, recibe el directorio destino"
	echo " -m: Mueve, Mueve el archivo a un directorio destino, recibe el directorio destino"
	echo " -b: Borrar"
	echo "Parámetros: "
	echo "Archivo: Es el archivo sobre el que se desean efectuar los cambios"
	
}
while getopts ":c:m:bh" opt; do
    case $opt in
	c)
	    opcionC="1";
	    paramC="$OPTARG";
	    ;;
	m)
	    opcionM="1";
	    paramM="$OPTARG";
	    ;;
	b)
	    opcionB="1";
	    ;;

	"?")
	    echo "Opción inválida -$OPTARG";
	    ayuda;
	    exit 1;
	    ;;
	h)
	 	ayuda;
	 	exit 0;
	 	;;
 	:)
	    echo "Se esperaba un parámetro en -$OPTARG";
	    ayuda;
	    exit 1;
	    ;;
    esac
done

shift $((OPTIND-1)) #borrar todos los params que ya procesó getopts

copiar () {
	local archivo="$1";
	local destino="$paramC";
	test -d "$destino" || exit 1;
	cp "$1" "$destino/$1"
	
}

mover () {
	local archivo="$1"
	local destino="$paramM"
	test -d "$destino" || exit 1;
	mv "$archivo" "$destino"
}

borrar () {
	local archivo="$1"
	rm "$archivo"
		
}

test "opcionC" && test "opcionM" && echo "Solo puedes usar una opción a la vez"
test "opcionM" && test "opcionC" && echo "Solo puedes usar una opción a la vez"

test "opcionM" && test "opcionB" && echo "Solo puedes usar una opción a la vez"
test "opcionB" && test "opcionM" && echo "Solo puedes usar una opción a la vez"

test "opcionC" && test "opcionB" && echo "Solo puedes usar una opción a la vez"
test "opcionB" && test "opcionC" && echo "Solo puedes usar una opción a la vez"

test -f "$1" || { echo "El primer parámetro debe ser un archivo" ; exit 1 ; }

test "$opcionC" && copiar "$1" "$paramC" && exit 0

test "$opcionM" && mover "$1" "$paramM" && exit 0

test "$opcionB" && borrar "$1" && exit 0


