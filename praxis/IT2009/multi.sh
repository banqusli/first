#!/bin/bash

A=$1
B=$2

RESULT=$A

for ((i=A+1; i<=B; i++))
  do
    let RESULT=( $RESULT * $i)
  done

echo "Ergebnis : "$RESULT
exit 0
