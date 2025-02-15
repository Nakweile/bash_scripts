#!/bin/bash

echo "Цикл for:"
# Цикл for:
for i in 1 2 3; do
  echo "Number: $i"
done

echo ""
echo "Итерация по файлам"
# Итерация по файлам:
for file in *.txt; do
  echo "Processing $file"
done

echo ""
echo "Цикл while:"
# Цикл while:
count=0
while [ $count -lt 5 ]; do
  echo "Count: $count"
  ((count++))
done
