#!/bin/bash

if [ ! -d $1 ]
  then
    if ! mkdir $1 &> /dev/null  # stdout stderr nach /dev/null umleiten
      then
        echo "Verzeichnis "$1" konnte leider nicht angelegt werden."
        exit 1  # Script mit Fehler beenden
      fi
  fi

echo "Verzeichnis erfolgreich angelegt"
exit 0
