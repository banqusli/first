#!/bin/bash
if [ -z "$1" ] ; then echo -n "Zahl A : "; read A; else A=$1; fi
if [ -z "$2" ] ; then echo -n "Operator : "; read OP; else OP=$2; fi
if [ -z "$3" ] ; then echo -n "Zahl B : "; read B; else B=$3; fi

echo -n "$A "
RESULT=$A
for ((i=$A+1; i<=$B; i++))
  do
    RESULT=$(($RESULT $OP $i))
    echo -n "$OP $i "
    done

echo "= $RESULT"

exit 0
