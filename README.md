# Classroom Assistant URL Cleaner
**Patrice Boudreault**

Technicien en travaux pratiques

Dept. Informatique, Cegep de Jonquiere

2021-11-01


## Problématique

Lorsque les enseignants utilisent le logiciel [GitHub Classroom Assistant](https://classroom.github.com/assistant) pour télécharger les devoirs des étudiants, le logiciel obtient une jeton d'authentification unique à accès restreint pour clôner le dépôt.

Ce jeton :
  * a une date d'expiration
  * ne permet PAS de faire des *push*


Les enseignants qui désirent créer une branche de correction et la *push* vers GitHub doivent donc manuellement exécuter une série de commandes pour modfier le *remote-url* du dépôt.



## Solution

Ce script automatise le nettoyage du *remote-url* du dépôt, pour enlever le jeton d'authentification unique.

Il remplace les tâches suivantes:



## Déploiement

  * Copier le script **giturl.bat** vers un dossier qui est référencé par la variable système **%PATH%**.

La commande **giturl** deviendra ainsi accessible depuis tous les dossiers sur votre ordinateur.


## Utilisation

En invite de commande (**cmd**), depuis un dossier clôné par l'application **GitHub Classroom Assistant**, invoquer la commande suivante:

    
    giturl
    
