#!/bin/bash
# Grundgerüst für ein Startscript

XTERM_BIN=/usr/bin/xterm	# Pfad zum xterm Binary
PS_BIN=/bin/ps
GREP_BIN=/usr/bin/grep
AWK_BIN=/usr/bin/awk

case $1 in
  start) 
    echo "Service xterm starten..." 
    $XTERM_BIN &
    ;;
  stop) 
    echo "Service xterm anhalten..." 
    kill -TERM `$PS_BIN | $GREP_BIN "xterm" | $AWK_BIN '{print $1}' ` 
    ;;
  status) 
    echo "Status von Service xterm bestimmen ..." 
    if $PS_BIN | $GREP_BIN "xterm" >> /dev/null
      then
        echo "xterm is running"
      else
        echo "xterm not found"
      fi 
    ;;
  *) 
    echo "Usage: "$0" { start | stop | status }"
    ;;
esac

exit 0
