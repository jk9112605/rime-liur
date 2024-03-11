xcopy .\Rime\*.* /S %AppData%\Rime\
@echo off
setlocal enabledelayedexpansion

set "weaselDir=C:\Program Files (x86)\Rime"
set "deployer="

for /d %%d in ("%weaselDir%\weasel-*") do (
    if exist "%%d\WeaselDeployer.exe" (
        set "deployer=%%d\WeaselDeployer.exe"
    )
)

if defined deployer (
    "%deployer%" /deploy
) else (
    echo WeaselDeployer.exe not found.
)

