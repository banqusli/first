#!/bin/bash
i=1
FILE=$1

while read LINE
  do
    echo $i": "$LINE
    let "i = i + 1"
  done < $FILE

exit 0
