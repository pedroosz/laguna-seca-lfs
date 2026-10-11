@echo off
setlocal
rem Installs Laguna Seca in place of Blackwood.
rem Usage: double-click, or: install.bat "D:\Games\LFS"

set "LFS=%~1"
if "%LFS%"=="" set /p "LFS=LFS folder [C:\LFS]: "
if "%LFS%"=="" set "LFS=C:\LFS"
if not exist "%LFS%\LFS.exe" (
  echo Could not find LFS.exe in "%LFS%".
  pause & exit /b 1
)
tasklist /fi "imagename eq LFS.exe" | find /i "LFS.exe" >nul && (
  echo Please close LFS first.
  pause & exit /b 1
)

set "WLD=%LFS%\data\wld"
rem Keep the original Blackwood once, so uninstall.bat can restore it.
if not exist "%WLD%\BLACKWOOD.wld.original" copy /y "%WLD%\BLACKWOOD.wld" "%WLD%\BLACKWOOD.wld.original" >nul
if exist "%WLD%\BLACKWOOD.lgh" (
  if exist "%WLD%\BLACKWOOD.lgh.original" (
    echo Both BLACKWOOD.lgh and BLACKWOOD.lgh.original exist - please sort them out by hand.
    pause & exit /b 1
  )
  ren "%WLD%\BLACKWOOD.lgh" "BLACKWOOD.lgh.original"
)
copy /y "%~dp0data\wld\BLACKWOOD.wld" "%WLD%\BLACKWOOD.wld" >nul
xcopy /y /q "%~dp0data\dds\*.dds" "%LFS%\data\dds\" >nul

echo.
echo Laguna Seca installed. Select Blackwood - GP Track in LFS.
echo Run uninstall.bat to go back to stock Blackwood.
pause
