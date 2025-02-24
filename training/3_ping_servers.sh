#!/bin/bash

# Предвариьельно создайте файл с списком серверов в формате:
#	191.168.0.1
#	google.com
#	...

if [ "$1" != "" ]; then
	server_list="$1"
else
	echo -e "\nНе передан файл со списком хостов.\n"
	exit 1
fi

if [ ! -f "$server_list" ]; then
	echo -e "Файл $server_list не существует."
	exit 1
fi

while IFS= read -r server; do
	if ping -c 1 -W 1 "$server" &> /dev/null; then
		echo -e "Сервер $server доступен."
	else
		echo -e "Сервер $server недоступен."
	fi
done < "$server_list"
