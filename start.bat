@echo off
title Hobbi Project - Quick Start
color 0B

cls
echo ========================================
echo    HOBBI PROJECT - QUICK START
echo ========================================
echo.
echo What do you want to do?
echo.
echo [1] Start Development (npm run dev)
echo [2] Deploy Everything (build + firebase deploy)
echo [3] Open Script Launcher Menu
echo [0] Exit
echo.
set /p choice="Enter your choice (0-3): "

if "%choice%"=="1" (
    cls
    echo Starting Development Server...
    call dev.bat
) else if "%choice%"=="2" (
    cls
    echo Starting Full Deployment...
    call firebase-deploy.bat
) else if "%choice%"=="3" (
    cls
    call run.bat
) else if "%choice%"=="0" (
    cls
    echo Goodbye!
    timeout /t 2 >nul
    exit
) else (
    cls
    echo Invalid choice!
    timeout /t 2 >nul
    call start.bat
)
