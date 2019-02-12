#!/bin/bash

case $1 in
  start) 
    echo "Service *grmpf* starten..."
    ;;
  stop)
    echo "Service *grmpf* anhalten..."
    ;;
  status)
    echo "Status bestimmen ..."
    ;;
  *) 
    echo "Usage: "$0" { start | stop | status }"
    ;;
esac

exit 0
