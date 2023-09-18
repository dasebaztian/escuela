#!/bin/bash

test -f "$1" || exit 1 
archivo="$1"
while read -r linea; do
	usuario=$("echo $linea | cut -d : -f 1")
	shell=$("echo $linea | cut -d : -f 2")
	home=$("echo $linea | cut -d : -f 3")
	adduser "$usuario" --shell "$shell" --home "$home"
	exit 0
	
done< "$archivo"
