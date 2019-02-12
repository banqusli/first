#!/bin/bash
# Berechnung e^x
x=$1
nMax=$2
###########################
function fakultaet {
  FAK=1
  for ((i=2;i<=$n;i++))
    do
      # let FAK=( $FAK * $i) # mit Integer bei 21! Überlauf
      FAK=`echo "scale=0; "$FAK" * "$i | bc -l`
    done
}
###########################
EXP=0
for ((n=0;n<=nMax;n++))
  do
    XHOCHN=`echo "scale=8; "$x" ^ "$n | bc -l`
    fakultaet $n # damit steht n! in Variable FAK
    RGLIED=`echo "scale=8; "$XHOCHN" / "$FAK | bc -l`
    EXP=`echo "scale=8; "$EXP" + "$RGLIED | bc -l`
  done

echo "e ^ "$x" = "$EXP 
