REM @echo off

REM ***********************************************************************************
REM     Programme : maj.bat
REM     Fonction  : Mise � jour de l environnement et l application Menudev2
REM ***********************************************************************************


REM ---------------------------------------
REM Sauvegarde des fichier de l utilisateur
REM ---------------------------------------
echo Sauvegarde des fichiers de l utilisateur >> %FIC_SUIVI%
copy %windir%\outilsg*.ini %REP_SVG%

REM -------------------
REM Copies des fichiers
REM -------------------
echo Copies des fichiers de la mise a jour >> %FIC_SUIVI%
REM copy %REP_MAJ%\Fichiers\outilsg*.ini %windir%
copy %REP_MAJ%\Fichiers\outilsg*.ini %USERPROFILE%\AppData\Local\Menudev2\Versions\Derniere


