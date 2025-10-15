# Hobbi Project - PowerShell Deployment Script

Write-Host "========================================" -ForegroundColor Green
Write-Host "Hobbi Project - Deployment Script" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green

Write-Host ""
Write-Host "1. Installing dependencies..." -ForegroundColor Yellow
npm install

Write-Host ""
Write-Host "2. Building project..." -ForegroundColor Yellow
npm run build

Write-Host ""
Write-Host "3. Deploying to Firebase..." -ForegroundColor Yellow
firebase deploy

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "Deployment completed!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green

Read-Host "Press Enter to continue"
