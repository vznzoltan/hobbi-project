@echo off
echo ========================================
echo Firebase Firestore Rules Deployment
echo ========================================

echo.
echo Deploying Firestore rules...
call firebase deploy --only firestore:rules

echo.
echo ========================================
echo Firestore rules deployed successfully!
echo ========================================
pause
