#!/bin/bash

FILENAME=$1

while read LINE
  do
    echo $LINE
    sleep 1
  done < $FILENAME

exit 0
