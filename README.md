# Bash Scripting Training Repository

Welcome to my Bash Scripting Training Repository! This repository is dedicated to my journey of learning and mastering Bash scripting. Here, you'll find a collection of training scripts, notes, and cheat sheets that I've created during my learning process.

## Contents

- **Scripts**: A variety of Bash scripts that demonstrate different concepts and techniques.
- **Cheat Sheets**: Handy reference guides that summarize key Bash commands and syntax.
- **Notes**: Personal notes and explanations that capture my understanding of various topics in Bash scripting.

## Getting Started

To get started with the scripts in this repository, simply clone it to your local machine:

```bash
git clone https://github.com/yourusername/bash-scripting-training.git
```
## Сrib sheet

Конечно! Вот структурированная напоминалка по написанию скриптов на Bash:

---

### **1. Шебанг (Shebang)**
Всегда указывайте интерпретатор в первой строке:
```bash
#!/bin/bash
# Или для большей совместимости: #!/usr/bin/env bash
```

---

### **2. Комментарии**
- Добавляйте описание скрипта в начале:
  ```bash
  # Скрипт для резервного копирования папки
  # Автор: Ваше Имя
  # Дата: 2023-10-01
  ```
- Комментируйте сложные части кода.

---

### **3. Переменные**
- Именуйте переменные в `UPPER_CASE` (для констант) или `lower_case`:
  ```bash
  MAX_SIZE=100
  file_path="/path/to/file"
  ```
- Используйте кавычки:
  ```bash
  name="John Doe"
  echo "Привет, $name"
  ```
- **Экспорт переменных** (если нужно передать дочерним процессам):
  ```bash
  export PATH="$PATH:/my/custom/path"
  ```

---

### **4. Аргументы командной строки**
- Обращение к аргументам:
  - `$0` — имя скрипта.
  - `$1`, `$2`, ..., `$n` — аргументы.
  - `$#` — количество аргументов.
  - `$@` — все аргументы как список.
  - `$*` — все аргументы как одна строка.

**Пример проверки аргументов:**
```bash
if [ $# -lt 2 ]; then
  echo "Ошибка: нужно 2 аргумента!"
  exit 1
fi
```

---

### **5. Условные операторы**
- Используйте `[[ ]]` вместо `[ ]` (больше возможностей):
  ```bash
  if [[ "$str1" == "value" && $num -gt 10 ]]; then
    # действие
  elif [[ ... ]]; then
    # действие
  else
    # действие
  fi
  ```
- Проверки файлов:
  ```bash
  if [ -f "file.txt" ]; then  # файл существует?
  if [ -d "/path" ]; then     # директория существует?
  ```

---

### **6. Циклы**
- **For**:
  ```bash
  for file in *.txt; do
    echo "Обработка: $file"
  done
  ```
- **While**:
  ```bash
  while read line; do
    echo "Строка: $line"
  done < file.txt
  ```
- **Until**:
  ```bash
  until ping -c1 example.com; do
    echo "Ждем ответа..."
    sleep 1
  done
  ```

---

### **7. Функции**
- Объявление и вызов:
  ```bash
  function my_func() {
    local local_var="значение"  # локальная переменная
    echo "Аргумент функции: $1"
    return 0
  }
  my_func "аргумент"
  ```
- **Возвращаемые значения**: Используйте `return` для кода выхода (0 — успех, 1-255 — ошибка).

---

### **8. Обработка ошибок**
- Выход при ошибке:
  ```bash
  set -e  # выход при любой ошибке
  set -u  # выход при использовании необъявленной переменной
  ```
- Проверка кода выхода:
  ```bash
  if ! command; then
    echo "Ошибка!"
    exit 1
  fi
  ```

---

### **9. Пример скрипта**
```bash
#!/bin/bash
# Скрипт для бэкапа папки

# Конфигурация
BACKUP_DIR="/backup"
SOURCE_DIR="$1"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Проверка аргументов
if [ $# -ne 1 ]; then
  echo "Использование: $0 /путь/к/папке"
  exit 1
fi

# Создание бэкапа
tar -czf "$BACKUP_DIR/backup_$TIMESTAMP.tar.gz" "$SOURCE_DIR" 2>/dev/null

# Проверка успешности
if [ $? -eq 0 ]; then
  echo "Бэкап создан: $BACKUP_DIR/backup_$TIMESTAMP.tar.gz"
else
  echo "Ошибка создания бэкапа!"
  exit 1
fi
```

---

### **10. Лучшие практики**
1. **Отладка**: Запускайте скрипт с `bash -x script.sh` для пошагового вывода.
2. **ShellCheck**: Используйте [shellcheck](https://www.shellcheck.net) для проверки синтаксиса.
3. **Форматирование**: Соблюдайте отступы для читаемости.
4. **Безопасность**: Избегайте `eval` и экранируйте переменные в командах (`"$var"`).
