@echo off
title Установка пукалки
echo Копируем файлы...
if not exist "C:\ProgramData\puk-utility" mkdir "C:\ProgramData\puk-utility"
copy "%~dp0sun.jpg" "C:\ProgramData\puk-utility\sun.jpg"
copy "%~dp0moon.jpg" "C:\ProgramData\puk-utility\moon.jpg"
copy "%~dp0change_wallpaper.ps1" "C:\ProgramData\puk-utility\change_wallpaper.ps1"

echo Добавляем в планировщик...
schtasks /create /tn "PukUtility" /tr "powershell -File C:\ProgramData\puk-utility\change_wallpaper.ps1" /sc daily /st 00:00 /ru SYSTEM /f
schtasks /create /tn "PukUtilityRepeat" /tr "powershell -File C:\ProgramData\puk-utility\change_wallpaper.ps1" /sc hourly /ru SYSTEM /f

echo Готово! Утилита установлена.
pause
