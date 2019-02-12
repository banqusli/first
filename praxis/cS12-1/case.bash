#!/bin/bash
PARAMETER=$1
PID_FILE='xeyes.pid'
PROG_BIN='/usr/bin/xeyes'

function prog_status {
  if [ -s $PID_FILE ]
    then
      PIDs_FILE=`cat $PID_FILE`
      PIDs_TABLE=`ps | grep xeyes | awk '{ print $1 }'`
      if [ $PIDs_TABLE -eq $PIDs_FILE ] &> /dev/null # stout & sterr umleiten
        then
          STATUS_VAR=0 # Programm läuft
        else
          STATUS_VAR=1 # Programm abgestürzt
        fi
   else
     STATUS_VAR=2 # Programm läuft nicht
   fi
  return $STATUS_VAR

} # end prog_status

case $PARAMETER in
 start) 
    echo "service $PROG_BIN starten ..."
    prog_status
    if [ $? -ne 0 ] # nicht starten, wenn 0 (running)
      then
        $PROG_BIN &
        # echo `ps | grep xeyes | awk '{ print $1 }'` > $PID_FILE
        echo $! > $PID_FILE
      else
        echo "service $PROG_BIN läuft bereits!"
      fi
    ;;
 stop)
    echo "service $PROG_BIN anhalten ..."
    prog_status
    if [ $? -eq 0 ] # nur anhalten, wenn 0 (running)
      then
        kill -TERM `cat $PID_FILE`
        rm $PID_FILE
      else
        echo "service $PROG_BIN läuft nicht!"
      fi
    ;;
 status)
    echo "service $PROG_BIN status prüfen ..."
    prog_status
    case $? in
      0) echo "running";;
      1) echo "dead";;
      2) echo "not running";;
   esac
   ;;
 *)
   echo "usage: $0 {start|stop|status}"
   ;;
esac

exit 0
