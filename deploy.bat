@echo off
echo ========================================
echo Hobbi Project - Deployment Script
echo ========================================

echo.
echo 1. Installing dependencies...
call npm install

echo.
echo 2. Building project...
call npm run build

echo.
echo 3. Deploying to Firebase...
call firebase deploy

echo.
echo ========================================
echo Deployment completed!
echo ========================================
pause
