#!/bin/bash
params=( "$@")
contador=0
for param in ${params[@]}; do
	let contador=contador+$param
done


echo $contador
