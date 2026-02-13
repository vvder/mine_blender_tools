@echo off
chcp 65001 >nul
echo Processing files with "（副本）" suffix in current directory...
echo.

rem Recursively loop through all files in current directory and subdirectories
for /r %%F in (*) do (
    rem Enable delayed variable expansion
    setlocal enabledelayedexpansion
    
    rem Get filename with extension (without path)
    set "filename=%%~nxF"
    
    rem Check if filename contains "（副本）"
    if "!filename:（副本）=!" neq "!filename!" (
        rem File contains "（副本）" suffix
        echo Checking: "%%F" - Contains "（副本）" suffix
        
        rem Generate new filename (remove "（副本）")
        set "newfilename=!filename:（副本）=!"
        rem Combine with directory path to get new full path
        set "newfile=%%~dpF!newfilename!"
        
        rem Check if new filename already exists
        if not exist "!newfile!" (
            rem Perform rename operation
            echo Renaming: "%%F" → "!newfile!"
            ren "%%F" "!newfile!"
        ) else (
            rem New filename already exists, skip
            echo Skipping: "%%F" - Target file "!newfile!" already exists
        )
    ) else (
        rem File does not contain "（副本）" suffix
        echo Checking: "%%F" - No "（副本）" suffix
    )
    
    endlocal
)

echo.
echo Processing completed!
pause