@echo off
title Hobbi Project - Script Launcher
color 0A

:menu
cls
echo ========================================
echo    HOBBI PROJECT - SCRIPT LAUNCHER
echo ========================================
echo.
echo Choose an option:
echo.
echo [1] Start Development Server
echo [2] Deploy to Firebase (Full)
echo [3] Deploy to Firebase (Hosting only)
echo [4] Deploy Firestore Rules
echo [5] Git Push
echo [6] Firebase Status
echo [7] Firebase Emulator
echo [8] Project Setup
echo [9] Firebase Init
echo [0] Exit
echo.
set /p choice="Enter your choice (0-9): "

if "%choice%"=="1" goto dev
if "%choice%"=="2" goto firebase-deploy
if "%choice%"=="3" goto firebase-hosting
if "%choice%"=="4" goto firebase-rules
if "%choice%"=="5" goto git-push
if "%choice%"=="6" goto firebase-status
if "%choice%"=="7" goto firebase-emulator
if "%choice%"=="8" goto setup
if "%choice%"=="9" goto firebase-init
if "%choice%"=="0" goto exit
goto invalid

:dev
cls
echo Starting Development Server...
call dev.bat
goto menu

:firebase-deploy
cls
echo Starting Full Firebase Deployment...
call firebase-deploy.bat
goto menu

:firebase-hosting
cls
echo Starting Firebase Hosting Deployment...
call firebase-hosting.bat
goto menu

:firebase-rules
cls
echo Deploying Firestore Rules...
call firebase-rules.bat
goto menu

:git-push
cls
echo Starting Git Push...
call git-push.bat
goto menu

:firebase-status
cls
echo Checking Firebase Status...
call firebase-status.bat
goto menu

:firebase-emulator
cls
echo Starting Firebase Emulator...
call firebase-emulator.bat
goto menu

:setup
cls
echo Starting Project Setup...
call setup.bat
goto menu

:firebase-init
cls
echo Starting Firebase Initialization...
call firebase-init.bat
goto menu

:invalid
cls
echo Invalid choice! Please try again.
timeout /t 2 >nul
goto menu

:exit
cls
echo ========================================
echo    Thank you for using Hobbi Project!
echo ========================================
timeout /t 2 >nul
exit
