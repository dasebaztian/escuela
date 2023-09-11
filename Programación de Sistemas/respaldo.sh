#!/bin/bash

## Script que crea un respaldo de un archivo de texto añadiendo
## al respaldo el nombre del usuario que creó el respaldo
archivo="$1"
ruta_destino="$2"
solo_nombre="$(basename $archivo)"
fecha=$(date +%Y-%m-%d)
ruta_destino_completa="$ruta_destino/$solo_nombre$fecha"

echo "$USER" > /tmp/user.txt
cat /tmp/user.txt $archivo > $ruta_destino_completa

