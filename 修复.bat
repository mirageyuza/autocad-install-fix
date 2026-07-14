@echo off

net session >nul 2>&1

if %errorlevel% neq 0 (echo 右键管理员运行 && pause && exit /b)

echo ============================================

echo   AutoCAD 89%% 回退修复 - 免重启版

echo ============================================

echo 1. 杀掉冲突进程...

taskkill /f /im acad.exe >nul 2>&1

taskkill /f /im setup.exe >nul 2>&1

taskkill /f /im msiexec.exe >nul 2>&1

taskkill /f /im AdskLicensingService.exe >nul 2>&1

echo 2. 修复授权服务...

sc stop AdskLicensingService >nul 2>&1

sc config AdskLicensingService start= auto >nul 2>&1

sc config AdskLicensingService obj= LocalSystem >nul 2>&1

timeout /t 2 >nul

sc start AdskLicensingService >nul 2>&1

echo 3. 卸载卡89%%的材质库...

wmic product where "name like '%%Material Library%%'" call uninstall /nointeractive >nul 2>&1

wmic product where "name like '%%Autodesk Material%%'" call uninstall /nointeractive >nul 2>&1

wmic product where "name like '%%Recap%%'" call uninstall /nointeractive >nul 2>&1

msiexec /x {A4E5D97F-7933-47C2-890C-0A6E5A0E7ECF} /qn >nul 2>&1

msiexec /x {6AB9E00A-7E90-44D2-8591-7D91DE5458E2} /qn >nul 2>&1

echo 4. 删除材质库残留文件...

rd /s /q "C:\Program Files (x86)\Common Files\Autodesk Shared\Materials" >nul 2>&1

rd /s /q "C:\Program Files\Common Files\Autodesk Shared\Materials" >nul 2>&1

rd /s /q "C:\Autodesk\WI\Autodesk AutoCAD 2027" >nul 2>&1

echo 5. 删除 C:\Autodesk 安装缓存...

rd /s /q "C:\Autodesk" >nul 2>&1

echo 6. 清空临时文件...

del /f /s /q "%TEMP%\*.*" >nul 2>&1

del /f /s /q "C:\Windows\Temp\*.*" >nul 2>&1

del /f /s /q "%USERPROFILE%\AppData\Local\Temp\*.*" >nul 2>&1

echo 7. 重置安装服务...

msiexec /unregister >nul 2>&1

msiexec /regserver >nul 2>&1

sc stop msiserver >nul 2>&1

sc start msiserver >nul 2>&1

echo 8. 关闭 Windows Defender...

powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true" >nul 2>&1

echo.

echo ===== 修复完成 =====

echo.

echo 安装时务必选【自定义安装】

echo 取消勾选：Material Library、Recap、Docs

echo.

echo 正在启动安装程序...

"D:\CAD2027\CAD2027\Setup\setup.exe"

pause