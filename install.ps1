# Claude TaskMaster Init - Installer for Windows PowerShell

$ErrorActionPreference = "Stop"

$repo = "mister-X-is-your-father/claude-taskmaster-init"
$branch = "master"
$installDir = "$env:USERPROFILE\bin"

Write-Host "===================================" -ForegroundColor Cyan
Write-Host " Claude TaskMaster Init Installer" -ForegroundColor Cyan
Write-Host "===================================" -ForegroundColor Cyan
Write-Host ""

# Create bin directory
if (!(Test-Path $installDir)) {
    New-Item -ItemType Directory -Path $installDir -Force | Out-Null
    Write-Host "Created $installDir"
}

# Download script
Write-Host "Downloading new-project..."
$scriptUrl = "https://raw.githubusercontent.com/$repo/$branch/new-project"
$scriptPath = "$installDir\new-project"
Invoke-WebRequest -Uri $scriptUrl -OutFile $scriptPath

# Create batch wrapper for Windows
$batchContent = @"
@echo off
bash "%USERPROFILE%\bin\new-project" %*
"@
$batchContent | Out-File -FilePath "$installDir\new-project.cmd" -Encoding ASCII

# Add to PATH if not already
$currentPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($currentPath -notlike "*$installDir*") {
    $newPath = "$installDir;$currentPath"
    [Environment]::SetEnvironmentVariable("Path", $newPath, "User")
    Write-Host "Added $installDir to PATH"
}

Write-Host ""
Write-Host "Installation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Usage:" -ForegroundColor Yellow
Write-Host "  new-project <project-name>"
Write-Host ""
Write-Host "Open a new terminal to use."
