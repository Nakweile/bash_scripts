#!/bin/bash

# Проверка существования файла:
if [ -f "text1.txt" ]; then
  echo "File exists"
else
  echo "File not exists"
fi


# Чтение файла:
while read line; do
  echo "Line: $line"
done < text2.txt
