Write-Host "=== Простой тест микросервисов ===" -ForegroundColor Green
Write-Host ""

# 1. Проверяем Docker
Write-Host "1. Проверка Docker..." -ForegroundColor Yellow
try {
    docker --version
    Write-Host "   Docker установлен" -ForegroundColor Green
} catch {
    Write-Host "   Docker не установлен! Скачайте Docker Desktop" -ForegroundColor Red
    exit
}

# 2. Запускаем
Write-Host "`n2. Запуск контейнеров..." -ForegroundColor Yellow
Write-Host "   Команда: docker compose -f docker-compose.local.yml up --build -d"
Write-Host "   Подождите 1-2 минуты пока все соберется..."

# 3. Тестируем
Write-Host "`n3. После запуска проверьте в браузере:" -ForegroundColor Cyan
Write-Host "   - http://localhost:8080  (NGINX главная)"
Write-Host "   - http://localhost:3001  (Service 1 напрямую)"
Write-Host "   - http://localhost:3002  (Service 2 напрямую)"
Write-Host "   - http://localhost:3003  (Service 3 напрямую)"

Write-Host "`n4. Или через PowerShell:" -ForegroundColor Cyan
Write-Host '   Invoke-WebRequest -Uri "http://localhost:8080"'
Write-Host '   Invoke-WebRequest -Uri "http://localhost:3001"'

Write-Host "`n5. Для остановки:" -ForegroundColor Yellow
Write-Host "   docker compose -f docker-compose.local.yml down"
