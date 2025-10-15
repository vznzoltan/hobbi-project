@echo off
echo ========================================
echo Firebase Project Initialization
echo ========================================

echo.
echo 1. Installing Firebase CLI globally...
call npm install -g firebase-tools

echo.
echo 2. Logging in to Firebase...
call firebase login

echo.
echo 3. Initializing Firebase project...
call firebase init

echo.
echo ========================================
echo Firebase initialization completed!
echo ========================================
pause
