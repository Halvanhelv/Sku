# README

Application for saving the product catalog from the Ozon website
For periodic parsing, add a task to cron
```whenever --update-crontab --set environment='development'```
for manual execution, run
```rails c``` and enter ```OzonParseService.new("https://api.ozon.ru/composer-api.bx/page/json/v1?url=/category/televizory-15528").parse```
