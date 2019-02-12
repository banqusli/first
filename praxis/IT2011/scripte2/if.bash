#!/bin/bash

if [ -z $1 ]
  then
    echo -n "Bitte Passwort eingeben: "
    read -s PASSWORD
    echo
  else
    PASSWORD=$1
  fi

echo "eingegeben wurde: "$PASSWORD
exit 0
