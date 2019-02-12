#!/bin/bash
MYDIR=for_test

mkdir $MYDIR

for i in eins zwei drei vier 5 6
  do
    mkdir $MYDIR"/"$i
  done

exit 0
