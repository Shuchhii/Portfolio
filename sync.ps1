# Portfolio GitHub Sync Script
$ErrorActionPreference = "Stop"

# Ensure Git and GitHub CLI are in PATH
$gitCmd = "$env:LOCALAPPDATA\Programs\MinGit\cmd"
$ghBin = "$env:LOCALAPPDATA\Programs\gh"
$env:Path = "$gitCmd;$ghBin;" + $env:Path

$repoDir = "C:\Users\shuchi\Desktop\Portfolio"
Set-Location -Path $repoDir

# Check if there are changes to commit
$status = & git status --porcelain
if ($status) {
    Write-Host "[*] Changes detected. Staging and committing..." -ForegroundColor Cyan
    & git add .
    $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm")
    & git commit -m "Auto-update portfolio: $timestamp"
    
    Write-Host "[*] Pushing to GitHub..." -ForegroundColor Cyan
    & git push origin main
    
    Write-Host "[OK] Portfolio updated and pushed successfully to GitHub!" -ForegroundColor Green
} else {
    Write-Host "[INFO] No new changes found. Repository is already up to date!" -ForegroundColor Yellow
}
