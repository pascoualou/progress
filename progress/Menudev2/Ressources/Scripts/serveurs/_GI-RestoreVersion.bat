@echo off
call dfvarenv.bat

set VERBOSE=/MIN
if "%VOIR_COMMANDES_DOS%"=="oui" set VERBOSE=

start %VERBOSE% %SER_OUTILS%\progress\Menudev2\Ressources\Scripts\serveurs\RestoreVersion.bat %1 %2 %3 %4

exit
