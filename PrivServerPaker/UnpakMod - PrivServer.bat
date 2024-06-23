:: credits - smirkzyy
@echo off
title Unpak Mod

if "%~1"=="" (
    echo Drag paks onto bat file to unpak mods.
    pause
    exit
) 

if not "%~x1"==".pak" (
    echo Only .pak files can be unpaked.
    pause 
    exit
)

echo Unpaking mod, this may take a while . . .
setlocal enableextensions
pushd %~dp0
"Resources\Engine\Binaries\Win64\UnrealPak.exe" %1 -extract "../../../../Unpaked/"%~n1"" -extracttomountpoint
popd
pause
endlocal
exit