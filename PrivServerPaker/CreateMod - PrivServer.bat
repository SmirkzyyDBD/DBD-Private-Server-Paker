:: credits - smirkzyy
@echo off
title Create Pak

setlocal enableextensions
setlocal enabledelayedexpansion

:main
cls
if "%~1"=="" (
    echo Drag mod folders onto bat file to create mods.
    pause
    exit
) 

:Steam
cls
pushd %~dp0
set /p "ModNumber=What number would you like after pakchunk? (Higher than 348): "
set /a Index=0
for %%a in (%*) do (
    set /a CurrentNumber=ModNumber+Index
    echo "%%~a\*.*" "..\..\..\*.*" > filelist.txt
    echo Paking mod, this may take a while . . .
    Resources\UnrealPak.exe "..\Mods/%%~na/pakchunk!CurrentNumber!%%~na-WindowsNoEditor.pak" -create=../filelist.txt -compress -asynccompression -compressionformat=Oodle -compressmethod=Leviathan -compresslevel=6 -compressionblocksize=256KB -multiprocess
    cd /d "%~dp0\Resources"
    copy /y "copy.sig" "..\Mods\%%~na\pakchunk!CurrentNumber!%%~na-WindowsNoEditor.sig"
    cd /d %~dp0
    del "filelist.txt"
    set /a Index+=1
)
goto :end

:end
pause
exit
