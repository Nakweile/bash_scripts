#!/bin/bash

# Путь к лог-файлу
logfile="/home/mainpc/scripts_learn/training/log_cpu_ram.txt"

# Создание файла, если он не существует
touch "$logfile"

# Запись текущей даты и времени
echo "Дата и время: $(date '+%D %T')" >> "$logfile"

# Запись загруженности CPU
echo -e "\nЗагруженность процессора:" >> "$logfile"
if top -b -n 1 | grep "%Cpu" >> "$logfile"; then
    : # Успешно
else
    echo "Ошибка: Не удалось получить данные о загруженности CPU." >> "$logfile"
fi

# Запись количества активных процессов
echo -e "\nКоличество активных процессов:" >> "$logfile"
if ps -e --no-headers | wc -l >> "$logfile"; then
    : # Успешно
else
    echo "Ошибка: Не удалось получить количество активных процессов." >> "$logfile"
fi

# Запись загруженности оперативной памяти
echo -e "\nЗагруженность оперативной памяти:" >> "$logfile"
if free -h >> "$logfile"; then
    : # Успешно
else
    echo "Ошибка: Не удалось получить данные о загруженности оперативной памяти." >> "$logfile"
fi

# Добавление разделителя между записями
echo -e "\n===== Конец записи =====\n" >> "$logfile"


tail -n 1000 "$logfile" > "$logfile.tmp" && mv "$logfile.tmp" "$logfile"
