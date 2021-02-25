# bruteforce-su

Cet outil **bruteforce un utilisateur sélectionné** en utilisant `su` et comme mots de passe : **mot de passe nul, pseudonyme, pseudonyme inversé et une liste de mots (4po1200.txt).**

Vous pouvez spécifier un pseudonyme en utilisant `-u <username> et une liste de mots via `-w <wordlist>`.

Par **défaut** la vitesse par défaut du BF est d'utiliser 100 processus su en même temps (chaque su essaye les dernières 0.7s et un nouveau su essaye dans 0.007). Il faut 143s pour compléter **.

Vous pouvez configurer ces temps en utilisant `-t` (timeout `su` process) et `-s` (sleep between 2 `su` processes).

**Recommandation la plus rapide** : t O.5 (minimum acceptable) et s 0.003 ~ **108s pour compléter.
``` 
./suBF.sh -u <USERNAME> [-w 4po1200.txt] [-t 0.7] [-s 0.0007]
```
