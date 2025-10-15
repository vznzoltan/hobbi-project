@echo off
echo ========================================
echo Firebase Project Status
echo ========================================

echo.
echo Current Firebase project:
call firebase projects:list

echo.
echo Current project details:
call firebase use

echo.
echo Firebase hosting sites:
call firebase hosting:sites:list

echo.
echo ========================================
echo Status check completed!
echo ========================================
pause
