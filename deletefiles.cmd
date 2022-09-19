@echo off
setlocal enableDelayedExpansion
cd incoming\temp
for /d /r %%a in (*) do (
    set folder=%%a
    rem echo !folder!
    for /r %%f in (*) do (
        set filename=%%~nf
        echo !filename!
        if /i "!filename:~0,1!"=="t" (
            del "%%f")
    )
)
cd ..