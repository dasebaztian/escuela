#!/bin/bash

ayuda() {
	cat << EOF
reporte.sh directorio archivoDestino
Parámetros:
	directorio: Directorio del cual se quieren saber los hashes de los archivos
	ArchivoDestino: Archivo en el cual se va a guardar la correspondencia de hashes y archivos
Script que genera los hashes de un directorio y los almacena en un archivo destino, el archivo destino despues se puede usar
para verificar cambios en el directorio.
EOF
}

ayuda
