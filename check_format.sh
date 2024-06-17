#!/bin/bash

# Флаг для отслеживания ошибок
error_found=false

# Перебор всех .txt файлов в репозитории
for file in $(git ls-files '*.txt'); do
    # Проверка, начинается ли файл с символа #
    if [[ $(head -c 1 "$file") != "#" ]]; then
        echo "Файл $file не начинается с символа #"
        error_found=true
    fi
done

# Если найдены ошибки, прерываем коммит
if $error_found; then
    echo "Ошибка: один или несколько .txt файлов не начинаются с символа #. Коммит прерван."
    exit 1
else
    echo "Все .txt файлы начинаются с символа #. Коммит разрешён."
    exit 0
fi
