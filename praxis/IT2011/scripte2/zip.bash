#!/bin/bash
WORK_DIR=/tmp
ZERO_FILE_DIR=zero
ZERO_FILE=nullen.bz2

DD_BIN=/bin/dd
# ZIP_BIN="/usr/bin/gzip --best"
# ZIP_EXT="gz"
ZIP_BIN="bzip2 --best"
ZIP_EXT="bz2"
MKDIR_BIN=/bin/mkdir
CP_BIN=/bin/cp

if [ -z $1 ]
  then
    echo -n "Dateigröße in MB : "; read FILESIZE; echo
  else
    FILESIZE=$1
  fi
if [ -z $2 ]
  then
    echo -n "Anzahl Dateien im Verzeichnis : "; read n; echo
  else
    n=$2
  fi

# Step 1) Datei mit Nullen erzeugen und komprimieren
echo "Erzeuge komprimierte Datei mit $FILESIZE MB binären Nullen ..."
$DD_BIN ibs=1M count=$FILESIZE if=/dev/zero 2> /dev/null | $ZIP_BIN | \
    $DD_BIN of=$WORK_DIR/$ZERO_FILE 2> /dev/null
# 2> /dev/null --> stderr nach /dev/null umleiten

# Step 2)
echo "Kopiere $n Dateien in ein Verzeichnis ..."
$MKDIR_BIN $WORK_DIR/$ZERO_FILE_DIR
for ((i=0;i<$n;i++))
  do
    $CP_BIN $WORK_DIR/$ZERO_FILE $WORK_DIR/$ZERO_FILE_DIR/$i.$ZIP_EXT
  done

exit 0
