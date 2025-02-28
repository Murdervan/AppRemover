@echo off
:: Check if the script is running as administrator
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Running as Administrator is required.
    echo Restarting with Administrator privileges...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb RunAs"
    exit
)

cls
echo ====================================
echo          Microsoft App Remover
echo         made by Murdervan        
echo https://github.com/murdervan/
echo ====================================
echo.
echo This CMD script allows you to remove unwanted Microsoft apps from Windows.
echo Select the apps you want to remove by entering their numbers separated by spaces.
echo.

:MENU
echo ===========================
echo      Microsoft App Remover Menu 
echo ===========================
echo.

echo Essential Removals:
echo 1. Remove Microsoft Store
echo 2. Remove Microsoft Get Started
echo 3. Remove Microsoft Get Help
echo.

echo Gaming Apps:
echo 4. Remove Xbox Gaming Overlay
echo 5. Remove Xbox App
echo 6. Remove Xbox Speech-to-Text Overlay
echo 7. Remove Xbox Identity Provider
echo.

echo Office and Communication:
echo 8. Remove Microsoft Teams
echo 9. Remove Microsoft OneDrive
echo 10. Remove Microsoft Office Hub
echo 11. Remove Microsoft Skype
echo.

echo Entertainment and News:
echo 12. Remove Microsoft Solitaire Collection
echo 13. Remove Microsoft News
echo 14. Remove Microsoft Photos
echo 15. Remove Microsoft Movies  TV
echo.

echo Productivity and Tools:
echo 16. Remove Microsoft Alarms  Clock
echo 17. Remove Microsoft Weather
echo 18. Remove Windows Mail & Calendar
echo 19. Remove Windows Camera
echo 20. Remove Windows Maps
echo 21. Remove Microsoft Paint
echo.

echo Miscellaneous:
echo 22. Remove Microsoft Edge
echo 23. Remove Windows Feedback Hub
echo 24. Remove 3D Builder
echo.
echo 25. Remove ALL listed apps
echo 26. Check Installed Microsoft Apps
echo 27. Exit
echo.

set /p choice=Choose apps to remove (e.g., 1 2 3 for Store, Get Started, and Get Help): 

for %%a in (%choice%) do (
    if %%a==1 powershell -Command "Get-AppxPackage -allusers *WindowsStore* | Remove-AppxPackage"
    if %%a==2 powershell -Command "Get-AppxPackage -allusers *Microsoft.Getstarted* | Remove-AppxPackage"
    if %%a==3 powershell -Command "Get-AppxPackage *Microsoft.GetHelp* -AllUsers | Remove-AppxPackage"
    if %%a==4 powershell -Command "Get-AppxPackage -AllUsers *Microsoft.XboxGamingOverlay* | Remove-AppxPackage"
    if %%a==5 powershell -Command "Get-AppxPackage *Microsoft.XboxApp* | Remove-AppxPackage"
    if %%a==6 powershell -Command "Get-AppxPackage *Microsoft.XboxSpeechToTextOverlay* | Remove-AppxPackage"
    if %%a==7 powershell -Command "Get-AppxPackage *Microsoft.XboxIdentityProvider* | Remove-AppxPackage"
    if %%a==8 powershell -Command "Get-AppxPackage *MicrosoftTeams* | Remove-AppxPackage"
    if %%a==9 powershell -Command "Get-AppxPackage *Microsoft.OneDrive* | Remove-AppxPackage"
    if %%a==10 powershell -Command "Get-AppxPackage *Microsoft.OfficeHub* | Remove-AppxPackage"
    if %%a==11 powershell -Command "Get-AppxPackage *Microsoft.SkypeApp* | Remove-AppxPackage"
    if %%a==12 powershell -Command "Get-AppxPackage *MicrosoftSolitaireCollection* | Remove-AppxPackage"
    if %%a==13 powershell -Command "Get-AppxPackage *Microsoft.News* | Remove-AppxPackage"
    if %%a==14 powershell -Command "Get-AppxPackage *Microsoft.Windows.Photos* | Remove-AppxPackage"
    if %%a==15 powershell -Command "Get-AppxPackage *Microsoft.ZuneVideo* | Remove-AppxPackage"
    if %%a==16 powershell -Command "Get-AppxPackage *Microsoft.Alarms* | Remove-AppxPackage"
    if %%a==17 powershell -Command "Get-AppxPackage *Microsoft.BingWeather* | Remove-AppxPackage"
    if %%a==18 powershell -Command "Get-AppxPackage *microsoft.windowscommunicationsapps* | Remove-AppxPackage"
    if %%a==19 powershell -Command "Get-AppxPackage *Microsoft.WindowsCamera* | Remove-AppxPackage"
    if %%a==20 powershell -Command "Get-AppxPackage *Microsoft.WindowsMaps* | Remove-AppxPackage"
    if %%a==21 powershell -Command "Get-AppxPackage *Microsoft.MSPaint* | Remove-AppxPackage"
    if %%a==22 powershell -Command "Get-AppxPackage *Microsoft.MicrosoftEdge* | Remove-AppxPackage"
    if %%a==23 powershell -Command "Get-AppxPackage *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage"
    if %%a==24 powershell -Command "Get-AppxPackage *Microsoft.3DBuilder* | Remove-AppxPackage"
    if %%a==25 call :RemoveAll
    if %%a==26 call :CheckInstalled
    if %%a==27 exit
)

