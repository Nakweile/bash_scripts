#!/bin/bash

# Функция для вывода справки
show_help() {
	echo -e "\nИспользование $0 [опции]"
	echo -e "Опции:"
	echo -e " -h, --host		Вывести имя хоста"
	echo -e " -k, --kernel		Вывести версию ядра Linux"
	echo -e " -r, --ram		Вывести использование оперативной памяти"
	echo -e " -df, --disk		Вывести использование жесткого диска"
	echo -e " --help			Вывести эту справку"
	echo
	exit 0
}

# Обработка аргументов
if [ $# -eq 0 ]; then
	echo -e "\nРежим по умолчанию: вывод всей информации.\n"
fi

# Если аргументов нет, выводим всю информацию
if [ $# -eq 0 ]; then
	echo -e "\nИмя хоста:"
	hostname

	echo -e "\nВерсия ядра:"
	uname -v

	echo -e "\nИспользование оперативной памяти:"
	free -h

	echo -e "\nИспользование жесткого диска:"
	df -h --total | awk 'NR==1 || NR==NF'
	echo
fi

# Проверка на передаваемые аргументы и вывод информации
while [[ $# -gt 0 ]]; do
	case $1 in
		-h|--host)
			echo -e "\nИмя хоста:"
			hostname
			echo
			shift
			;;
		-k|--kernel)
			echo -e "\nВерсия ядра:"
			uname -v
			echo
			shift
			;;
		-r|--ram)
			echo -e "\nИспользование оперативной памяти:"
			free -h
			echo
			shift
			;;
		-df|--disk)
			echo -e "\nИспользование жесткого диска:"
			df -h --total | awk 'NR==1 {print} END {print}'
			echo
			shift
			;;
		--help)
			show_help
			;;
		*)
			echo -e "\nОшибка: неизвестный аргумент: $@"
			show_help
			exit 1
			;;
	esac
done
