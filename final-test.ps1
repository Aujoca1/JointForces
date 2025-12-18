Write-Host "=== ТЕСТ СИСТЕМЫ ===" -ForegroundColor Green

$services = @(
    @{Name="NGINX (главная страница)"; URL="http://localhost:8080"},
    @{Name="Service 1 - Node.js API"; URL="http://localhost:3001"},
    @{Name="Service 2 - Python Flask API"; URL="http://localhost:3002"},
    @{Name="Service 3 - Python HTTP Server"; URL="http://localhost:3003"},
    @{Name="Service 1 Health Check"; URL="http://localhost:3001/health"},
    @{Name="Service 2 Health Check"; URL="http://localhost:3002/health"},
    @{Name="Service 3 Health Check"; URL="http://localhost:3003/health"}
)

foreach ($service in $services) {
    try {
        $response = Invoke-WebRequest -Uri $service.URL -UseBasicParsing -TimeoutSec 5 -ErrorAction Stop
        if ($response.StatusCode -eq 200) {
            Write-Host "✅ $($service.Name): РАБОТАЕТ (HTTP $($response.StatusCode))" -ForegroundColor Green
        } else {
            Write-Host "⚠️ $($service.Name): ОТВЕЧАЕТ ($($response.StatusCode))" -ForegroundColor Yellow
        }
    } catch {
        Write-Host "❌ $($service.Name): НЕ ДОСТУПЕН" -ForegroundColor Red
        Write-Host "   Ошибка: $_" -ForegroundColor DarkGray
    }
}


