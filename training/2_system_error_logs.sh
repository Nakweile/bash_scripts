#!/bin/bash

# выводит количество строк, содержащих ключевое слово "error" или "warning".

# Проверка передаваемого аргумента
if [ -z "$1" ]; then
	logfile="/var/log/syslog"
else
	logfile="$1"
fi

# Проверка доступа и существования файла
if [ ! -f $logfile ]; then
	echo 'Файл "$logfile" не существует.'
	exit 1
elif [ ! -r $logfile ]; then
	echo 'Файл "$logfile" недоступен для чтения.'
	echo 'Используйте sudo перед командой.'
	exit 1
fi

# Вывод кол-ва строк с ошибкой
echo -e '\nКоличество строк, содержащих ключевое слово "error":'
grep -ci 'error' $logfile

# Вывод кол-ва строк с предупреждением
echo -e '\nКоличество строк, содержащих ключевое слово "warning":'
grep -ci 'warning' $logfile
echo
