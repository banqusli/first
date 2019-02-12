#!/bin/bash

if [ -z $1 ]
  then
    echo -n "Bitte Verzeichnisnamen eingeben: "
    read -s DIR
    echo
  else
    DIR=$1
  fi

if [ ! -d $DIR ]
  then 
    if mkdir $DIR &> /dev/null  # stdout stderr nach /dev/null umleiten
      then
        echo "Verzeichnis $DIR erfolgreich angelegt."
      else
        echo "Konnte Verzeichnis $DIR nicht anlegen!"
        exit 1  # Script abbrechen
      fi
  else
    echo "Verzeichnis $DIR existiert schon"
  fi

exit 0
