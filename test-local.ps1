Write-Host "=== Локальное тестирование микросервисов ===" -ForegroundColor Green

Write-Host "1. Проверяем Docker..." -ForegroundColor Yellow
docker --version
docker compose version

Write-Host "`n2. Собираем и запускаем контейнеры..." -ForegroundColor Yellow
docker compose -f docker-compose.local.yml up --build -d

Write-Host "`n3. Ждем запуска сервисов (15 секунд)..." -ForegroundColor Yellow
Start-Sleep -Seconds 15

Write-Host "`n4. Проверяем статус контейнеров..." -ForegroundColor Yellow
docker compose -f docker-compose.local.yml ps

Write-Host "`n5. Тестируем доступность сервисов:" -ForegroundColor Green

Write-Host "`n   a) Прямой доступ к микросервисам:" -ForegroundColor Cyan
Write-Host "   Service1: http://localhost:3001"
Write-Host "   Service2: http://localhost:3002"
Write-Host "   Service3: http://localhost:3003"

Write-Host "`n   b) Через NGINX (балансировка нагрузки):" -ForegroundColor Cyan
Write-Host "   Главная страница: http://localhost:8080"
Write-Host "   Service1 через NGINX: http://localhost:8080/api/service1"
Write-Host "   Service2 через NGINX: http://localhost:8080/api/service2"
Write-Host "   Service3 через NGINX: http://localhost:8080/api/service3"

Write-Host "`n6. Проверяем через curl:" -ForegroundColor Cyan
try {
    $response = Invoke-WebRequest -Uri "http://localhost:8080" -TimeoutSec 5
    Write-Host "   NGINX отвечает: $($response.StatusCode)"
} catch {
    Write-Host "   NGINX не отвечает: $_" -ForegroundColor Red
}

Write-Host "`n=== Инструкция ===" -ForegroundColor Green
Write-Host "1. Для остановки: docker compose -f docker-compose.local.yml down"
Write-Host "2. Для просмотра логов: docker compose -f docker-compose.local.yml logs"
Write-Host "3. Для просмотра логов конкретного сервиса: docker compose -f docker-compose.local.yml logs service1"
