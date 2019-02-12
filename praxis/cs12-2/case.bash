#!/bin/bash
SERVICE="xeyes"
SERVICE_BIN="/usr/bin/xeyes"
PARAMETER=$1
PID_FILE="xeyes.pid"

function status {
  if [ -s $PID_FILE ]
    then
      # PID=`cat $PID_FILE`
      read PID < $PID_FILE
      if [ -z "`ps | grep $PID`" ] # wenn keine PID gefunden --> dead
        then
          return 1 # 1 = dead
        else
          return 0 # 0 = running
       fi
    else
      return 2 # 2 = not running
    fi
} # end function status

case $PARAMETER in
  start)
    echo "Service $SERVICE starten ..."
    status
    if [ $? -eq 0 ] # nur starten, wenn not running
      then
        echo "Service $SERVICE läuft schon!"
        exit 1 # mit Fehler beenden
      fi
    $SERVICE_BIN &
    echo $! > $PID_FILE
    ;;
  stop)
    echo "Service $SERVICE anhalten ..."
    status
    if [ $? -ne 0 ] # nur beenden, wenn running
      then
        echo "Service $SERVICE läuft nicht!"
        exit 1 # mit Fehler beenden
      fi
    read PID < $PID_FILE
    kill -TERM $PID
    rm $PID_FILE
    ;;
  status)
    echo "Service $SERVICE Status bestimmen ..."
    status
    case $? in
      0) echo "Service $SERVICE is running"
         exit 0 ;;
      1) echo "Service $SERVICE is dead"
         exit 1 ;;
      2) echo "Service $SERVICE is not running"
         exit 2 ;;
      esac
    ;;
  *)
    echo "Usage: $0 { start | stop | status }"
    ;;
  esac

exit 0
