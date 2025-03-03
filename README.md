# ytrss

Добавляет YouTube-каналы в RSS-ленту Newsboat.

## Описание

Скрипт `ytrss` позволяет легко добавлять YouTube-каналы в RSS-ленту Newsboat. Он извлекает RSS-ссылку из страницы YouTube-канала и добавляет её в файл конфигурации Newsboat.

## Требования

- [shup](https://github.com/pystardust/shup) — утилита для извлечения RSS-ссылок.
- `curl` — для загрузки страницы YouTube-канала.
- `grep` — для обработки текста.

## Установка

1. Склонируйте репозиторий:

   ```bash
   git clone https://github.com/erhaver/ytrss.git
   cd ytrss
   ```

2. Установите скрипт:

   ```bash
   make install
   ```

## Конфигурация

По умолчанию скрипт использует файл `urls` из конфигурации Newsboat:

```bash
nbconfig="$HOME/.config/newsboat/urls"
```

Если ваш файл конфигурации находится в другом месте, измените переменную `nbconfig` в скрипте.

## Использование

Добавьте YouTube-канал в RSS-ленту:

```bash
ytrss <ссылка> [имя]
```

- `<ссылка>` — ссылка на YouTube-канал (например, `https://www.youtube.com/@channel`).
- `[имя]` — необязательное имя для канала (например, `"Cool Channel"`).

### Примеры

1. Добавить канал без имени:

   ```bash
   ytrss https://www.youtube.com/@channel
   ```

   Вывод:
   ```
   [2023-10-01 12:34:56] RSS добавлен в /home/user/.config/newsboat/urls
   ```

2. Добавить канал с именем:

   ```bash
   ytrss https://www.youtube.com/@channel "Cool Channel"
   ```

   Вывод:
   ```
   [2023-10-01 12:34:56] RSS "Cool Channel" добавлен в /home/user/.config/newsboat/urls
   ```

3. Если ссылка не указана:

   ```bash
   ytrss
   ```

   Вывод:
   ```
   Ошибка: Не указана ссылка
   Использование: ytrss <ссылка> [имя]
   ```
