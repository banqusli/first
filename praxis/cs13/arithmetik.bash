#!/bin/bash

# Arithmetik mit expr
RESULT=`expr $1 "$2" $3`

# Arithmetik mit bash
RESULT2=$(($1 $2 $3))

# Arithmetik mit Gleitkomma (bc)
RESULT3=`echo "scale=2; $1 $2 $3" | bc -l`
RESULT4=`echo "scale=2; $1 $2 $3" | bc -l | tr "." ","`


echo "EXPR:  $1 $2 $3 = $RESULT"
echo "BASH:  $1 $2 $3 = $RESULT2"
echo "BC  :  $1 $2 $3 = $RESULT3"
echo "       $1 $2 $3 = $RESULT4"
exit 0
