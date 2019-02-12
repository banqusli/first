#!/bin/ksh
# Arithmetik mit expr
# Alle interpretierbaren Operatoren bei Übergabe quoten!

A=$1
B=$3
OP=$2

# RESULT=`expr $A "$OP" $B`   # Operator quoten, wird sonst ggf. interpretiert
let RESULT=($A $OP $B)	      # wahrscheinlich nur bash

echo "Inhalt Variable OP: "$OP
echo $A" "$OP" "$B" = "$RESULT

exit 0
