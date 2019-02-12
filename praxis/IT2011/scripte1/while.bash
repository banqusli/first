#!/bin/bash

SUM=0; N=0
while [ $N -le $1 ]
do
SUM=`expr $SUM + $N`
N=`expr $N + 1` # Inkrement kompliziert
done
echo "Summe der Zahlen von 1 bis "$1" = "$SUM
exit 0
