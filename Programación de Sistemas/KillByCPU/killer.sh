#!/bin/bash

limite="$1"
usuario="$2"
dominio="$3"
puerto="$4"

ssh $usuario@$dominio -p $puerto bash -s < finish.sh "$limite"
