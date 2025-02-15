#!/bin/bash

#	$0 — имя скрипта.
#	$1, $2, ..., $9 — аргументы.
#	$# — количество аргументов.
#	$@ — все аргументы.


greet() {
  echo "Hello, $1! - first argument"
  echo "How are you, $2 - second argument"
  echo "ALL arguments: $@"
}

greet "Alice" "MAN"
