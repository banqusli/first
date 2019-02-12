#!/bin/bash
ZAHL=$1 # Kommandozeilenparameter sichern

function primtest {
  k=$1 # die zu testende Zahl
  PRIM=1 # 1 Primzahl 0 keine Primzahl
  if [ $k -gt 2 -a 0 -eq $(( $k % 2 )) ] # Zahl k>2 und k Mod 2 = 0
    then
      PRIM=0 # --> keine Primzahl
    else
        TESTMAX=`echo "scale=0; sqrt($k)" | bc -l`
        for ((i=3;i<$TESTMAX;i+=2))	# nur ungerade Zahlen testen, 2 oben getestet
          do
            if [ 0 -eq $(( $k % $i )) ] # Divisionsrest 0 --> Teiler gefunden
              then
                PRIM=0 # keine Primzahl
                break # ein Teiler reicht
              fi
          done
    fi
  return $PRIM # Rückgabewert der Funktion setzen
} # end function primtest
# "Hauptprogramm"

echo 2
for ((j=3;j<=$ZAHL;j+=2)) 
do
    if ! primtest $j
      then
        echo $j
      fi
  done
exit 0
