#!/bin/bash

FILE=$1
i=0
while read LINE
  do
    ((i++))
    echo "Zeile $i: $LINE"
    done < $FILE

exit 0
