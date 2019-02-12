#!/bin/bash

Z=$1  # wird dem Script übergeben

function QUADRAT {
  X_SQR=$(( $1 * $1 ))  # $1 ist hier der erste Parameter der Funktion
  return $X_SQR
  }

QUADRAT $Z   # Funktion mit Parameter aufrufen
echo "Versaut den Rückgabewert"
echo "Das Quadrat von $Z ist: $?"   	# Ergebnis steht im Rückgabewert der Funktion
					# dieser ist ein UNSIGNED INT_8 --> 0 ... 255
echo "Quadrat von $Z mit globaler Variable: $X_SQR"

exit 0
