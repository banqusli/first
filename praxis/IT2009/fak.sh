#!/bin/bash
# Berechnung von n! (Fakultät)

n=$1

FAK=1

for ((i=2;i<=$n;i++))
  do
    # let FAK=( $FAK * $i) # mit Integer bei 21! Überlauf
    FAK=`echo "scale=0; "$FAK" * "$i | bc -l`
  done

echo $n"! = "$FAK

exit 0
