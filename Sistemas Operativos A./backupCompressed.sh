#!/bin/bash

test -f $1 || exit 1

file="$1"
fecha=$(date +%d-%m-%Y)
hour=$(date +%H-%M-%S)
full="$file$fecha$hour.gzip"
tar -cvf $full $file
