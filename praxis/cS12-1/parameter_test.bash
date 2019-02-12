#!/bin/bash
# Test, ob Passwort übergeben

if [ -z $1 ]
  then
    echo -n "Bitte Passwort eingeben: "
    read -s PASSWORD
  else
    PASSWORD=$1
  fi

echo "Das Passwort lautet: "$PASSWORD

exit 0
