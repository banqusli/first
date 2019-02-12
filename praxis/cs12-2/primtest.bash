#!/bin/bash

ZAHL=$1

function primtest {
  z=$1
  PRIM=1 # 1 Primzahl 0 keine Primzahl
  if [ $z -lt 2 ]
    then
      PRIM=0 # kleiner 2 sind keine Primzahlen
      return $PRIM
    fi
  if [ $z -gt 2  -a  $(( $z % 2 )) -eq 0 ] # z < 2 ODER durch 2 teilbar
    then
      PRIM=0 # --> keine Primzahl
      return $PRIM
    fi
  MAX=`echo "scale=0; sqrt($z)" | bc -l`
  for ((i=3;i<=$MAX;i+=2))
    do
      if [ $(( $z % $i )) -eq 0 ] # Divisionsrest = 0 --> Teiler gefunden
        then
          PRIM=0 # keine Primzahl
          break # ein gefundener Teiler reicht
        fi
      done 

  return $PRIM  # Zahl zwischen 0 und 255
} # end function primtest

for ((j=0;j<=$ZAHL;j++))
  do
    primtest $j
    if [ `echo $?` -eq 1 ]
      then
        echo $j
      fi
    done

exit 0
