@echo off
chcp 65001
title Arrêt programmé du PC by Aroun Le BriCodeur
color b
cls
@echo off
echo Hey ! Bienvenue sur le programme d'arrêt planifié de Aroun.
set /p TimeShut="indique une valeur en minute ( exemple : 1, 10, 60, etc... ) : "
set "ShutSeconde=120"
set /a timeConvert=%TimeShut%*60
cls
echo Tu peux maintenant partir tranquillement te coucher je m'occupe d'éteindre le PC.
echo bonne journée ou bonne nuit ;) 
echo -
echo -
echo -
echo arrêt à la fin du compte à rebours :
if %username% == mcfam (
    echo à bientôt sur le PC de Aroun
) else (
    echo à bientôt sur le PC de %username%
)
TIMEOUT /T %timeConvert% /NOBREAK
shutdown -s -t %ShutSeconde%
