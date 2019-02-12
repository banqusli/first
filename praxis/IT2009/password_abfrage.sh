#!/bin/bash
# Passwort abfragen, wenn nicht als Parameter übergeben

if [ -z $1 ]  # ausführen, wenn $1 leer ist
  then
    echo -n "Bitte Passwort eingeben: "
    read -s PASSWORD	# -s --> silent
    echo ""   # Zeilenvorschub nach silent read
  else	      # Passwort wurde übergeben
    PASSWORD=$1
  fi

echo "Eingegeben wurde: "$PASSWORD

exit 0
