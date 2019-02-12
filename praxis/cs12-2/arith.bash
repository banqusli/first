#!/bin/bash

# RESULT=`expr $1 $2 $3`
# let RESULT=($1 $2 $3)
# RESULT=$(( $1 $2 $3 ))
RESULT=`echo "scale=2; $1 $2 $3" | bc -l | tr "." ","`

echo "$1 $2 $3 = $RESULT"

exit 0
