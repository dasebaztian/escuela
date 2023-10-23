#!/bin/bash

ayuda() {
	echo "levantarInterfaces.sh";
	echo "script que levanta todas las interfaces de red en el sistema";
}

obtenerInterfaces() {
	local interfaces=$(sudo ifconfig | grep -E -o "^[a-z][a-z0-9]+");
	local arr_interfaces=( )
	for elemento in "${interfaces[@]}"; do
	    arr_interfaces+=( $elemento )
	done

	for interfaz in "${arr_interfaces[@]}"; do
		sudo ifconfig $interfaz up
		echo "levante $interfaz"
	done
}

obtenerInterfaces

