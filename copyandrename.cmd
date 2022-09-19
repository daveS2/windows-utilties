@echo off
setlocal enableDelayedExpansion
set "source=C:\Users\\Desktop\incoming\temp"
set "dest=C:\Users\\Desktop\outgoing"
cd !source!
for /d %%a in (*) do (
    set "inputfolder=%%a"
    Set "texttoremove=%inputfolder:*.zip=%"
    Call Set outputfolder=%%inputfolder:.zip%texttoremove%=%%
    set "newfolder=!dest!\!outputfolder!"
    echo new folder: !newfolder!
    mkdir "!newfolder!"
    set /A COUNTER=0
    cd %%a
    for /r %%f in (*) do (
        set filename=%%~nf
        echo Source: "!source!\%%a\%%~nf"
	    set /A COUNTER=COUNTER+1
        echo dest: "!newfolder!\!outputfolder!-!COUNTER!.jpg"
        copy /y "%%f" "!newfolder!\!outputfolder!-!COUNTER!.jpg"
    )
    cd ..
)
cd ..