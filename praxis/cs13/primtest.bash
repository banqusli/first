#!/bin/bash
ZAHL=$1 # Kommandozeilenparameter sichern

function primtest {
  k=$1 		# Parameter sichern
  PRIM=1	# 1 Primzahl 0 keine Primzahl
  if [ $k -gt 2 ] && [ $(( $k % 2 )) -eq 0 ] || [ $k -le 1 ]  
	# Zahl k>2 und k Mod 2 = 0 ODER Zahl <= 1  --> keine Primzahl
    then
      PRIM=0	# --> keine Primzahl
    else
      TESTMAX=`echo "scale=0; sqrt($k)" | bc -l`  # bis Wurzel k testen
      for ((i=3;i<=$TESTMAX;i+=2))  # nur ungerade Zahlen testen
        do
          if [ $(( $k % $i )) -eq 0 ]  # Divisionsrest 0 --> Teiler gefunden
            then
              PRIM=0	# keine Primzahl, da teilbar
              break	# ein Teiler reicht
            fi
        done 
    fi
  return $PRIM # Rückgabewert der Funktion setzten
}

# Hauptprogramm

primtest $ZAHL	# Funktion primtest aufrufen
echo "Primzahl ja/nein: $?"	# Rückgabewert der Funktion im Return-Value

exit 0
