#!/bin/bash
# Parameterübergabe
echo "0.  Parameter : "$0
echo "1.  Parameter : "$1
echo "2.  Parameter : "$2
echo "3.  Parameter : "$3
echo "4.  Parameter : "$4
echo "5.  Parameter : "$5
echo "6.  Parameter : "$6
echo "7.  Parameter : "$7
echo "8.  Parameter : "$8
echo "9.  Parameter : "$9
shift 9			    # Parameter $1 ist jetzt (9+1)=10
echo "10. Parameter : "$1  # (9+1)=10
MYPAR11=$2		   # (9+2)=11
echo "11. Parameter : "$MYPAR11   # (9+2)=11  
exit 0


