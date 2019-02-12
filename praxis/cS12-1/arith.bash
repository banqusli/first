#!/bin/bash
# Arithmetik in der Shell

A=$1
OP=$2
B=$3

# RESULT=`expr $A "$OP" $B`
# let RESULT=($A $OP $B)
# RESULT=$(($A $OP $B))
# RESULT=$((A $OP B))    # dereferenzieren in (( nicht notwendig
RESULT=`echo "scale=2; $A $OP $B" | bc -l | tr "." ","`

echo "$A $OP $B = $RESULT"

exit 0
