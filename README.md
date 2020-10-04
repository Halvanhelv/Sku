# README

Приложения для сохранения каталога товаров с сайта Ozon
Для переодического  парсинга добавьте задачу в cron 
```whenever --update-crontab --set environment='development'```
для ручного запуска запустите 
```rails c``` и введите ```OzonParseService.new("https://api.ozon.ru/composer-api.bx/page/json/v1?url=/category/televizory-15528").parse```
