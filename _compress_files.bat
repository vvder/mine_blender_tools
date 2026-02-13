@echo off
setlocal enabledelayedexpansion

:: Set compression format to zip
set "COMPRESS_FORMAT=zip"

:: Compress all folders in current directory
echo Compressing folders...
for /d %%i in (*) do (
    echo Compressing folder: %%i
    tar -a -c -f "%%i.%COMPRESS_FORMAT%" "%%i"
)

:: Compress all .blend files in current directory
echo Compressing .blend files...
for %%i in (*.blend) do (
    echo Compressing file: %%i
    tar -a -c -f "%%~ni.%COMPRESS_FORMAT%" "%%i"
)

echo Compression completed!
pause