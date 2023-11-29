#!/usr/bin/env bash

# script que queremos que se ejecute en los servidores remotos

usuario="$1"
dominio="$2"
puerto="$3"

echo "Bitacoras de dominio $dominio"
ssh $usuario@$dominio -p $puerto apt update -y
echo "--------------"
echo ""
