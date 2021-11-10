@echo off
cls

SET /P CHOICE=Do You want to kill all CAD and Teamcenter related processes? (y or n)?
IF /I "%CHOICE%" NEQ "Y" GOTO END

FOR /L %%i IN (1,1,3) DO (
taskkill /F /IM Teamcenter.exe
taskkill /F /IM VisView.exe
taskkill /F /IM java.exe
taskkill /F /IM javaw.exe
taskkill /F /IM CNEXT.exe
taskkill /F /IM ugraf.exe
taskkill /F /IM "WINDOWTITLE eq myPLM*"
)

CD /D "C:\CAD\MyPlm\myPLM"
start myPLM.bat

:END