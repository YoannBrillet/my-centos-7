# Script de configuration post-installation pour serveur CentOS 7

(c) Niki Kovacs, 2020
(Traduciton par : Couruss, yoann.brillet@ynov.com)

Ce depot fournis un script "automagique" de configuration post-installation pour les serveurs sopus Centos 7 ainsi qu'une collection de script d'aide et de fichiers de configuration par defaut pour des services communs. 

## En bref

Suivez ces etapes :

  1. Installez un systeme CentOS 7 minimal.

  2. Creer un utilisateur avec des droits administrateur qui ne soit pas `root`.

  3. Installez Git : `sudo yum install git` 

  4. Clonez ce depot : `git clone https://gitlab.com/kikinovak/centos-7.git`

  5. Entrez dans le dossier: `cd centos-7`

  6. Lancez le script : `sudo ./centos-setup.sh --setup`

  7. Prenez un cafe pendant que le script fait tout le travail.

  8. Redemarrez.


## Personnaliser un serveur CentOS 7

Turning a minimal CentOS installation into a functional server always boils
down to a series of more or less time-consuming operations. Your mileage may
vary of course, but here's what I usually do on a fresh CentOS installation:

Changer un serveur minimal CentOS en un serveur fonctionnel est toujours une suite d'action plus ou moins longue a effectuer. 
Il est possible que votre habitudes soit deffernetes mais voici ce que je fait sur une nouvelle installation de CentOS habituellement :

  * Personalisation du shell Bash : prompt, aliases, etc.

  * Personnalisation de Vim.

  * Ajout de depot de paquets officiels et non officiels.

  * Installation d'outils utiles.

  * Desinstallation de paquets inutiles.

  * Activation de l'acces au logs systeme pour les utilisateurs d'administration.

  * Desactivation complete d'IPv6 (et reconfigurations des services associés).
  
  * Configuration d'un mot de passe persistant pour `sudo`.

  * Etc.

Le script `centos-setup.sh` deroule toute ces actions.

Configuration de Bash et de Vim et configuration d'une resolution de console plus lisible :

```
# ./centos-setup.sh --shell
```

Ajout de depot de paquets officiels et non officiels.<Paste>

```
# ./centos-setup.sh --repos
```

Installation des groupes de paquets `Core` et `Base` avec quelques outils supplementaires :

```
# ./centos-setup.sh --extra
```

Desinstallation de paquets inutiles :

```
# ./centos-setup.sh --prune
```

Activation de l'acces au logs systeme pour les utilisateurs d'administration :

```
# ./centos-setup.sh --logs
```

Desactivation complete d'IPv6 (et reconfigurations des services associés) :

```
# ./centos-setup.sh --ipv4
```

Configuration d'un mot de passe persistant pour `sudo` :

```
# ./centos-setup.sh --sudo
```

Fait toutes les actions lister si dessus :

```
# ./centos-setup.sh --setup
```

Supprime les paquets et reviens au systeme de base :

```
# ./centos-setup.sh --strip
```

Affiche l'aide :

```
# ./centos-setup.sh --help
```

Si vous voulez voir ce qu'il ce passe sous le capot, ouvrez un second terminal et regardez les logs :

```
$ tail -f /tmp/centos-setup.log
```

