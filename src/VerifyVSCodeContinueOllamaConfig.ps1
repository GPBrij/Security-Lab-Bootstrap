# ==========================================
# Verify VS Code Continue + Ollama Configuration
# ==========================================

Write-Host "Verifying Continue configuration..." -ForegroundColor Cyan

# ---- 1. Paths ----
$continuePath = "$env:APPDATA\Code\User\continue"
$configPath   = Join-Path $continuePath "config.json"

# ---- 2. Check Continue folder ----
if (-not (Test-Path $continuePath)) {
    Write-Host "❌ Continue folder NOT found:" -ForegroundColor Red
    Write-Host $continuePath
    exit 1
}
Write-Host "✅ Continue folder found." -ForegroundColor Green

# ---- 3. Check config.json ----
if (-not (Test-Path $configPath)) {
    Write-Host "❌ config.json NOT found:" -ForegroundColor Red
    Write-Host $configPath
    exit 1
}
Write-Host "✅ config.json found." -ForegroundColor Green

# ---- 4. Read and parse JSON ----
try {
    $configJson = Get-Content $configPath -Raw | ConvertFrom-Json
    Write-Host "✅ config.json is valid JSON." -ForegroundColor Green
}
catch {
    Write-Host "❌ config.json is INVALID JSON." -ForegroundColor Red
    exit 1
}

# ---- 5. Validate models ----
$requiredModels = @("deepseek-coder", "gemma4", "phi4-mini")
$configuredModels = $configJson.models.model

foreach ($model in $requiredModels) {
    if ($configuredModels -contains $model) {
        Write-Host "✅ Model configured: $model" -ForegroundColor Green
    } else {
        Write-Host "❌ Model MISSING: $model" -ForegroundColor Red
    }
}

# ---- 6. Validate default model ----
if ($configJson.defaultModel -eq "deepseek-coder") {
    Write-Host "✅ Default model set correctly: deepseek-coder" -ForegroundColor Green
} else {
    Write-Host "❌ Default model incorrect or missing." -ForegroundColor Red
}

# ---- 7. Final status ----
Write-Host "----------------------------------------" -ForegroundColor Cyan
Write-Host "✅ Verification complete." -ForegroundColor Green
Write-Host "Restart Visual Studio Code if changes were made." -ForegroundColor Yellow
``
