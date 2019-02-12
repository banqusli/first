#!/bin/bash

for ((i=0;i<=9;i++))
  do
    eval echo $i": "\$$i
  done

shift 9 # jetzt stehen die Parameter 10 - 18 in $1 bis $9

for ((i=0;i<=9;i++))
  do
    eval echo $i": "\$$i
  done

# shift -9 # --> ist nicht zulässig
exit 0
