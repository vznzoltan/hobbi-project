@echo off
echo ========================================
echo Firebase Emulator Suite
echo ========================================

echo.
echo Starting Firebase emulators...
echo Press Ctrl+C to stop the emulators
echo.

call firebase emulators:start

echo.
echo ========================================
echo Emulators stopped!
echo ========================================
pause
