# Hobbi Project - PowerShell Script Launcher

function Show-Menu {
    Clear-Host
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "    HOBBI PROJECT - SCRIPT LAUNCHER" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Choose an option:" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "[1] Start Development Server" -ForegroundColor Cyan
    Write-Host "[2] Deploy to Firebase (Full)" -ForegroundColor Cyan
    Write-Host "[3] Deploy to Firebase (Hosting only)" -ForegroundColor Cyan
    Write-Host "[4] Deploy Firestore Rules" -ForegroundColor Cyan
    Write-Host "[5] Git Push" -ForegroundColor Cyan
    Write-Host "[6] Firebase Status" -ForegroundColor Cyan
    Write-Host "[7] Firebase Emulator" -ForegroundColor Cyan
    Write-Host "[8] Project Setup" -ForegroundColor Cyan
    Write-Host "[9] Firebase Init" -ForegroundColor Cyan
    Write-Host "[0] Exit" -ForegroundColor Red
    Write-Host ""
}

function Start-Script {
    param($ScriptName, $Description)
    Clear-Host
    Write-Host "Starting $Description..." -ForegroundColor Yellow
    & ".\$ScriptName"
    Write-Host ""
    Write-Host "Press any key to return to menu..." -ForegroundColor Gray
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
}

do {
    Show-Menu
    $choice = Read-Host "Enter your choice (0-9)"
    
    switch ($choice) {
        "1" { Start-Script "dev.bat" "Development Server" }
        "2" { Start-Script "firebase-deploy.bat" "Full Firebase Deployment" }
        "3" { Start-Script "firebase-hosting.bat" "Firebase Hosting Deployment" }
        "4" { Start-Script "firebase-rules.bat" "Firestore Rules Deployment" }
        "5" { Start-Script "git-push.bat" "Git Push" }
        "6" { Start-Script "firebase-status.bat" "Firebase Status Check" }
        "7" { Start-Script "firebase-emulator.bat" "Firebase Emulator" }
        "8" { Start-Script "setup.bat" "Project Setup" }
        "9" { Start-Script "firebase-init.bat" "Firebase Initialization" }
        "0" { 
            Clear-Host
            Write-Host "========================================" -ForegroundColor Green
            Write-Host "    Thank you for using Hobbi Project!" -ForegroundColor Green
            Write-Host "========================================" -ForegroundColor Green
            break
        }
        default { 
            Write-Host "Invalid choice! Please try again." -ForegroundColor Red
            Start-Sleep -Seconds 2
        }
    }
} while ($choice -ne "0")
