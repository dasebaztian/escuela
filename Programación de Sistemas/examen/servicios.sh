#!/usr/bin/bash

ayuda() {
	echo "servicios.sh servicio1 servicio2"
	echo "Parámetros: "
	echo "	-servicio1 Primer servicio que se interesa levantar"
	echo "	-servicio2 Segundo servicio que se interesa levantar"
	echo "El script intenta iniciar el primer servicio (mediante systemctl start), de haber un error al iniciar, intenta levantar el servicio en el segundo parámetro. De no poderse iniciar ningún servicio se debe imprimir un mensaje de error."
}


iniciarServicio() {
	local servicio="$1"
	echo "$servicio"

	if systemctl start "$servicio"; then
	 	return 0
	else
	 	return 1
	fi
}

test $2 || { echo "Tienes que pasar dos parámetros" ; ayuda ; exit 1 ; }

if iniciarServicio "$1"; then
	echo ""
else
	if iniciarServicio "$2"; then
		echo ""
	else
		echo "----------------------------"
		echo "No se inicio ningun servicio"
		echo "----------------------------"
	fi
	
fi
