#!/bin/bash
WORKDIR="/tmp/zip"
ZIP="bzip2 --best"
ZIP_EXT="bz2"
STRUCT_DIR="archiv"
STRUCT_DIR_TMP="archiv_tmp"

# Parameter abfragen:
if [ -z "$1" ] ; then echo -n "Archivgröße in GByte : "; read SIZE; else SIZE=$1; fi
if [ -z "$2" ] ; then echo -n "Tiefe des Archivs : "; read DEPTH; else DEPTH=$2; fi

# Step 1: Datei mit Nullen erzeugen und komprimieren
mkdir $WORKDIR
cd $WORKDIR
echo "Erzeuge und komprimiere Datei mit $SIZE GByte Nullen ..."
dd count=$SIZE ibs=1G if=/dev/zero | $ZIP | dd of=nullen.$ZIP_EXT

# Step 2: temporäre Verzeichnisstruktur erstellen und kopieren
mkdir $STRUCT_DIR
for ((i=1;i<=$DEPTH;i++))
  do
    cp nullen.$ZIP_EXT $STRUCT_DIR/$i.$ZIP_EXT
  done

# Step 3: aufblasen
for ((j=1;j<=$DEPTH;j++))  # äußere Schleife - Tiefe der Struktur
  do
    echo "Erzeuge Ebene $j von $DEPTH ..."
    mv $STRUCT_DIR $STRUCT_DIR_TMP
    mkdir $STRUCT_DIR
    for ((i=1;i<=$DEPTH;i++))  # innere Schleife - n * kopieren
      do
        cp -R $STRUCT_DIR_TMP $STRUCT_DIR/$i
        done # Ende der inneren Schleife
    rm -rf $STRUCT_DIR_TMP
    done # Ende der äußeren Schleife

# Step 4: Archiv erzeugen und komprimieren
tar cf $STRUCT_DIR.tar $STRUCT_DIR
$ZIP $STRUCT_DIR.tar

# Step 5: aufräumen
rm -rf $STRUCT_DIR
rm nullen.$ZIP_EXT

exit 0
