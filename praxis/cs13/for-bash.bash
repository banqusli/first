#!/bin/bash

# spezifisch bash:
## for ((i=1;i<=10;i++)) 	# inkrement
## for ((i=10;i>=1;i--))	# dekrement
## for ((i=0;i<=20;i=i+3))	# um 3 erhöhen
for ((i=0;i<=20;i+=3)) 		# Kurzform um 3 erhöhen
  do
    echo $i
  done

exit 0
