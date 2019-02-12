#!/bin/bash
# Test auf Primzahl

n=$1

### function primtest ###
function primtest {
  PRIM=0
  k=$1

  if [ $k -gt 2 -a 0 -eq $(( $k % 2 )) ]  # Rest der Division durch 2 = 0 --> keine Primzahl
    then
      PRIM=1  # d.h. keine Primzahl
    else 	    # Test nur, wenn Zahl ungerade
      nTest=`echo "scale=0; sqrt("$k")" | bc -l`
      # echo "bis "$nTest" wird getestet" 
      for ((i=3;i<=$nTest;i+=2))
        do
          if [ 0 -eq $(( $k % $i )) ]  # Rest der Division = 0 --> keine Primzahl
            then
              # echo $k" ist keine Primzahl, erster Teiler ist "$i
              PRIM=1	# d.h. keine Primzahl
              break
            fi
        done
  fi
}
### end function primtest ###

### Testschleife ###
echo "2" # teste nur ungerade Zahlen
for ((j=3;j<=n;j+=2))
  do
    primtest $j
    if [ $PRIM -eq 0 ]; then echo $j; fi
  done

exit 0
