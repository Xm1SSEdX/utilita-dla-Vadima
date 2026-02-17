# Пути к картинкам
$day = "C:\ProgramData\PukUtility\sun.jpg"
$night = "C:\ProgramData\PukUtility\moon.jpg"

# Время
$time = Get-Date -Format "HH:mm"
$sunrise = "06:00"
$sunset = "20:00"

# Функция смены обоев
Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Wall {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

if ($time -ge $sunrise -and $time -lt $sunset) {
    [Wall]::SystemParametersInfo(20, 0, $day, 0x02)
} else {
    [Wall]::SystemParametersInfo(20, 0, $night, 0x02)
}
