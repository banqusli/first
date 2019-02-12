#!/bin/bash

FILE=$1

while read LINE
  do
    echo $LINE
  done < $FILE

exit 0
