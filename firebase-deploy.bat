@echo off
echo ========================================
echo Firebase Deployment Script
echo ========================================

echo.
echo 1. Building project...
call npm run build

echo.
echo 2. Deploying to Firebase Hosting...
call firebase deploy --only hosting

echo.
echo 3. Deploying Firestore rules...
call firebase deploy --only firestore:rules

echo.
echo ========================================
echo Firebase deployment completed!
echo ========================================
echo.
echo Your app is now live at:
echo https://hobbi-project-413.web.app
echo.
pause
