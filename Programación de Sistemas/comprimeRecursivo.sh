ayuda() {
	echo "comprimeRecursivo.sh directorio archivoDestino"
	echo "==============================="
	echo "Parámetros: "
	echo " -directorio: Directorio que contiene los archivos a comprimir"
	echo " -archivoDestino: Nombre del archivo comprimido destino"	
}

test -d "$1" || { echo "El primer parámetro debe de ser un directorio" ; ayuda; exit 1 ; }
test -n "$2" || { echo "El segundo parámetro no puede estar vació"; ayuda; exit 1 ; }

recursiva() {
    local dir_base="$1";
    local archivo_final="$2"
    for sub_dir in "$dir_base"/*; do
		test -d "$sub_dir" && recursiva "$sub_dir" "$archivo_final"
		test -f && zip -u "$archivo_final" "$sub_dir";
    done
}

recursiva "$1" "$2"
