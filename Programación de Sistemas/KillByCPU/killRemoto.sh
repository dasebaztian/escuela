#!/bin/bash
ayuda() {
	cat << EOF
	Script que mata subprocesos que ocupen mas de cierto porcentaje en uno o varios servidore
	Parámetros:
	Porcentaje de uso: El porcentaje de uso minimo de procesador que debe de ocupar el proceso para que lo mate
	Credenciales: Un archivo que contiene las credenciales del servidor o servidores de los que se desea matar el proceso	
EOF
}

test ${#@} -eq 2 || { echo "Debes pasar 2 parámetros"; ayuda; exit 1; }

test -f "$2" || { echo "El segundo parámetro debe de ser un fichero"; exit 1; }
ruta_ejecucion="${0%/*}"
limite="$1"
credenciales="$2"

while read -r linea; do
    usuario=$(echo "$linea" | cut -d : -f 1)
    dominio=$(echo "$linea" | cut -d : -f 2)
    puerto=$(echo "$linea" | cut -d : -f 3)
    pass=$(echo "$linea" | cut -d : -f 4)
    "$ruta_ejecucion/remoto.exp" "$ruta_ejecucion/killer.sh" "$usuario" "$dominio" "$puerto" "$pass" "$limite"

done < "$credenciales"



