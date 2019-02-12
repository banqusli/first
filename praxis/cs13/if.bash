#!/bin/bash

if [ -z $1 ]
  then
    echo -n "Bitte Verzeichnisname eingeben: "
    read DIR	# für Passwörter: read -s PASSWORD; echo ""
  else
    DIR=$1
  fi

if [ ! -d $DIR ]
  then
    if ( mkdir $DIR 2> /dev/null )
      then
        echo "Verzeichnis $DIR erfolgreich angelegt."
      else
        echo "Fehler beim anlegen von $DIR!!!!"
      fi
  else
    echo "Verzeichnis $DIR existiert bereits."
  fi

exit 0
