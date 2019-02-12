#!/bin/bash

if [ -z $1 ]
  then
    echo -n "Bitte Verzeichnisname angeben: "
    read DIR_NAME  # Passwort: read -s PASSWORD
  else
    DIR_NAME=$1
  fi

if [ ! -d $DIR_NAME ]
  then
    if ! mkdir $DIR_NAME # Anlegen Verzeichnis scheitert
      then
        echo "Konnte Verzeichnis $DIR_NAME nicht anlegen!"
        exit 1
      fi
  else
    echo "Verzeichnis $DIR_NAME existiert schon!"
  fi

exit 0
