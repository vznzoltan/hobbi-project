@echo off
echo ========================================
echo Firebase Hosting Deployment
echo ========================================

echo.
echo 1. Building project...
call npm run build

echo.
echo 2. Deploying to Firebase Hosting...
call firebase deploy --only hosting

echo.
echo ========================================
echo Hosting deployment completed!
echo ========================================
echo.
echo Your app is now live at:
echo https://hobbi-project-413.web.app
echo.
pause
