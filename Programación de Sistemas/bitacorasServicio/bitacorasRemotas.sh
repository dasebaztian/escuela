#!/usr/bin/env bash

ayuda() {
    echo "bitacorasRemotas.sh servicio credenciales"
    echo "Parámetros:"
    echo "   -servicio: es un servicio gestionado mediante systemd"
    echo "   -credenciales: archivo de texto con la siguiente estructura por línea: usuario:dominio:puerto:contraseña"
}

credenciales="$1"
read -p "Contraseña para desencriptar: " -s contra
export contra

test -f "$credenciales" || { echo "El segundo parátro debe ser un archivo"; ayuda; exit 1; }

ruta_ejecucion="${0%/*}"

while read -r linea; do
    usuario=$(echo "$linea" | cut -d : -f 1)
    dominio=$(echo "$linea" | cut -d : -f 2)
    puerto=$(echo "$linea" | cut -d : -f 3)
    pass=$(echo "$linea" | cut -d : -f 4)
    "$ruta_ejecucion/remoto.exp" "$ruta_ejecucion/sacarBitacora.sh" "$usuario" "$dominio" "$puerto" "$pass"

done < <(ccrypt -d -c -E contra "$credenciales")


