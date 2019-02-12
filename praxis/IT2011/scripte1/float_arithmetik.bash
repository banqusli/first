#!/bin/bash
# Arithmetik mit Gleitkommazahlen

# scale legt die Nachkommastellen fest
ERGEBNIS=`echo "scale=2; "$1" "$2" "$3 | bc -l`

echo $1" "$2" "$3" = "$ERGEBNIS

exit 0
