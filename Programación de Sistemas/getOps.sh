#!/bin/bash
opcionX=""
paramX=""
opcionY=""
while getopts ":x:y" opt; do
    case $opt in
	x)
	    opcionX="1";
	    paramX="$OPTARG";
	    ;;
	y)
	    opcionY="1";
	    ;;
	"?")
	    echo "Opción inválida -$OPTARG";
	    ayuda;
	    exit 1;
	    ;;
	:)
	    echo "Se esperaba un parámetro en -$OPTARG";
	    ayuda;
	    exit 1;
	    ;;
    esac
done

shift $((OPTIND-1)) #borrar todos los params que ya procesó getopts
