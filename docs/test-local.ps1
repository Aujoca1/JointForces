Write-Host "=== Локальное тестирование микросервисов ===" -ForegroundColor Green

Write-Host "1. Собираем и запускаем контейнеры..." -ForegroundColor Yellow
docker-compose -f docker-compose.local.yml up --build -d

Write-Host "`n2. Ждем запуска сервисов (10 секунд)..." -ForegroundColor Yellow
Start-Sleep -Seconds 10

Write-Host "`n3. Проверяем статус контейнеров..." -ForegroundColor Yellow
docker-compose -f docker-compose.local.yml ps

Write-Host "`n4. Тестируем доступность сервисов:" -ForegroundColor Green

Write-Host "`n   a) Прямой доступ к микросервисам:" -ForegroundColor Cyan
Write-Host "   Service1: http://localhost:3001"
Write-Host "   Service2: http://localhost:3002"
Write-Host "   Service3: http://localhost:3003"

Write-Host "`n   b) Через NGINX (балансировка нагрузки):" -ForegroundColor Cyan
Write-Host "   Главная страница: http://localhost:8080"
Write-Host "   Service1 через NGINX: http://localhost:8080/api/service1"
Write-Host "   Service2 через NGINX: http://localhost:8080/api/service2"
Write-Host "   Service3 через NGINX: http://localhost:8080/api/service3"

Write-Host "`n5. Health checks:" -ForegroundColor Cyan
Write-Host "   Service1 health: http://localhost:3001/health"
Write-Host "   Service2 health: http://localhost:3002/health"
Write-Host "   Service3 health: http://localhost:3003/health"

Write-Host "`n=== Инструкция по тестированию ===" -ForegroundColor Green
Write-Host "1. Откройте браузер и перейдите по ссылкам выше"
Write-Host "2. Или используйте curl в PowerShell:"
Write-Host "   curl http://localhost:8080"
Write-Host "3. Для остановки: docker-compose -f docker-compose.local.yml down"