goto MENU

:RemoveAll
echo Removing all listed Microsoft apps...
powershell -Command "
Get-AppxPackage -allusers *WindowsStore* | Remove-AppxPackage;
Get-AppxPackage *Microsoft.YourPhone* -AllUsers | Remove-AppxPackage;
Get-AppxPackage -AllUsers *Microsoft.Getstarted* | Remove-AppxPackage;
Get-AppxPackage *Microsoft.GetHelp* -AllUsers | Remove-AppxPackage;
Get-AppxPackage -AllUsers *Microsoft.XboxGamingOverlay* | Remove-AppxPackage;
Get-AppxPackage *Microsoft.XboxApp* | Remove-AppxPackage;
Get-AppxPackage *Microsoft.XboxSpeechToTextOverlay* | Remove-AppxPackage;
Get-AppxPackage *Microsoft.XboxIdentityProvider* | Remove-AppxPackage;
Get-AppxPackage *MicrosoftTeams* | Remove-AppxPackage;
Get-AppxPackage *Microsoft.OneDrive* | Remove-AppxPackage;
Get-AppxPackage *MicrosoftSolitaireCollection* | Remove-AppxPackage;
Get-AppxPackage *Microsoft.News* | Remove-AppxPackage;
Get-AppxPackage *Microsoft.Windows.Photos* | Remove-AppxPackage;
Get-AppxPackage *Microsoft.ZuneVideo* | Remove-AppxPackage;
Get-AppxPackage *Microsoft.Alarms* | Remove-AppxPackage;
Get-AppxPackage *Microsoft.BingWeather* | Remove-AppxPackage;
Get-AppxPackage *microsoft.windowscommunicationsapps* | Remove-AppxPackage;
Get-AppxPackage *Microsoft.WindowsCamera* | Remove-AppxPackage;
Get-AppxPackage *Microsoft.WindowsMaps* | Remove-AppxPackage;
Get-AppxPackage *Microsoft.MSPaint* | Remove-AppxPackage;
Get-AppxPackage *Microsoft.MicrosoftEdge* | Remove-AppxPackage;
Get-AppxPackage *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage;
Get-AppxPackage *Microsoft.3DBuilder* | Remove-AppxPackage;
"
echo All apps have been removed.
goto MENU

:CheckInstalled
echo Checking installed Microsoft apps...
powershell -Command "Get-AppxPackage -AllUsers | Select Name"
echo.
pause
goto MENU
