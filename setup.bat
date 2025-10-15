@echo off
echo ========================================
echo Hobbi Project - Complete Setup
echo ========================================

echo.
echo 1. Installing dependencies...
call npm install

echo.
echo 2. Starting development server...
echo Press Ctrl+C to stop the server
echo.

call npm run dev
