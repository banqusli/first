#!/bin/bash
# Übergabe von mehr als 9 Parametern

for ((i=0;i<=9;i++))
  do
    eval echo \$$i
  done

shift 9

for ((i=1;i<=9;i++))
  do
    eval echo \$$i
  done

exit 0
