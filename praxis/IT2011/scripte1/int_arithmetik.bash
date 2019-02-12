#!/bin/bash
# Arithmetik mit ganzen Zahlen

# ERGEBNIS=`expr $1 "$2" $3` # mit Befehl expr
let ERGEBNIS=($1 $2 $3)      # nur bash
let "ERGEBNIS=$1 $2 $3"      # nur bash


echo $1" "$2" "$3" = "$ERGEBNIS

exit 0
