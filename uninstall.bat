@echo off
schtasks /delete /tn "PukUtilityStartup" /f
schtasks /delete /tn "PukUtilityHourly" /f
rmdir /s /q "C:\ProgramData\PukUtility"
echo Удалено.
pause
