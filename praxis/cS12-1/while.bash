#!/bin/bash

FILE=$1

while read LINE
  do
    echo $LINE
    sleep 1
  done < $FILE

exit 0
