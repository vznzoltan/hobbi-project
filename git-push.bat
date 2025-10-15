@echo off
echo ========================================
echo Hobbi Project - Git Push Script
echo ========================================

echo.
echo 1. Adding all files...
git add .

echo.
echo 2. Committing changes...
set /p commit_message="Enter commit message: "
git commit -m "%commit_message%"

echo.
echo 3. Pushing to GitHub...
git push

echo.
echo ========================================
echo Git push completed!
echo ========================================
pause
