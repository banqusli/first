#!/bin/bash

if [ -z $1 ]   # wenn $1 leer ist
  then
    echo -n "Bitte Passwort eingeben : "
    read -s PASSWORD    # Passwort ohne Echo (silent) einlesen
    echo                # zeilenvorschub
  else
    PASSWORD=$1
  fi                    # if mit umgekehrtem if (fi) beenden

echo "Das Passwort lautet : "$PASSWORD
exit 0
