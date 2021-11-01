@echo off
echo =========================================
echo Classroom Assistant URL Cleaner
echo   Patrice Boudreault
echo   Technicien en travaux pratiques
echo   Dept. Informatique, Cegep de Jonquiere
echo   2021-11-01
echo =========================================
echo.
echo URL actuel:
git remote get-url --all origin

REM Copie de l'URL original vers un fichier temporaire...
git remote get-url --all origin > giturltmp.txt

REM Chargement du fichier temporaire dans une variable...
set /p gitupdUrlInitial=< giturltmp.txt

REM Extraction de l'adresse actuelle en eliminant le jeton d'authentification...
for /f "tokens=2 delims=@" %%a in ("%gitupdUrlInitial%") do (
  set gitupdUrlPartiel=%%a
)

echo.
echo Validation...
if defined gitupdUrlPartiel (
  echo.
  echo OK!
) else (
  echo.
  echo *** ERREUR
  echo *** L'URL actuel ne contient pas de jeton d'authentification
  echo *** Aucun changement ne sera fait.
  GOTO nettoyage
)

REM Ajout de https:// au debut de l'URL extrait...
set gitupdUrlFinal=https://%gitupdUrlPartiel%

echo.
echo Mise a jour de l'URL du depot...
git remote set-url origin %gitupdUrlFinal%

echo.
echo URL mis a jour:
git remote get-url --all origin


:nettoyage

echo.
echo Nettoyage...
set gitupdUrlFinal=
set gitupdUrlPartiel=
set gitupdUrlInitial=
del giturltmp.txt