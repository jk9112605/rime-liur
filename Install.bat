@echo off
setlocal enabledelayedexpansion

rem Delete old data
del %AppData%\Rime\*.* /Q
rmdir %AppData%\Rime\opencc /S /Q
xcopy .\Rime\*.* /S %AppData%\Rime\

rem Set folder paths
set "weaselDir_x86=C:\Program Files (x86)\Rime"
set "weaselDir_x64=C:\Program Files\Rime"
set "deployer="

rem Check x86 folder
for /d %%d in ("%weaselDir_x86%\weasel-*") do (
    if exist "%%d\WeaselDeployer.exe" (
        set "deployer=%%d\WeaselDeployer.exe"
    )
)

rem If not found in x86 folder, check x64 folder
if not defined deployer (
    for /d %%d in ("%weaselDir_x64%\weasel-*") do (
        if exist "%%d\WeaselDeployer.exe" (
            set "deployer=%%d\WeaselDeployer.exe"
        )
    )
)

rem Execute deployment
if defined deployer (
    "%deployer%" /deploy
) else (
    echo WeaselDeployer.exe not found.
)
