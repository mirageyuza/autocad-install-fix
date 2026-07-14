@echo off
setlocal enabledelayedexpansion

echo 正在清理系统垃圾文件，请稍候...

REM 清理Windows临时文件
del /f /s /q %systemroot%\temp\*.*
del /f /s /q %systemroot%\Prefetch\*.*

REM 清理用户临时文件
del /f /s /q "%temp%\*.*"
del /f /s /q "%userprofile%\AppData\Local\Temp\*.*"

REM 清理系统日志（需要管理员权限）
if exist %systemroot%\system32\wevtutil.exe (
    wevtutil cl Application
    wevtutil cl System
    wevtutil cl Security
)

REM 清理Windows更新缓存（需要管理员权限）
net stop wuauserv
net stop bits
del /f /s /q "%systemroot%\SoftwareDistribution\Download\*.*"
net start wuauserv
net start bits

REM 清理缩略图缓存
del /f /s /q "%userprofile%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_*.db"

REM 清理DNS缓存
ipconfig /flushdns

REM 清理回收站（需要管理员权限）
rd /s /q %systemdrive%\$Recycle.bin

REM 执行磁盘清理工具（全自动模式）
cleanmgr /sagerun:1

echo 清理完成！
echo 建议重启计算机使所有更改生效
pause
REM 清理旧系统备份（谨慎使用）
DISM /Online /Cleanup-Image /StartComponentCleanup /ResetBase

REM 清理Microsoft Store缓存
wsreset.exe -i