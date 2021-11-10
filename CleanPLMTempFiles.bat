@echo off
cls

setlocal
:PROMPT

echo Script will remove temporary files according good practics while PLM problems occurs.
echo KVS files (C:\temp\KVS_Exchange) will not be deleted.
SET /P AREYOUSURE=Do You want to continue? (y or n)?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END

taskkill /F /IM Teamcenter.exe
taskkill /F /IM VisView.exe
taskkill /F /IM java.exe
taskkill /F /IM javaw.exe
taskkill /F /IM Teamcenter.exe
taskkill /F /IM VisView.exe
taskkill /F /IM java.exe
taskkill /F /IM javaw.exe

attrib +r +s %SystemDrive%\temp\KVS_Exchange\* /S /D

del /S /Q /A:-R %SystemDrive%\temp\*

attrib -r -s %SystemDrive%\temp\KVS_Exchange\* /S /D

del /S /F /Q %HOMEDRIVE%%HOMEPATH%\*.log %HOMEDRIVE%%HOMEPATH%\*log.lck

for /R %TMP% %%i in (*.TMP) do del /S /F /Q %%i

del /S /F /Q %HOMEDRIVE%%HOMEPATH%\Teamcenter\RAC

del /S /F /Q %HOMEDRIVE%%HOMEPATH%\FCCCache\%USERNAME%\*



:END
endlocal


