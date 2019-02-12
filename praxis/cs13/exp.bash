#!/bin/bash
x=$1
jmax=$2
genauigkeit=$3

function fak {
  n=$1
  n_fak=1
  if [ $n -ge 2 ]
    then
      for ((i=2;i<=$n;i++))
        do
          n_fak=`echo "scale=0; $n_fak * $i" | bc -l`
          done
    fi
  #return $n_fak
}

x_exp=0
for ((j=0;j<=$jmax; j++))
  do
    fak $j
    r_glied=`echo "scale=15; $x ^ $j / $n_fak" | bc -l`
    x_exp=`echo "scale=15; $x_exp + $r_glied" | bc -l`
    if [ `echo "scale=15; $r_glied <= $genauigkeit" | bc -l` -eq 1 ]
      then
        echo "Reihenglieder 0 bis $j berechnet"
        break
        fi
    done

echo "e^$X = $x_exp"
exit 0
