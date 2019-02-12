#!/bin/bash
# Test auf Primzahl

n=$1
PRIM=0

if [ $n -gt 2 -a 0 -eq $(( $n % 2 )) ]  # Rest der Division durch 2 = 0 --> keine Primzahl
  then
    PRIM=1  # d.h. keine Primzahl
  else 	    # Test nur, wenn Zahl ungerade
    nTest=`echo "scale=0; sqrt("$n")" | bc -l`
    echo "bis "$nTest" wird getestet" 
    for ((i=3;i<=nTest;i+=2))
      do
        if [ 0 -eq $(( $n % $i )) ]  # Rest der Division = 0 --> keine Primzahl
          then
            # echo $n" ist keine Primzahl, erster Teiler ist "$i
            PRIM=1	# d.h. keine Primzahl
            break
          fi
      done
  fi

# Ausgabe

if [ $PRIM -eq 0 ]
  then
    echo $n" ist eine Primzahl."
  else
    echo "Die Zahl "$n" ist leider keine Primzahl!"
  fi
