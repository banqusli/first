#!/bin/bash
PARM0=$0
PARM1=$1
PID_FILE=./pid_file
PROG=/usr/bin/xeyes

function status() {
  if [ -f $PID_FILE ]  # existiert PID-File?
    then
      read PID < $PID_FILE
      # echo "$PID_FILE existiert"
      if ps -p $PID > /dev/null  # liefert 0 wenn PID existiert
        then
          # echo "$PID existiert"
          return 0       # Prozess läuft (running)
        else
          return 2       # Prozess gestorben (dead) 
        fi
    else
      return 1           # Prozess angehalten (stop)
    fi
}

case $PARM1 in
  start) 
    echo "Service $PROG starten..."
    # Prozess starten und PID-File mit PID des Prozesses anlegen
    # nur wenn Status stop oder dead
    if  ! status  # nur starten, wenn Status nicht 0
      then
        $PROG & >> /dev/null # Prozess starten
        echo $! > $PID_FILE  # PID in File schreiben
        echo "gestartet"
        exit 0
      else
        echo "Service $PROG läuft bereits"
        exit 1
      fi
    ;;
  stop) 
    echo "Service $PROG anhalten..." 
    # Prozess anhalten und PID-File löschen
    # TIP: nur, wenn Status running
    if  status  # nur anhalten, wenn Status 0
      then
        read PID < $PID_FILE
        kill -TERM $PID >> /dev/null # Prozess starten
        rm $PID_FILE
        echo "angehalten"
        exit 0
      else
        echo "Service $PROG läuft nicht"
        exit 1
      fi
    ;;
  status) 
    echo "Status $PROG bestimmen ..."
    # running | stop | dead
    # z.B. als Funktion realisieren
    case `status; echo $?` in
      0)  echo "running"; exit 0;;
      1)  echo "stop";    exit 1;;
      2)  echo "dead";    exit 2;;
      esac
    ;;
 *) 
    echo "Usage: “$PARM0“ { start | stop | status }"
    ;;
esac

exit 0
