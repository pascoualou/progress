@echo off
call dfvarenv.bat

if "%3"=="pause" goto AVECPAUSE

set VERBOSE=/MIN
if "%VOIR_COMMANDES_DOS%"=="oui" set VERBOSE=

start %VERBOSE% %SER_OUTILS%\progress\Menudev2\Ressources\Scripts\serveurs\Restore.bat %1 %2 %3
goto FIN

:AVECPAUSE
start %SER_OUTILS%\progress\Menudev2\Ressources\Scripts\serveurs\Restore.bat %1 %2 %3

:FIN
exit
