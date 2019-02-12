#!/bin/bash
SERVICE="xeyes"
SERVICE_BIN="/usr/bin/xeyes"
SERVICE_PID_FILE="/tmp/xeyes.pid"
PS_BIN="/bin/ps -u $USER" # ggf. user anpassen bzw. auslesen
GREP_BIN="/usr/bin/grep"
AWK_BIN="/usr/bin/awk"
RM_BIN="/bin/rm"

function status {
  SERVICE_PID=`$PS_BIN | $GREP_BIN $SERVICE | $AWK_BIN '{ print $1 }'`
  # echo "PID = $SERVICE_PID"
  if [ -s $SERVICE_PID_FILE ]  # File vorhanden und nicht leer
    then
      # prüfen ob PIDs übereinstimmen --> ja running
      read SERVICE_PID_FILE_LINE < $SERVICE_PID_FILE # erste Zeile PID File lesen
      if  [ ! -z $SERVICE_PID ] && [ $SERVICE_PID -eq $SERVICE_PID_FILE_LINE ]
        then
          # echo "running"
          SERVICE_STATUS=0  # 0 entspricht running
        else
          # echo "dead" # dann gehen wir von leerer PID aus, im File steht aber eine
          SERVICE_STATUS=1  # 1 entspricht dead
        fi
    else
      # echo "not running"; # kein PID File --> not running
      SERVICE_STATUS=2  # 2 entspricht not running
    fi

  return $SERVICE_STATUS
}

case $1 in
  start)  if status 
            then 
              echo "Service $SERVICE is running"
            else
              echo "Starte Service $SERVICE"
              $SERVICE_BIN &
              echo $! > $SERVICE_PID_FILE
            fi
          ;;
  stop)   if status
            then
              echo "Halte Service $SERVICE an ..."
	      kill -TERM $SERVICE_PID # globale Variablen, Funktion service hat gesetzt
	      $RM_BIN $SERVICE_PID_FILE
            else
              if [ $SERVICE_STATUS -eq 1 ]
                then
                  echo "Service $SERVICE is dead."
                  $RM_BIN $SERVICE_PID_FILE
                else
                  echo "Service $SERVICE is not running."
                fi
            fi
	  ;;
  status) status
          case $SERVICE_STATUS in
            0) echo "Service $SERVICE is running." ;;
            1) echo "Service $SERVICE is dead." ;;
            2) echo "Service $SERVICE is not running.";;
            esac 
	  ;;
  *)      echo "Usage: $0 { start | stop | status }"
	  ;;
  esac

exit 0 # Rückgabewert sollte sich nach obigen Aktionen richten
