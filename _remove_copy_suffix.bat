@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo Processing files ending with "（副本）"...
echo.

for /r %%F in (*) do (
    set "filename=%%~nxF"
    
    rem 只匹配结尾是（副本）
    if "!filename:~-5!"=="（副本）" (
        
        set "newfilename=!filename:~0,-5!"
        
        if not exist "%%~dpF!newfilename!" (
            echo Renaming:
            echo    Old: %%F
            echo    New: %%~dpF!newfilename!
            ren "%%F" "!newfilename!"
            echo.
        ) else (
            echo Skipped (exists): %%F
        )
    )
)

echo Done.
pause
endlocal
