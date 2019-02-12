#!/bin/bash
# Übergabe von Parametern

echo "Parameter 0: $0"
echo "Parameter 1: $1"
echo "Parameter 2: $2"
echo "Parameter 3: $3"
echo "Parameter 4: $4"
echo "Parameter 5: $5"
echo "Parameter 6: $6"
echo "Parameter 7: $7"
echo "Parameter 8: $8"
echo "Parameter 9: $9"
# für Zugriff jenseits 9 ist shift n erforderlich
shift 9
echo "Parameter 10: $1"
echo "Parameter 11: $2"
echo "Parameter 12: $3"
echo "Parameter 13: $4"
echo "Parameter 14: $5"
echo "Parameter 15: $6"
echo "Parameter 16: $7"
echo "Parameter 17: $8"
echo "Parameter 18: $9"

exit 0
