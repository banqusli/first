#!/bin/bash

if [ -z $1 ]; then echo -n "Zahl A eingeben:   "; read A; else A=$1; fi
if [ -z $2 ]; then echo -n "Operator eingeben: "; read OP; else OP=$2; fi
if test -z $3; then echo -n "Zahl B eingeben:   "; read B; else B=$3; fi

# RESULT=`expr $A "$OP" $B`
# RESULT=$(($A$OP$B))
# RESULT=$(( A $OP B ))
# RESULT=$(( $A $OP $B ))   # meine Empfehlung
RESULT=`echo "scale=4; $A $OP $B" | bc -l | tr "." ","`

echo "$A $OP $B = $RESULT"

exit 0
