Write-Host "=====================================" -ForegroundColor Cyan
Write-Host " SECURITY + AI LAB STATUS CHECK"
Write-Host "====================================="

# -------------------------------
# Helper function
# -------------------------------
function Check-Command {
    param($name)

    if (Get-Command $name -ErrorAction SilentlyContinue) {
        Write-Host "✅ $name installed" -ForegroundColor Green
    } else {
        Write-Host "❌ $name NOT installed" -ForegroundColor Red
    }
}

# -------------------------------
# 1. Core Tools
# -------------------------------
Write-Host "`n[1] Core Tools"

Check-Command "git"
Check-Command "code"
Check-Command "python"

# -------------------------------
# 2. Security Tools
# -------------------------------
Write-Host "`n[2] Security Tools"

Check-Command "nmap"
Check-Command "wireshark"

# ZAP check (not CLI-based)
$zapPaths = @(
    "C:\Program Files\OWASP ZAP\Zed Attack Proxy\zap.exe",
    "C:\Program Files (x86)\OWASP ZAP\Zed Attack Proxy\zap.exe"
)

$zapInstalled = $false
foreach ($p in $zapPaths) {
    if (Test-Path $p) {
        Write-Host "✅ OWASP ZAP installed at $p" -ForegroundColor Green
        $zapInstalled = $true
    }
}
if (-not $zapInstalled) {
    Write-Host "❌ OWASP ZAP NOT installed" -ForegroundColor Red
}

# -------------------------------
# 3. Ollama
# -------------------------------
Write-Host "`n[3] Ollama"

if (Get-Command ollama -ErrorAction SilentlyContinue) {
    Write-Host "✅ Ollama installed" -ForegroundColor Green

    try {
        $resp = Invoke-RestMethod -Uri "http://127.0.0.1:11434/api/tags" -TimeoutSec 3
        Write-Host "✅ Ollama server running" -ForegroundColor Green
    } catch {
        Write-Host "⚠️ Ollama installed but NOT running" -ForegroundColor Yellow
    }

} else {
    Write-Host "❌ Ollama NOT installed" -ForegroundColor Red
}

# -------------------------------
# 4. Keycloak
# -------------------------------
Write-Host "`n[4] Keycloak"

$keycloakPath = "$env:USERPROFILE\SecurityLab\Identity\keycloak"

if (Test-Path $keycloakPath) {
    Write-Host "✅ Keycloak extracted at $keycloakPath" -ForegroundColor Green
} else {
    Write-Host "❌ Keycloak NOT installed/extracted" -ForegroundColor Red
}

# -------------------------------
# 5. Wazuh Agent
# -------------------------------
Write-Host "`n[5] Wazuh"

if (Get-Service WazuhSvc -ErrorAction SilentlyContinue) {
    $svc = Get-Service WazuhSvc
    Write-Host "✅ Wazuh Agent installed (Status: $($svc.Status))" -ForegroundColor Green
} else {
    Write-Host "❌ Wazuh Agent NOT installed" -ForegroundColor Red
}

# -------------------------------
# 6. Ports Check (Service Health)
# -------------------------------
Write-Host "`n[6] Running Services (Ports)"

$ports = @(11434, 8080)

foreach ($port in $ports) {
    $conn = netstat -an | findstr ":$port"
    if ($conn) {
        Write-Host "✅ Port $port active" -ForegroundColor Green
    } else {
        Write-Host "⚠️ Port $port NOT active" -ForegroundColor Yellow
    }
}

# -------------------------------
# DONE
# -------------------------------
Write-Host "`n=====================================" -ForegroundColor Green
Write-Host " STATUS CHECK COMPLETE"
Write-Host "====================================="
