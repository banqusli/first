#!/bin/bash

# RESULT=`echo "scale=4; $1 $2 $3" | bc -l`
RESULT=`echo "scale=4; $1 $2 $3" | bc -l | tr "." ","`

echo "$1 $2 $3 = $RESULT"

exit 0
