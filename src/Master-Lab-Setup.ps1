Write-Host "====================================="
Write-Host " SECURITY + AI LAB (MASTER CONTROL)"
Write-Host "====================================="

# Prevent loops
if ($global:MasterSetupRun) {
    Write-Host "Already executed. Exiting..."
    return
}
$global:MasterSetupRun = $true

# -------------------------------
# STATUS CHECKS
# -------------------------------
Write-Host "`n[CHECK] Environment..."

# Ollama
if (Get-Command ollama -ErrorAction SilentlyContinue) {
    Write-Host "✅ Ollama installed"
} else {
    Write-Host "⚠️ Install Ollama:"
    Write-Host "https://ollama.com/download"
}

# VS Code
if (Get-Command code -ErrorAction SilentlyContinue) {
    Write-Host "✅ VS Code installed"
} else {
    Write-Host "⚠️ Install VS Code:"
    Write-Host "https://code.visualstudio.com/"
}

# -------------------------------
# TOOLS (manual links)
# -------------------------------
Write-Host "`n[TOOLS DOWNLOAD LINKS]"

Write-Host "OWASP ZAP:"
Write-Host "https://www.zaproxy.org/download/"

Write-Host "Keycloak:"
Write-Host "https://www.keycloak.org/downloads"

Write-Host "Wazuh:"
Write-Host "https://documentation.wazuh.com/"

Write-Host "Nessus:"
Write-Host "https://www.tenable.com/downloads/nessus"

# -------------------------------
# OPTIONAL START
# -------------------------------
Write-Host "`n[START SERVICES]"

$ollama = Get-Command ollama -ErrorAction SilentlyContinue

if ($ollama) {
    Start-Process -FilePath $ollama.Source -ArgumentList "serve" -WindowStyle Hidden
    Write-Host "✅ Ollama started"
}

# -------------------------------
# COMPLETE
# -------------------------------
Write-Host "`n====================================="
Write-Host " ✅ SYSTEM READY"
Write-Host "====================================="
