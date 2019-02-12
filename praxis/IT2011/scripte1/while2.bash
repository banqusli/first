#!/bin/bash
FILE=$1
i=1

while read LINE
  do
    echo $i":  "$LINE
    let i=(i +  1)
  done < $FILE

exit 0
