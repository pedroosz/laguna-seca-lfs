@echo off
setlocal
rem Restores the original Blackwood world and lighting.
rem Usage: double-click, or: uninstall.bat "D:\Games\LFS"

set "LFS=%~1"
if "%LFS%"=="" set /p "LFS=LFS folder [C:\LFS]: "
if "%LFS%"=="" set "LFS=C:\LFS"
set "WLD=%LFS%\data\wld"
if not exist "%WLD%\BLACKWOOD.wld.original" (
  echo No backup found in "%WLD%" - nothing to restore.
  pause & exit /b 1
)
tasklist /fi "imagename eq LFS.exe" | find /i "LFS.exe" >nul && (
  echo Please close LFS first.
  pause & exit /b 1
)

copy /y "%WLD%\BLACKWOOD.wld.original" "%WLD%\BLACKWOOD.wld" >nul && del "%WLD%\BLACKWOOD.wld.original"
if exist "%WLD%\BLACKWOOD.lgh.original" if not exist "%WLD%\BLACKWOOD.lgh" ren "%WLD%\BLACKWOOD.lgh.original" "BLACKWOOD.lgh"

echo.
echo Stock Blackwood restored. (The LAG_*.dds textures in data\dds are harmless and can be deleted.)
pause
