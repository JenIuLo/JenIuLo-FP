

@echo off
SET mypath=%~dp0
SETLOCAL EnableExtensions DisableDelayedExpansion
for /F %%a in ('echo prompt $E ^| cmd') do (
  set "ESC=%%a"
)
SETLOCAL EnableDelayedExpansion
echo %mypath%
cd %mypath%
echo !ESC![101;93m===== 1/3 與遠端同步===== 開始 !ESC![0m
git pull
echo !ESC![92m===== 1/3 與遠端同步===== 結束!ESC![0m
echo.
echo !ESC![101;93m===== 2/3 變更記錄===== 開始!ESC![0m
git add --all
set /p mes=請輸入相關訊息:  

if [%mes%] equ [] (set mes="update")
echo %mes%
git commit -m %mes%
echo !ESC![92m===== 2/3 變更記錄===== 結束!ESC![0m
echo.
echo !ESC![101;93m===== 3/3 上傳更新 ===== 開始!ESC![0m
git push
echo !ESC![92m===== 3/3 上傳更新 ===== 結束!ESC![0m
timeout 10
exit