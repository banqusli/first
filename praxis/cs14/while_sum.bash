#!/bin/bash

SUM=0
N=1
while [ $N -le $1 ]
  do
    SUM=$(($SUM + $N))
    N=$(($N + 1))
    done

echo "Summe der Zahlen von 1 bis $1 = $SUM"

exit 0
