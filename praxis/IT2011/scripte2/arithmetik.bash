#!/bin/bash

# allgemein, auch andere Shells
# RESULT=`expr $1 "$2" $3`

# nur bash, quoten nicht erforderlich
let RESULT=($1 $2 $3)
# let "RESULT=$1 $2 $3"

echo $1" "$2" "$3" = "$RESULT

exit 0
